FROM nginx:1.15.0-alpine

RUN apk add --no-cache shadow

RUN rm /etc/nginx/conf.d/default.conf
copy ./nginx.conf /etc/nginx/conf.d
