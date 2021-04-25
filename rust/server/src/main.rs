mod echo;
use std::env;
use std::result::Result;
use std::error::Error;
use tonic::transport::Channel;
use echo::echo_client::EchoClient;
use echo::echo_server::{Echo, EchoServer};
use echo::{EchoRequest, EchoResponse};
use tonic::{transport::Server, Request, Response, Status};

pub struct EchoServerR {
    //Names of delegate services
    delegates: Vec<String>,
}

impl EchoServerR {
    pub fn new(addr: &String, mut delegate_names: Vec<String>) -> Self {
        delegate_names.retain(|entry| *entry != *addr);
        println!("Rust grpc server delegates: {:?}", delegate_names);
        EchoServerR {
            delegates: delegate_names,
        }
    }
}

#[tonic::async_trait]
impl Echo for EchoServerR {
   async fn echo(&self, request: Request<EchoRequest>) -> Result<Response<EchoResponse>, Status> {
        let metadata =  request.metadata();
        println!("Request metadata: {:?}", metadata);
        let injected = !metadata.contains_key("x-interceptor");
        println!("Received client message ->  {}",  request.get_ref().message);
        if self.delegates.len() > 0 && injected {
            for delegate in &self.delegates {
                let mut delegate_req = Request::new(request.get_ref().clone());
                delegate_req.metadata_mut().insert("x-interceptor", "rust".parse().unwrap());
                println!("Delegated request metadata: {:?}", delegate_req.metadata());
                let delegate_resp = delegate_request(delegate_req, delegate.to_string()).await;
                match delegate_resp {
                    Ok(resp) => return Ok(Response::new(resp)),
                    Err(_err) => {
                        continue;
                    },
                };
            }
        }
        //Either no delegate or delegates failed - respond self
        Ok(Response::new(EchoResponse {
            message: format!(
                "Rust grpc server[{:?}] received - {}",
                hostname::get()?,
                request.get_ref().message
            ),
        }))
    }
}

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    let port = env::var("SERVER_PORT").unwrap_or(String::from("30031")); 
    let addr = String::from("0.0.0.0:") + &port;
    let delegates = match env::var("DELEGATES") {
        Ok(svcs) => svcs,
        Err(_) => String::new(),
    };
    println!("Server starting on  {}", addr);
    let delegates = delegates
        .split_whitespace()
        .map(|s| s.to_owned())
        .collect::<Vec<String>>();
    let svr = EchoServerR::new(&addr, delegates);
    //let proxy_key = "NO_PROXY";
    //env::set_var(proxy_key, "localhost");
    Server::builder()
        .add_service(EchoServer::new(svr))
        .serve(addr.parse().unwrap())
        .await?;
    Ok(())
}


async fn delegate_request(request: Request<EchoRequest>, sa: String) 
    -> Result<EchoResponse, Box<dyn Error>> {
    println!("Delegating request");
    let channel = Channel::from_shared(sa)
    .unwrap()
    .connect()
    .await?;
    println!("Awaiting");
    let mut client = EchoClient::new(channel);
    let response = client.echo(request).await;
    match response {
        Ok(resp) => return Ok(resp.into_inner()),
        Err(err) => { 
            println!("The error is: {:?}", err);
            return Err(Box::new(err));
        },
    }
}
