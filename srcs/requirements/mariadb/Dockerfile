FROM debian:bullseye

ARG DBNAME \
    VLM \
    DBUSER \
    DBUSERPASS

RUN apt-get update && apt-get install -y mariadb-server mariadb-client

#RUN groupadd -r mysql && useradd -r -g mysql:mysql
RUN mkdir -p /var/run/mysqld && \
	chown -R mysql:mysql /var/lib/mysql /var/run/mysqld /etc/mysql 
#USER mysql

#RUN chown -R mysql:mysql /var/lib/mysql /var/log/mysql && \
#    chown -R mysql:mysql /etc/mysql

RUN sed -i "s/^bind-address\s*=.*/bind-address = 0.0.0.0/" "/etc/mysql/mariadb.conf.d/50-server.cnf" && \
    sed -i "/\[mysqld\]/a port = 3306\nsocket = /var/run/mysqld/mysqld.sock" "/etc/mysql/mariadb.conf.d/50-server.cnf"

#RUN mysql_install_db

RUN echo "CREATE USER IF NOT EXISTS '${DBUSER}'@'%' IDENTIFIED BY '${DBUSERPASS}'; \
    CREATE DATABASE IF NOT EXISTS ${DBNAME}; \
    GRANT ALL PRIVILEGES ON ${DBNAME}.* TO '${DBUSER}'@'%'; \
    FLUSH PRIVILEGES;" > /var/lib/mysql/mariaDBCommands.sql

RUN service mariadb start && mariadb < "/var/lib/mysql/mariaDBCommands.sql" && service mariadb stop

#RUN service mariadb stop

#ENTRYPOINT ["tail", "-f"]
ENTRYPOINT ["mysqld"]
