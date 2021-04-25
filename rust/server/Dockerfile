FROM rust:latest AS builder
RUN rustup component add rustfmt
RUN USER=root cargo new --bin server
WORKDIR ./grpc-rust
COPY ./Cargo.toml ./Cargo.toml
COPY ./build.rs ./build.rs
COPY src ./src
COPY proto ./proto
RUN cargo build --release
RUN rm src/*.rs

ADD . ./

RUN rm ./target/release/deps/server*
RUN cargo build --release


FROM debian:buster-slim

ARG APP=/usr/local/bin

RUN apt-get update \
    && apt-get install -y curl \
    && apt-get install -y wget 

EXPOSE 30031

COPY --from=builder ./grpc-rust/target/release/server ${APP}/server

WORKDIR ${APP}

CMD ["./server"]

