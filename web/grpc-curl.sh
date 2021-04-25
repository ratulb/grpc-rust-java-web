#!/bin/bash
#https://github.com/fullstorydev/grpcurl/releases
version="1.8.0"

if [ ! -e /usr/local/bin/grpcurl ]; then
  wget https://github.com/fullstorydev/grpcurl/releases/download/v${version}/grpcurl_${version}_linux_x86_64.tar.gz
  tar xvf grpcurl_${version}_linux_x86_64.tar.gz

  chmod +x grpcurl
  mv grpcurl /usr/local/bin/
  rm grpcurl_${version}_linux_x86_64.tar.*
fi
server="[::]:30031"
if [ "$1" != "" ]; then
  server=$1
fi
grpcurl -plaintext -import-path ./proto -proto echo.proto -d '{"message": "client hello"}'  $server echo.Echo/echo
