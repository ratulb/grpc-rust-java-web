#!/usr/bin/env bash
cd apache-tomcat-9.0.45/bin
./shutdown.sh 2>/dev/null
sleep 3
./startup.sh
cd -
