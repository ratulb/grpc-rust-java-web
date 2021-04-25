#!/usr/bin/env bash
first="$1"
second=$2
set cwd=$(pwd)
case "$first" in
  java)
    case "$second" in
      server)
        cd java/server/
        mvn compile
        ;;
      client)
        cd java/client/
        mvn compile
        ;;
      *)
        echo "Target not specified - compiling java server & clinet"
        cd java/server/
        mvn compile
        cd ../client/
        mvn compile
        ;;
    esac
    ;;
  rust)
    case "$second" in
      server)
        cd rust/server/
        cargo build
        ;;
      client)
        cd rust/client/
        cargo build
        ;;
      *)
        echo "Target not specified - compiling rust server & clinet"
        cd /rust/server/
        cargo build
        cd ../client
        cargo build
        ;;
    esac
    ;;
  *)
    echo "Target not specified - compiling java server/client/ & rust server/client"
    cd java/server/
    mvn compile
    cd ../client/
    mvn compile
    cd ../../rust/server/
    cargo build
    cd ../client
    cargo build
    ;;
esac

cd $cwd
