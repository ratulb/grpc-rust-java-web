#!/usr/bin/env bash
. stop.sh 
echo -e "\e[1;32mRunning rust grpc server\e[0m"
DELEGATES=http://[::]:31031 cargo run &
