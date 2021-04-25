FROM envoyproxy/envoy-dev:latest
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y wget
RUN apt-get install -y netcat
RUN apt-get install -y iputils-ping
RUN apt-get install -y dnsutils
RUN apt-get install -y net-tools
RUN apt-get install -y vim
RUN apt-get install -y iproute2


COPY envoy.yaml /etc/envoy/envoy.yaml
RUN chmod go+r /etc/envoy/envoy.yaml

COPY grpc-curl.sh /root/
COPY proto/ /root/proto/

EXPOSE 10000


CMD /usr/local/bin/envoy -c /etc/envoy/envoy.yaml
