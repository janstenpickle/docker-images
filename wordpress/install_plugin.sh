#!/bin/bash

cd /tmp
wget $1
unzip `echo $1 | awk -F '/' '{print $NF}'` -d /wordpress/wp-content/plugins
