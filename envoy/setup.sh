#!/usr/bin/env bash
#https://www.envoyproxy.io/docs/envoy/latest/start/install#install-envoy-on-ubuntu-linux
sudo apt-get update
sudo apt-get install -y \
apt-transport-https \
ca-certificates \
curl \
gnupg-agent \
software-properties-common

curl -sL 'https://getenvoy.io/gpg' | sudo apt-key add -

apt-key fingerprint 6FF974DB

sudo add-apt-repository \
"deb [arch=amd64] https://dl.bintray.com/tetrate/getenvoy-deb \
$(lsb_release -cs) \
stable"
sudo apt-get update && sudo apt-get install -y getenvoy-envoy

envoy --version
echo -e "\e[1;32mInstalled envoy proxy\e[0m"
