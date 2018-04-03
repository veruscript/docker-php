FROM php:7.1-fpm

# Basic
RUN apt-get update -qq \
; apt-get install -y unzip git-core libicu-dev vim-tiny ssh \
  libpng12-dev libjpeg62-turbo-dev \
  libfreetype6-dev imagemagick libmagick++-dev \
  mariadb-client libxslt-dev libxml2-dev --force-yes


# Node
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
; apt-get install -y nodejs ; npm install -g gulp-cli yarn bower

# XDebug

# PHP Extensions
RUN docker-php-ext-configure zip gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
; docker-php-ext-install zip gd pdo_mysql opcache xsl \
; pecl install imagick apcu-5.1.8 ; docker-php-ext-enable imagick zip apcu

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer global require hirak/prestissimo

# PDF
RUN apt-get install -y poppler-utils pandoc pdftk wkhtmltopdf
RUN apt-get install -y libreoffice # 577MB :/

# Fonts
RUN apt-get install -y cabextract wget
RUN curl -sS http://ftp.us.debian.org/debian/pool/contrib/m/msttcorefonts/ttf-mscorefonts-installer_3.7_all.deb > ttf-mscorefonts.deb \
 ; dpkg -i ttf-mscorefonts.deb ; rm -f ttf-mscorefonts.deb

# Latex
RUN apt-get install -y texlive-full # 3,4GB!?

# Clean up
RUN rm -rf /var/lib/apt/lists/* /var/cache/apk/*

WORKDIR /var/www
