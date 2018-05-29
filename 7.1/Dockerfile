FROM php:7.1-fpm

# Basic
RUN apt-get update -qq \
; apt-get install -y unzip git-core libicu-dev vim-tiny ssh \
  libpng12-dev libjpeg62-turbo-dev \
  imagemagick libmagick++-dev \
  mysql-client libxslt-dev libxml2-dev --force-yes
# Node
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
; apt-get install -y nodejs ; npm install -g yarn gulp-cli

# PECL
RUN pecl install apcu-5.1.8 imagick xdebug

# PHP Extensions
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
; docker-php-ext-install zip gd pdo_mysql opcache xsl \
; docker-php-ext-enable zip apcu imagick xdebug

# Composer
COPY --from=composer:1.6 /usr/bin/composer /usr/bin/composer
RUN composer global require hirak/prestissimo

# Clean up
RUN rm -rf /var/lib/apt/lists/* /var/cache/apk/*

WORKDIR /var/www
