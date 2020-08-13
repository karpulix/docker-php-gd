FROM php:7.3.16-apache-stretch
RUN apt-get update && \
    apt-get install -y \
    cron \
    mc \
    apt-utils \
    supervisor \
    libzip-dev \
    zip \
    git \
    mariadb-client \
    libgd-dev \
    libpng-dev && \
    docker-php-ext-configure zip --with-libzip && \
    docker-php-ext-install gd zip pdo_mysql mysqli bcmath sockets && \
    curl https://getcomposer.org/installer > composer-setup.php && \
    php composer-setup.php && mv composer.phar /usr/local/bin/composer && rm composer-setup.php