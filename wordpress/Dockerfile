FROM janstenpickle/nginx

RUN apt-get update && apt-get install -y --no-install-recommends wget php5-mysql
RUN wget http://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz 
ADD conf/nginx/wordpress /etc/nginx/sites-enabled/default
ADD conf/wp/config.php.erb /etc/puppet/templates/wp-config.php.erb

EXPOSE 80:80
