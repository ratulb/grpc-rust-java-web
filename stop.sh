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
  *)
    echo "Target not specified - stopping java and rust server"
    cd java/server/
    ./stop.sh
    cd ../../rust/server/
    ./stop.sh
    ;;
esac

cd $cwd
