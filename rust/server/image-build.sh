docker build -t grpc-rust-debian -f ./Dockerfile .
docker tag grpc-rust-debian ratulb/grpc-rust-debian
#docker login
docker push ratulb/grpc-rust-debian
#docker -it run -p 8080:30031 grpc-rust-debian
#docker system prune -a
