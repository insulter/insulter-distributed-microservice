#!/bin/bash

sudo apt-get -y install unzip >> /dev/null 2>&1

dir=`pwd`/bin
echo $dir

# Consul service discovery and configuration
curl -L -o $dir/consul_1.0.0_linux_amd64.zip https://releases.hashicorp.com/consul/1.0.0/consul_1.0.0_linux_amd64.zip && unzip $dir/consul_1.0.0_linux_amd64.zip consul -d $dir && chmod +x $dir/consul && rm $dir/consul_1.0.0_linux_amd64.zip

# Nats server messaging system
curl -L -o $dir/gnatsd-v1.0.4-linux-amd64.zip https://github.com/nats-io/gnatsd/releases/download/v1.0.4/gnatsd-v1.0.4-linux-amd64.zip && unzip -j $dir/gnatsd-v1.0.4-linux-amd64.zip 'gnatsd-v1.0.4-linux-amd64/gnatsd' -d $dir && chmod +x $dir/gnatsd && rm $dir/gnatsd-v1.0.4-linux-amd64.zip

# Traefik reverse proxy
curl -L -o $dir/traefik_linux-amd64 https://github.com/containous/traefik/releases/download/v1.4.1/traefik_linux-amd64 && chmod +x $dir/traefik_linux-amd64

