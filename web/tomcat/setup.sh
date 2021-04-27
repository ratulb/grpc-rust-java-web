#!/usr/bin/env bash
if [ ! -d apache-tomcat-9.0.45 ]; then
  sudo apt update
  apt-get install -y wget
  apt-get install -y unzip
  wget https://apachemirror.wuchna.com/tomcat/tomcat-9/v9.0.45/bin/apache-tomcat-9.0.45.zip
  unzip apache-tomcat-9.0.45.zip
  chmod +x apache-tomcat-9.0.45/bin/*.sh
  rm apache-tomcat-9.0.45.zip
  echo -e "\e[1;32mTomcat is installed\e[0m"
else
  echo -e "\e[1;32mTomcat is already installed\e[0m"
fi
