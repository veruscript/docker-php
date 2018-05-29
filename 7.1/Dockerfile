FROM php:7.1-fpm

# Basic
RUN apt-get update -qq \
; apt-get install -y unzip git-core libicu-dev vim-tiny ssh \
  libpng-dev libjpeg62-turbo-dev \
  imagemagick libmagick++-dev \
  mysql-client libxslt-dev libxml2-dev nodejs \
; rm -rf /var/lib/apt/lists/*

# Node
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
; npm install -g yarn gulp-cli

# PHP Extensions
RUN pecl install apcu-5.1.8 imagick xdebug \
; docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
; docker-php-ext-install zip gd pdo_mysql opcache xsl \
; docker-php-ext-enable zip apcu imagick xdebug

# Composer
COPY --from=composer:1.6 /usr/bin/composer /usr/bin/composer
RUN composer global require hirak/prestissimo

WORKDIR /var/www
