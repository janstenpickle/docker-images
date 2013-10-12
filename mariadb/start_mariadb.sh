#!/bin/bash

if [ ! -d /data/mysql ]; then
  mkdir /data/mysql
fi

if [ "x$(ls /data/mysql | wc -l)" == "x0" ]; then
  mysql_install_db
fi

su - mysql -s /bin/bash -c mysqld_safe
