FROM debian:bullseye

ARG VLM

RUN apt-get update && apt-get install -y \
    php7.4-fpm \
    php7.4-mysql \
    curl \
    unzip \
    vim \
    less \
    && rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \
    mkdir -p ${VLM} && \
    mkdir -p /run/php

COPY entrypoint.sh /entrypoint.sh

EXPOSE 9000

ENTRYPOINT ["bash", "entrypoint.sh"]
