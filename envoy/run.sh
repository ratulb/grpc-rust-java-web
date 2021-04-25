#!/usr/bin/env bash
echo -e "\e[1;32mStarting envoy proxy\e[0m"
set cwd=$(pwd)
envoy --config-path envoy.yaml &
cd $cwd
