FROM debian:12.6

RUN apt-get update && apt-get install -y php8.2-fpm php8.2-mysql

COPY conf/php-fpm.conf /etc/php/8.2/fpm/php-fpm.conf

EXPOSE 9000

CMD ["php-fpm8.2", "--nodaemonize"]
