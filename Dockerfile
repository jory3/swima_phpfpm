FROM php:8.2.0-fpm-bullseye
RUN docker-php-ext-install mysqli pdo_mysql exif
RUN apt-get update -y && apt-get install -y libwebp-dev libjpeg62-turbo-dev libpng-dev libjpeg-dev libxpm-dev \
    libfreetype6-dev
RUN apt-get update && \
    apt-get install -y \
        zlib1g-dev
RUN apt-get install -y libzip-dev
RUN docker-php-ext-install zip

# RUN docker-php-ext-configure gd
RUN docker-php-ext-configure gd --with-jpeg

#RUN docker-php-ext-install gd
RUN docker-php-ext-install -j$(nproc) gd
RUN apt-get install -y libicu-dev && docker-php-ext-configure intl && docker-php-ext-install intl

