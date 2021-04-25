#!/usr/bin/env bash
set TOMCAT_HOME=../apache-tomcat-9.0.45
rm -rf ./dist/
npx webpack --mode development
#npx webpack --mode development ./client.js
mkdir -p $TOMCAT_HOME/webapps/client/dist/
cp dist/main.js $TOMCAT_HOME/webapps/client/dist/
cp page.js $TOMCAT_HOME/webapps/client/
cp index.html $TOMCAT_HOME/webapps/client/
cp favicon.ico $TOMCAT_HOME/webapps/client/
cp style.css $TOMCAT_HOME/webapps/client/

