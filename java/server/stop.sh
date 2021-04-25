#!/usr/bin/env bash
echo -e "\e[1;32mStopping java grpc server\e[0m"
sudo ps -ef | grep 'grpc.java.server.EchoServer' | \
	grep -v grep | awk '{print $2}' | \
	xargs kill -9 &> /dev/null
