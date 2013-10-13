FROM janstenpickle:5000/nginx

RUN sed -i 's/main$/main universe/' /etc/apt/sources.list && apt-get update && apt-get install -y --no-install-recommends wget php5-mysql php5-fpm curl
RUN wget http://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz 
ADD conf/nginx/wordpress /etc/nginx/sites-enabled/default
ADD conf/wp/config.php.top.erb /tmp/wp-config.php.top.erb
ADD conf/wp/config.php.bottom.erb /tmp/wp-config.php.bottom.erb
ADD puppet/wpconf.pp /etc/puppet/manifests/wpconf.pp
RUN cat /tmp/wp-config.php.top.erb > /etc/puppet/templates/wp-config.php.erb && curl https://api.wordpress.org/secret-key/1.1/salt/ >> /etc/puppet/templates/wp-config.php.erb && cat /tmp/wp-config.php.bottom.erb >> /etc/puppet/templates/wp-config.php.erb
ADD start_wp.sh /start_wp.sh

EXPOSE 80:80
EXPOSE 443:443

CMD /start_wp.sh
