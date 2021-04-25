#!/usr/bin/env bash
./install-protoc.sh
./setup-node-wp.sh
cd tomcat 
./setup.sh
cd -
./gen-js-proto.sh
./deploy-app.sh

