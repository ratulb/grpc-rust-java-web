#!/usr/bin/env bash
first="$1"
second=$2
set cwd=$(pwd)
case "$first" in
  java)
    case "$second" in
      server)
        cd java/server/
        mvn clean
        ;;
      client)
        cd java/client/
        mvn clean
        ;;
      *)
        echo "Target not specified - cleaning java server & clinet"
        cd java/server/
        mvn clean
        cd ../client/
        mvn clean
        ;;
    esac
    ;;
  rust)
    case "$second" in
      server)
        cd rust/server/
        cargo clean
        ;;
      client)
        cd rust/client/
        cargo clean
        ;;
      *)
        echo "Target not specified - cleaning rust server & clinet"
        cd /rust/server/
        cargo clean
        cd ../client
        cargo clean
        ;;
    esac
    ;;
  *)
    echo "Target not specified - cleaning java server/client/ & rust server/client"
    cd java/server/
    mvn clean
    cd ../client/
    mvn clean
    cd ../../rust/server/
    cargo clean
    cd ../client
    cargo clean
    ;;
esac

cd $cwd
