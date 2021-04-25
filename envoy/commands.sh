docker build -t envoy-grpc-proxy:v1 .
docker tag envoy-grpc-proxy:v1 ratulb/envoy-grpc-proxy:v1
#docker login
docker push ratulb/envoy-grpc-proxy:v1
