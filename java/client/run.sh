#!/usr/bin/env bash
echo -e "\e[1;32mRnning java grpc client\e[0m"
GRPC_SERVER="${GRPC_SERVER:-0.0.0.0:31031}"
echo "Hitting server $GRPC_SERVER"
GRPC_SERVER="$GRPC_SERVER" mvn exec:java -Dexec.mainClass="grpc.java.client.Client"
