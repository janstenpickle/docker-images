FROM ubuntu:12.04

RUN apt-get -y install python-software-properties
RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
RUN add-apt-repository 'deb http://mirrors.coreix.net/mariadb/repo/10.0/ubuntu precise main'
RUN apt-get update && apt-get install -y --no-install-recommends mariadb-server

EXPOSE 3600:3600

USER mysql
CMD mysqld_safe
