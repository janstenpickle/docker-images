FROM ubuntu:12.04

RUN sed -i 's/main$/main universe/' /etc/apt/sources.list
RUN echo "deb http://ppa.launchpad.net/nginx/stable/ubuntu precise main" > /etc/apt/sources.list.d/nginx.list && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C300EE8C && apt-get update 
RUN apt-get install git-core python-pip python-dev libevent1-dev gunicorn nginx build-essential -y --no-install-recommends
RUN git clone https://github.com/dotcloud/docker-registry.git /docker-registry
RUN cd /docker-registry && pip install -r requirements.txt
ADD conf/registry/config.yml /docker-registry/config.yml
ADD conf/nginx /etc/nginx/conf.d
RUN rm -f /etc/nginx/sites-enabled/*

EXPOSE 5000:80

CMD nginx && cd /docker-registry && ./setup-configs.sh && export SETTINGS_FLAVOR=prod && gunicorn -k gevent --max-requests 100 --graceful-timeout 3600 -t 3600 -b localhost:5000 -w 8 wsgi:application
