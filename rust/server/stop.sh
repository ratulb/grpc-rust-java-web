#!/usr/bin/env bash
echo -e "\e[1;32mStopping rust grpc server\e[0m"
sudo ps -ef | grep 'target/debug/server' | \
	grep -v grep | awk '{print $2}' | \
	xargs kill -9 &> /dev/null
