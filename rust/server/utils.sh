kubectl delete -f grpc-rust-service.yaml
kubectl delete -f ../grpc-java/grpc-java-service.yaml
sleep 5
docker rmi ratulb/grpc-rust-debian -f
docker rmi ratulb/grpc-java-debian -f 
sleep 5
kubectl apply -f grpc-rust-service.yaml

kubectl apply -f ../grpc-java/grpc-java-service.yaml
