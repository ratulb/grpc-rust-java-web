#!/usr/bin/env bash
rm -rf ./dist/

npx webpack --mode production
#npx webpack --mode development ./client.js
export TOMCAT_HOME=tomcat/apache-tomcat-9.0.45
mkdir -p $TOMCAT_HOME/webapps/client/dist/
cp dist/main.js $TOMCAT_HOME/webapps/client/dist/
cp index.html $TOMCAT_HOME/webapps/client/
cp favicon.ico $TOMCAT_HOME/webapps/client/
cp style.css $TOMCAT_HOME/webapps/client/

