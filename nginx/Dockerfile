FROM janstenpickle:5000/puppet

RUN echo "deb http://ppa.launchpad.net/nginx/stable/ubuntu precise main" > /etc/apt/sources.list.d/nginx.list && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C300EE8C && apt-get update
RUN apt-get update && apt-get install -y --no-install-recommends nginx
