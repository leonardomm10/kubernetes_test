FROM composer as builder

WORKDIR /app
COPY schedule-thing/composer.* ./
RUN composer install

FROM php:8.2-fpm

RUN mkdir /app
WORKDIR /app
COPY schedule-thing/. /app
COPY --from=builder /app/vendor /app/vendor

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

#COPY php-fpm.conf /usr/local/etc/php-fpm.d/php-fpm.conf

RUN echo "date.timezone = America/Sao_Paulo" >> /usr/local/etc/php/conf.d/php.ini
RUN echo "memory_limit = 128M" >> /usr/local/etc/php/conf.d/php.ini
RUN echo "max_execution_time = 360" >> /usr/local/etc/php/conf.d/php.ini
RUN echo "short_open_tag = On" >> /usr/local/etc/php/conf.d/php.ini
RUN echo "display_errors = Off" >> /usr/local/etc/php/conf.d/php.ini
RUN echo "error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT" >> /usr/local/etc/php/conf.d/php.ini

EXPOSE 9000