package grpc.java.client;

import echo.EchoGrpc;
import echo.EchoOuterClass.EchoRequest;
import echo.EchoOuterClass.EchoResponse;
import io.grpc.ManagedChannel;
import io.grpc.ManagedChannelBuilder;

public class Client
{
    public static void main(String[] args) throws InterruptedException {
        String grpc_server = System.getenv("GRPC_SERVER");
	if(grpc_server  == null) {
	   grpc_server="0.0.0.0:31031";
	}
        ManagedChannel channel = ManagedChannelBuilder.forTarget(grpc_server)
        //ManagedChannel channel = ManagedChannelBuilder.forAddress("0.0.0.0", 31031)
        .usePlaintext()
        .build();
	EchoGrpc.EchoBlockingStub  stub =
        EchoGrpc.newBlockingStub(channel);

	EchoResponse sayResponse = stub.echo(
        EchoRequest.newBuilder()
            .setMessage("Client message!")
            .build());

        System.out.println(sayResponse);
        channel.shutdown();
    }
}
