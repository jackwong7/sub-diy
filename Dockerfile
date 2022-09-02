#build
FROM node:12-alpine as build

WORKDIR /app

RUN apk add --no-cache wget git nginx \
    && git clone https://github.com/CareyWang/sub-web \
    && cd sub-web \
    && yarn install 


#sub service
ADD . /var/dev/
WORKDIR /var/dev/
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./vue/vue.config.js /app/sub-web/vue.config.js
RUN chmod 777 ./docker-entrypoint.sh \
    && wget https://github.com/tindy2013/subconverter/releases/download/v0.7.2/subconverter_linux64.tar.gz \
    && tar -zxvf subconverter_linux64.tar.gz && rm subconverter_linux64.tar.gz


ENTRYPOINT ["./docker-entrypoint.sh"]