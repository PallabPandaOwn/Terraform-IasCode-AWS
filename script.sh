#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

# install nginx
# apt-get update
sudo yum update -y
sudo yum install nginx

# make sure nginx is started
# service nginx start
sudo systemctl start nginx #systemd
