# grpc-rust-java-web
Connect rust, java and the browser using rust grpc framework tonic, java grpc and grpc-web. We use a simple echo.proto(./rust/server/proto/echo.proto) definition to implement grpc server and clients in java and rust. Next, we use the same echo.proto definition to implement a browser client using grpc-web. 


1) Clone this repository to a ubuntu machine(This has been tested in buster and various flavors of ubuntu).
2) Run ./compile.sh - from the root directory. This would compile rust and java client and server implementations.
3) Next we can run "./run.sh java server" - to run java grpc server.
4) We can run "./run.sh java client" - to run the java grpc client.
5) If both java and rust grpc servers are running - calls to java server would be delegated to rust and vice versa.

Access the grpc services from browser:
7) Post compilation - navigate to  
