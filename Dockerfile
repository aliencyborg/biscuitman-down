FROM nginx

RUN apt-get -y update; apt-get -y install wget python build-essential git libfontconfig
RUN wget -qO- https://deb.nodesource.com/setup_10.x > node_setup.sh
RUN bash node_setup.sh
RUN apt-get -y install nodejs

COPY . /app
RUN cd /app \
  && npm install -g ember-cli bower \
  && npm install && bower install --allow-root \
  && ember build -environment production --output-path /usr/share/nginx/html

WORKDIR /usr/share/nginx/html

