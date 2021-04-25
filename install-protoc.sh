#!/usr/bin/env bash
apt update
apt-get install -y wget 2>/dev/null
apt-get install -y unzip 2>/dev/null

if [ ! -f /usr/local/bin/protoc ]; then
  wget https://github.com/protocolbuffers/protobuf/releases/download/v3.15.8/protoc-3.15.8-linux-x86_64.zip
  unzip -o protoc-3.15.8-linux-x86_64.zip  -d /usr/local/
  rm protoc-3.15.8-linux-x86_64.zip*
fi

if [ ! -f /usr/local/bin/protoc-gen-grpc-web ]; then
  wget https://github.com/grpc/grpc-web/releases/download/1.2.1/protoc-gen-grpc-web-1.2.1-linux-x86_64
  chmod +x protoc-gen-grpc-web-1.2.1-linux-x86_64
  mv protoc-gen-grpc-web-1.2.1-linux-x86_64 /usr/local/bin/protoc-gen-grpc-web
fi

