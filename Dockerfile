# Dockerfile
FROM php:7.4-apache

COPY vhost.cnf /etc/apache2/sites-available/000-default.conf
RUN docker-php-ext-install pdo pdo_mysql mysqli
RUN a2enmod rewrite
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git

 WORKDIR /var/www
# Install unzip utility and libs needed by zip PHP extension

RUN apt-get update && apt-get install -y \
    zlib1g-dev \
    libzip-dev \
    unzip
RUN docker-php-ext-install zip



RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
COPY composer.lock composer.json /var/www/

COPY  . /var/www

RUN composer update






