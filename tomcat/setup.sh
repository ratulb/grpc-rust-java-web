#!/usr/bin/env bash
sudo apt update
apt-get install -y wget
apt-get install -y unzip
if [ ! -d apache-tomcat-9.0.45 ]; then
  wget https://apachemirror.wuchna.com/tomcat/tomcat-9/v9.0.45/bin/apache-tomcat-9.0.45.zip
  unzip apache-tomcat-9.0.45.zip
  chmod +x apache-tomcat-9.0.45/bin/*.sh
  rm apache-tomcat-9.0.45.zip
fi

