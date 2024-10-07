FROM debian:12.6

ARG VLM
ARG DOMAIN
ARG SUPER
ARG SUPERPASS
ARG USER
ARG USERPASS
ARG EMAIL \
 DBNAME \
 DBUSER \
 DBUSERPASS \
 DBHOST

# Instala PHP, WP-CLI, y dependencias necesarias
RUN apt-get update && apt-get install -y \
    php8.2-fpm \
    php8.2-mysql \
    curl \
    unzip \
    vim \
    less \
    && rm -rf /var/lib/apt/lists/*

# Instala WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \
    mkdir -p ${VLM} && \
    mkdir -p /run/php

COPY entrypoint.sh /entrypoint.sh
# Si el directorio está vacío, descarga e instala WordPress
#
# Configuración de PHP-FPM
#COPY conf/php-fpm.conf /etc/php/8.2/fpm/php-fpm.conf

# Exponer el puerto 9000 para PHP-FPM
EXPOSE 9000

# Iniciar PHP-FPM
#ENTRYPOINT ["php-fpm8.2", "--nodaemonize"]
#ENTRYPOINT ["tail", "-f"]
ENTRYPOINT ["bash", "entrypoint.sh"]
