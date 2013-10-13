#!/bin/bash

puppet apply /etc/puppet/manifests/wpconf.pp

php5-fpm &
nginx

while true; do
  sleep 1000
done
