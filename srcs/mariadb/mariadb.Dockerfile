FROM debian:12.6

RUN apt-get update
RUN apt-get install -y mariadb-server

EXPOSE 3306

LABEL version=1.0
LABEL name=mariadb
LABEL description="Image running debian:12.6 with mariaDB"

HEALTHCHECK --start-period=5m \
	CMD mariadb -e 'SELECT @@datadir;' || exit 1

CMD ["mariadbd", "--port", "3306"]
