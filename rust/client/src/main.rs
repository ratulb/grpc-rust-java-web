mod echo;

use std::env;
use tonic::Request;
use echo::EchoRequest;
use tonic::transport::Channel;
use echo::echo_client::EchoClient;

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    let request = Request::new(EchoRequest {
        message: String::from("Client hello"),
    });
    let server_addr = match env::var("GRPC_SERVER") {
        Ok(sa) => sa,
        Err(_) => String::from("http://0.0.0.0:30031"),
    };
    let channel = Channel::from_shared(server_addr).unwrap()
        .connect()
        .await?;
    let mut client = EchoClient::new(channel);
    let response = client.echo(request).await?;
    println!("{:?}", response.into_inner());
    Ok(())
}
