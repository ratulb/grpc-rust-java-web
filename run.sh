#!/usr/bin/env bash
first="$1"
second=$2
set cwd=$(pwd)
source ~/.bashrc
source "$HOME/.cargo/env"
case "$first" in
  java)
    case "$second" in
      server)
        cd java/server/
        ./run.sh
        ;;
      client)
        cd java/client/
        ./run.sh
        ;;
      *)
        echo "Target not specified - running java server & clinet"
        cd java/server/
        ./run.sh
        cd ../client/
        sleep 5
        ./run.sh
        ;;
    esac
    ;;
  rust)
    case "$second" in
      server)
        cd rust/server/
        ./run.sh
        ;;
      client)
        cd rust/client/
        sleep 5
        ./run.sh
        ;;
      *)
        echo "Target not specified - running rust server & clinet"
        cd rust/server/
        ./run.sh
        cd ../client
        sleep 5
        ./run.sh
        ;;
    esac
    ;;
  envoy)
      cd envoy
      ./run.sh      
    ;;
  tomcat)
      cd web/tomcat
      ./run.sh      
    ;;

  *)
    echo "Target not specified - running all - envoy/tomcat/rust/java"
    cd envoy
    ./run.sh
    cd ../web/tomcat
    ./run.sh
    cd ../../
    cd java/server/
    ./run.sh
    cd ../client/
    sleep 5
    ./run.sh
    cd ../../rust/server/
    ./run.sh
    cd ../client
    sleep 5
    ./run.sh
    ;;
esac

cd $cwd
