#!/usr/bin/env bash
target="$1"
set cwd=$(pwd)
case "$target" in
  java)
    cd java/server/
    ./stop.sh
    ;;
  rust)
    cd rust/server/
    ./stop.sh
    ;;
  envoy)
    cd envoy
    ./stop.sh
    ;;
  tomcat)
    cd web/tomcat
    ./stop.sh
    ;;
  *)
    echo "Target not specified - stopping envoy, tomcat, java, rust"
    cd envoy
    ./stop.sh
    cd -
    cd web/tomcat
    ./stop.sh
    cd -
    cd java/server/
    ./stop.sh
    cd ../../rust/server/
    ./stop.sh
    ;;
esac

cd $cwd
