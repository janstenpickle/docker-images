from ubuntu:12.10

run apt-get update

# install node
run apt-get install -y --no-install-recommends wget curl puppet
run wget -O - http://nodejs.org/dist/v0.10.20/node-v0.10.20-linux-x64.tar.gz | tar -C /usr/local/ --strip-components=1 -zxv

#install ruby
run apt-get install -y ruby1.9.3 git-core

#install dependencies
run gem install sass
run gem install bourbon

run git clone https://github.com/TryGhost/Ghost.git /ghost

# make sure the process listens globally

run cd /ghost && npm install -g grunt-cli
run cd /ghost && npm install .
run cd /ghost && npm install -g grunt-contrib-sass

# currently a warning for invalid chars, patching to fix

run git clone https://github.com/TryGhost/Casper.git /ghost/content/themes/casper

run cd /ghost && sed -i '1s/^/@charset "UTF-8";\n/' ./core/client/assets/sass/layouts/errors.scss
run cd /ghost && grunt init --force

add conf/config.js.erb /etc/puppet/templates/config.js.erb
add puppet/ghost.pp /etc/puppet/manifests/ghost.pp
add start_ghost.sh /ghost/start.sh
run rm -rf /ghost/content/images && ln -s /data/ghost /ghost/content/images

workdir /ghost
expose 80:80

cmd ./start.sh
