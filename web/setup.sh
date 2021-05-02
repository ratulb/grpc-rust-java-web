#!/usr/bin/env bash
./install-protoc.sh
./gen-js-proto.sh
./setup-node-wp.sh
cd tomcat
./setup.sh
cd -
./deploy-app.sh
