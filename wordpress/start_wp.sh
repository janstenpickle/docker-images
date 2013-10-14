#!/bin/bash

puppet apply /etc/puppet/manifests/wpconf.pp

if [ ! -d /data/uploads ]; then 
  mkdir -p /data/uploads
fi
chown www-data:www-data /data/uploads
ln -s /data/uploads /wordpress/wp-content/uploads

php5-fpm &
nginx

while true; do
  sleep 1000
done
