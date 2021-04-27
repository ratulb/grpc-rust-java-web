docker stop envoy-grpc-proxy 2>/dev/null
docker rm envoy-grpc-proxy 2>/dev/null
docker run --name envoy-grpc-proxy -p 9901:9901 \
  -p 10000:10000 -v $PWD/envoy.yaml:/etc/envoy/envoy.yaml \
  envoyproxy/envoy-alpine:v1.18-latest
