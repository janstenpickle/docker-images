FROM janstenpickle/nginx

RUN apt-get install -y --no-install-recommends wget php5-mysql
RUN wget http://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz 
ADD conf/nginx/wordpress /etc/nginx/sites-enabled/default
