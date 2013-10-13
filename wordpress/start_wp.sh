#!/bin/bash

puppet apply /etc/puppet/manifests/wpconf.pp

php5-fpm &
nginx
