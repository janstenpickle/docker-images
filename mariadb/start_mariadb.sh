#!/bin/bash

ROOT_PASSWORD=$MARIA_ROOT_PASS

if [ ! -d /data/mysql ]; then
  mkdir /data/mysql
fi

if [ "x$(ls /data/mysql | wc -l)" == "x0" ]; then
  mysql_install_db
  su - mysql -s /bin/bash -c "/usr/bin/mysqladmin -u root password $ROOT_PASSWORD"
fi

su - mysql -s /bin/bash -c mysqld_safe
