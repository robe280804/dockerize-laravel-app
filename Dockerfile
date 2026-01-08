FROM php:8.3-fpm

# Create an user that can use docker
# I dont want root to be the final-user
ARG user
ARG uid

# Install dependency 
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libxml2-dev \
    libonig-dev \
    zip \
    unzip

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install php extension
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

## Install composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

## Add user to www-data group
RUN useradd  -u $uid -ms /bin/bash -g www-data $user

# Change the permission file to user
COPY . /var/www
COPY --chown=$user:www-data . /var/www

USER $user

EXPOSE 9000

CMD ["php-fpm"]