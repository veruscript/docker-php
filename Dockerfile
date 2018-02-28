FROM php:7.1-fpm

# Basic
RUN apt-get update -qq  \
 ; apt-get install -y unzip git-core libicu-dev vim-tiny ssh

# Node
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
; apt-get install -y nodejs ; npm install -g gulp-cli yarn

# XDebug

# APCU
RUN pecl install apcu-5.1.8 \
&& docker-php-ext-enable apcu

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer global require hirak/prestissimo

# Clean up
RUN rm -rf /var/lib/apt/lists/* /var/cache/apk/*
