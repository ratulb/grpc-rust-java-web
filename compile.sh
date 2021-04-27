#!/usr/bin/env bash
first="$1"
second=$2

if ! command javac --version; then
  sudo apt-get update
  sudo apt-get install -y default-jdk
fi
if ! command mvn -v; then
  sudo apt-get install -y maven
fi
if ! command cargo -V; then
  curl https://sh.rustup.rs -sSf | sudo sh -s -- -y
  source ~/.bashrc
  sudo apt-get install -y build-essential
fi

source ~/.bashrc
export PATH=$PATH:$HOME/.cargo/bin/cargo
source "$HOME/.cargo/env"

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
