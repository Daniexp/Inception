FROM debian:12.6
RUN apt-get update && apt-get install -y mariadb-server

RUN groupadd -r mariadb && useradd -r -g mariadb mariadb

RUN mkdir -p /var/run/mysqld && chown -R mariadb:mariadb /var/lib/mysql /var/run/mysqld

USER mariadb

CMD ["mysqld"]
