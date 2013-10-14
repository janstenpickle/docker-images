FROM janstenpickle:5000/nginx

RUN sed -i 's/main$/main universe/' /etc/apt/sources.list && apt-get update && apt-get install -y --no-install-recommends wget php5-mysql php5-fpm curl unzip
RUN wget http://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz 
ADD conf/nginx/wordpress /etc/nginx/sites-enabled/default
ADD conf/wp/config.php.top.erb /tmp/wp-config.php.top.erb
ADD conf/wp/config.php.bottom.erb /tmp/wp-config.php.bottom.erb
ADD puppet/wpconf.pp /etc/puppet/manifests/wpconf.pp
RUN cat /tmp/wp-config.php.top.erb > /etc/puppet/templates/wp-config.php.erb && curl https://api.wordpress.org/secret-key/1.1/salt/ >> /etc/puppet/templates/wp-config.php.erb && cat /tmp/wp-config.php.bottom.erb >> /etc/puppet/templates/wp-config.php.erb
ADD start_wp.sh /start_wp.sh
ADD install_plugin.sh /install_plugin.sh
ADD install_theme.sh /install_theme.sh
RUN /install_plugin.sh http://downloads.wordpress.org/plugin/floating-social-bar.zip
RUN /install_plugin.sh http://downloads.wordpress.org/plugin/wordpress-seo.1.4.18.zip
RUN /install_plugin.sh http://downloads.wordpress.org/plugin/edit-flow.0.7.6.zip
RUN /install_plugin.sh http://downloads.wordpress.org/plugin/w3-total-cache.0.9.3.zip
RUN /install_plugin.sh http://downloads.wordpress.org/plugin/thirstyaffiliates.zip
RUN /install_plugin.sh http://downloads.wordpress.org/plugin/compact-archives.3.0.3.zip
RUN /install_plugin.sh http://downloads.wordpress.org/plugin/quick-pagepost-redirect-plugin.zip
RUN /install_plugin.sh http://downloads.wordpress.org/plugin/tablepress.1.1.1.zip
RUN /install_theme.sh http://public-api.wordpress.com/rest/v1/themes/download/zoren.zip

EXPOSE 80:80
EXPOSE 443:443

CMD /start_wp.sh
