#!/usr/bin/env bash
./stop.sh
echo -e "\e[1;32mStarting envoy proxy\e[0m"
envoy --config-path envoy-local.yaml -l trace --log-path /tmp/envoy_info.log &
