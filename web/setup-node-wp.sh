#!/usr/bin/env bash
apt update
if ! command wget -V; then
  sudo apt-get install -y wget
fi

if ! command node -v; then
  wget https://nodejs.org/dist/v14.16.1/node-v14.16.1-linux-x64.tar.xz
  sudo tar xvf node-v14.16.1-linux-x64.tar.xz --strip-components 1 -C /usr/local
  rm node-v14.16.1-linux-x64.tar.*
  export PATH=$PATH:/usr/local/bin
  sudo npm install -D webpack-cli
  sudo npm install
  echo -e "\e[1;32mNodejs is installed\e[0m"
else
  echo -e "\e[1;32mNodejs is already installed\e[0m"
fi

node -v
