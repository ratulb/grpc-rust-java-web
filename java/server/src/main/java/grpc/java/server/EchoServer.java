package grpc.java.server;

import echo.EchoGrpc;
import echo.EchoOuterClass.EchoRequest;
import echo.EchoOuterClass.EchoResponse;
import echo.EchoGrpc.EchoImplBase;
import io.grpc.ManagedChannel;
import io.grpc.ManagedChannelBuilder;
import io.grpc.Metadata;
import io.grpc.Server;
import io.grpc.ServerBuilder;
import io.grpc.stub.StreamObserver;
import java.net.InetAddress;
import io.grpc.ServerInterceptors;
import java.util.List;
import java.util.ArrayList;
import java.util.StringTokenizer;
import io.grpc.stub.MetadataUtils;

public class EchoServer extends EchoImplBase {
	private int port;
	private String name = "java-grpc-service";
	private List<String> delegates;
        
	public EchoServer(){
	  String listenPort = System.getenv("SERVER_PORT");
	  if(listenPort != null) {
             try {
               port = Integer.parseInt(listenPort);
             }catch(Exception e) {
                 e.printStackTrace(System.err);
                 port = 31031;
             }
	  }else{
             port = 31031;
	  }
	  System.out.println("Server listen port:"+ port);
	    delegates = new ArrayList<>();
            String peers = System.getenv("DELEGATES");
	    if(peers != null) {
              StringTokenizer tokenizer = new StringTokenizer(peers, " ");
	      while(tokenizer.hasMoreTokens()){
                String nextDelegate = tokenizer.nextToken();
		delegates.add(nextDelegate);
	      }
	      System.out.println("Delegates: "+ delegates);
	    }
	    String serviceName = name + ":" + port;
	    delegates.remove(serviceName);
	}

	public static void main(String[] args)throws Exception {
            EchoServer echoServer = new EchoServer();
            Server server = ServerBuilder.forPort(echoServer.port)
                  .addService(ServerInterceptors.intercept(echoServer, new RequestInterceptor())).build();
            server.start();
            server.awaitTermination();
    }

 @Override
 public void echo(EchoRequest request,
      StreamObserver<EchoResponse> responseObserver) {
      Metadata headers = (Metadata) RequestInterceptor.INTERCEPTED_HEADERS.get(); 
      System.out.println("The headers: " + headers);
      Metadata.Key<String> key = RequestInterceptor.INJECTED_KEY;
      boolean injected = "java".equals(headers.get(key));
      EchoResponse response = null;
      if(injected) {
         response = delegateEchoRequest(request);
      }
      if(response != null) {
      	  responseObserver.onNext(response);
          responseObserver.onCompleted();
      }else {
          handleEchoRequestSelf(request, responseObserver);
      }
    }
    
     
    private void handleEchoRequestSelf(EchoRequest req, StreamObserver<EchoResponse> responseObserver ) {
        try {
           String resp = "java grpc server["
		 + InetAddress.getLocalHost().getHostName()+"] received - " 
		 + req.getMessage();
           EchoResponse response = EchoResponse.newBuilder().setMessage(resp).build();
           responseObserver.onNext(response);
           responseObserver.onCompleted();
        }catch(Exception e) {
           System.err.println(e.getMessage());
       }
    }
    
    private EchoResponse delegateEchoRequest(EchoRequest req) {
       	if(delegates.isEmpty()){
          	System.out.println("No delegate for java grpc ! Would handle request self.");
          	return null;
       	}
	EchoResponse delegateResponse = null;
       	for(String delegate : delegates) {
	   try  {
		System.out.println("Trying delegate :"+ delegate );
        	ManagedChannel channel = ManagedChannelBuilder.forTarget(delegate)
        	.usePlaintext()
        	.build();
        	EchoGrpc.EchoBlockingStub  stub = EchoGrpc.newBlockingStub(channel);
		Metadata metadata = new Metadata();
		Metadata.Key<String> key = RequestInterceptor.INJECTED_KEY;
		metadata.put(key, "java");
		stub = MetadataUtils.attachHeaders(stub, metadata);
        	delegateResponse  = stub.echo(req);
    		channel.shutdown();
                if(delegateResponse != null)
		    break;
           }catch(Exception e) {
		e.printStackTrace(System.err);
		continue;
	   }
    	}
	return delegateResponse;
    }
}
