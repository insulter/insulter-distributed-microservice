#!/bin/bash

dir=`pwd`/bin
echo $dir

# Consul service discovery and configuration
echo "return to the detault configuration by running '$dir/consul reload'"
$dir/consul agent --dev -enable-script-checks -client=0.0.0.0 & echo $!

# Nats server messaging system
$dir/gnatsd -DV & echo $!

# Traefik reverse proxy
# due to `Linux does not allow processes to listen on low-level ports by default` like port 80
# run this `sudo 'setcap cap_net_bind_service=+ep' path/traefik_linux-amd64` or run the below command as `sudo`
sudo $dir/traefik_linux-amd64 --configFile=$dir/traefik.toml & echo $!
