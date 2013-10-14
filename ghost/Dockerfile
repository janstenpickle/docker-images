FROM janstenpickle:5000/nodejs

RUN apt-get install -y git-core
RUN git clone https://github.com/TryGhost/Ghost.git /ghost && cd /ghost && git checkout 0.3.2-11
RUN git clone https://github.com/TryGhost/Casper.git /ghost/content/themes/casper
ADD conf/config.js /ghost/config.js
RUN cd /ghost && npm install --production

EXPOSE 2368:2368

CMD cd /ghost && npm start --production
