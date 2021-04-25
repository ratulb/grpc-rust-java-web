#!/usr/bin/env bash
apt update
sudo apt-get install -y wget

if ! command -v node; then
  wget https://nodejs.org/dist/v14.16.1/node-v14.16.1-linux-x64.tar.xz
  sudo tar xvf node-v14.16.1-linux-x64.tar.xz --strip-components 1 -C /usr/local
  rm node-v14.16.1-linux-x64.tar.*
  export PATH=$PATH:/usr/local/bin
  sudo npm install -D webpack-cli
  sudo npm install
fi

node -v

