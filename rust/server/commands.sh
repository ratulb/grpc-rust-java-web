#Install rust
curl https://sh.rustup.rs -sSf | sh
#Install c linker
apt install -y build-essential

DELEGATES=http://[::1]:31031 cargo run
