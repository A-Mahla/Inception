FROM	debian:buster

RUN		apt-get update \
		&& apt-get install -y mariadb-server

COPY	./conf/my.cnf /etc/mysql/.
COPY	./tools/entrypoint.sql /tmp/entrypoint.sql

EXPOSE	3306

RUN		service mysql start && mysql < /tmp/entrypoint.sql

ENTRYPOINT		mysqld
