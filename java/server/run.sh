#!/usr/bin/env bash
. stop.sh 
echo -e "\e[1;32mStopping java grpc server\e[0m"
SERVER_PORT=31031 DELEGATES="localhost:30031" \
	mvn exec:java -Dexec.mainClass="grpc.java.server.EchoServer" &
