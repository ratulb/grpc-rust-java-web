#!/usr/bin/env bash
echo -e "\e[1;32mStopping envoy proxy\e[0m"
sudo ps -ef | grep 'envoy' | \
	grep -v grep | awk '{print $2}' | \
	xargs kill -9 &> /dev/null
