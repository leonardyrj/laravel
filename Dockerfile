FROM php:7.3-fpm-alpine3.9
RUN apk add --no-cache openssl bash mysql-client nodejs npm shadow
RUN docker-php-ext-install pdo pdo_mysql

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

RUN curl -sS http://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www
RUN rm -rf /var/www/html


#COPY . /var/www
RUN ln -s public html

#RUN chown -R www-data:www-data /var/www

#RUN usermod -u 1000 www-data
#USER www-data


EXPOSE 9000
ENTRYPOINT ["php-fpm"]
