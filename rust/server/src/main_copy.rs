mod echo;
use std::env;
use std::error::Error;
use echo::{EchoRequest, EchoResponse};
use echo::echo_server::{Echo, EchoServer};
use tonic::{transport::Server, Request, Response, Status};

#[derive(Default)]
pub struct EchoServerR {}

#[tonic::async_trait]
 impl Echo for EchoServerR {
    async fn echo(&self, request: Request<EchoRequest>) 
        -> Result<Response<EchoResponse>, Status> {
        Ok(Response::new(EchoResponse {
            message: format!(
                "Rust grpc serve received - {}",
                request.get_ref().message
            ),
        }))
    }
}
#[tokio::main]
async fn main() -> Result<(), Box<dyn Error>> {
    let port = env::var("PORT").unwrap_or(String::from("30031"));
    let addr = String::from("0.0.0.0:")+ &port;
    println!("Server starting at port:{}", port);
    Server::builder()
        .add_service(EchoServer::new(EchoServerR::default()))
        .serve(addr.parse().unwrap())
        .await?;
    Ok(())
}
