FROM ubuntu:12.04

ADD http://nodejs.org/dist/v0.10.20/node-v0.10.20-linux-x64.tar.gz node.tar.gz
RUN tar -xzvf node.tar.gz && ln -s `ls / | grep node-` /node && ln -s /node/bin/node /bin/node && ln -s /node/bin/npm /bin/npm
