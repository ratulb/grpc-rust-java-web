# grpc-rust-java-web
Connect rust, java and the browser using rust grpc framework tonic, java grpc and grpc-web. We use a simple echo.proto(./rust/server/proto/echo.proto) definition to implement grpc server and clients in java and rust. Next, we use the same echo.proto definition to implement a browser client using grpc-web. 


1) Clone this repository to a ubuntu machine(This has been tested in buster and various flavors of ubuntu).
2) Run ./compile.sh - from the root directory. This would compile rust and java client and server implementations.
3) Navigate to ./envoy folder and run ./setup.sh - this would install envoy proxy server locally.
4) Navigate to ./web folder and run ./setup.sh. This would install tomcat server locally and setup grpc-web app.
5) Navigate back to the root folder and run "./run.sh" - this would run rust and java grpc servers, envoy proxy and tomcat webserver.
6) Browse the grpc-web application at http://localhost:8080/client

Run a grpc server/client selectively

1. From the project root folder, run "./run.sh rust server". This would launch the rust grpc server.
2. We can "./run.sh rust client" - to run the rust client. Likewise, for java.
3. We can pass on the GRPC_SERVER=[ip:port] - for target grpc server - while running the client.

Run the grpc-curl.sh script:

1. Launch grpc-curl.sh script from these folders ./rust/server, ./java/server/ etc. We might need to pass on the GRPC_SERVER environmnt variable - if envoy proxy is not running.

Containerizing the rust and java grpc implementations and the envoy proxy:

1. For grpc rust - the Dockerfile is: https://github.com/ratulb/grpc-rust-java-web/blob/main/rust/server/Dockerfile
2. Commands for building - image and pushing to docker hub is located at: https://github.com/ratulb/grpc-rust-java-web/blob/main/rust/server/image-build.sh
3. The rust and java grpc implementations can be launched as kubernetes ClusterIP services. The service yaml file is: https://github.com/ratulb/grpc-rust-java-web/blob/main/rust/server/rust-clusterip.yaml
4. For java - Dockerfile, image build commands and service  yaml file is located at: https://github.com/ratulb/grpc-rust-java-web/tree/main/java/server
5. The NodePort service definition for envoy proxy is: https://github.com/ratulb/grpc-rust-java-web/blob/main/envoy/envoy-nodeport.yaml

Note: To quickly launch a kubernetetes cluster in a matter of minutes - have a look at https://github.com/ratulb/k8s-easy-install.


