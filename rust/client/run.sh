#!/usr/bin/env bash
echo -e "\e[1;32mRunning rust grpc client\e[0m"
GRPC_SERVER="${GRPC_SERVER:-http://0.0.0.0:30031}"
echo "Hitting server $GRPC_SERVER"
GRPC_SERVER=$GRPC_SERVER cargo run
