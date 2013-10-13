#!/bin/bash

cat /proc/mounts > /etc/mtab

if [ ! -d /data/mysql ]; then
  mkdir /data/mysql
fi

if [ "x$(ls /data/mysql | wc -l)" == "x0" ]; then
  mysql_install_db
fi

su - mysql -s /bin/bash -c mysqld_safe &


STATUS=1
while [ "x$STATUS" != "x0" ]; do
  sleep 2
  echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'172.17.%.%' WITH GRANT OPTION;" | mysql
  STATUS=$?
done

while true; do
  sleep 1000
done
