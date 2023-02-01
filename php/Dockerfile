FROM php:8.2-fpm

WORKDIR /usr/local/etc

RUN apt-get update && apt-get install -y \
    wget \
    vim \
    unzip \
    htop \
    cron \
    iputils-ping \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libicu-dev \
    libmcrypt-dev \
    libxml2-dev \
    libc-client-dev \
    libkrb5-dev \
    libxslt1-dev

RUN docker-php-ext-install pdo pdo_mysql mysqli

COPY php-fpm.conf /usr/local/etc/php-fpm.d/php-fpm.conf

RUN echo "date.timezone = America/Sao_Paulo" >> /usr/local/etc/php/conf.d/php.ini
RUN echo "memory_limit = 128M" >> /usr/local/etc/php/conf.d/php.ini
RUN echo "max_execution_time = 360" >> /usr/local/etc/php/conf.d/php.ini
RUN echo "short_open_tag = on" >> /usr/local/etc/php/conf.d/php.ini

EXPOSE 9000