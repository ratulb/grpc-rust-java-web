#!/usr/bin/env bash
#https://www.envoyproxy.io/docs/envoy/latest/start/install#install-envoy-on-ubuntu-linux
if ! command envoy --version; then
  apt update --fix-missing
  home_url=$(sudo cat /etc/*release | grep HOME_URL | cut -d'"' -f2)
  sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
  if [ "$home_url" = "https://www.debian.org/" ]; then
    sudo apt install -y gnupg2
  else
    sudo apt install -y gnupg-agent
  fi
  curl -sL 'https://getenvoy.io/gpg' | sudo apt-key add -
  # verify the key
  apt-key fingerprint 6FF974DB | grep "5270 CEAC"
  sudo add-apt-repository "deb [arch=amd64] https://dl.bintray.com/tetrate/getenvoy-deb $(lsb_release -cs) stable"
  apt update --fix-missing
  sudo apt install -y getenvoy-envoy
  echo -e "\e[1;32mInstalled envoy proxy\e[0m"
  envoy --version
else
  echo -e "\e[1;32menvoy proxy is already installed\e[0m"
fi

