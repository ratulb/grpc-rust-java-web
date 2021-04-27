#!/usr/bin/env bash
./setup-node-wp.sh
./install-protoc.sh
cd tomcat
./setup.sh
cd -
./gen-js-proto.sh
./deploy-app.sh
