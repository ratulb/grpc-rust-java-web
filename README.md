# grpc-rust-java-web
Connect rust, java and the browser using rust grpc framework tonic, java grpc and grpc-web. We use a simple echo.proto(./rust/server/proto/echo.proto) definition to implement grpc server and clients in java and rust. Next, we use the same echo.proto definition to implement a browser client using grpc-web. 


1) Clone this repository to a ubuntu machine(This has been tested in buster and various flavors of ubuntu).
2) Run ./compile.sh - from the root directory. This would compile rust and java client and server implementations.
3) Navigate to ./envoy folder and run ./setup.sh - this would install envoy proxy server locally.
4) Navigate to ./web folder and run ./setup.sh. This would install tomcat server locally and setup grpc-web app.
5) Navigate back to the root folder and run "./run.sh" - this would run rust and java grpc servers, envoy proxy and tomcat webserver.
6) Browse the grpc-web application at http://localhost:8080/client

