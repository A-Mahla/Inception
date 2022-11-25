FROM	debian:buster

RUN		apt-get update \
		&& apt-get install -y mariadb-server

COPY	./conf/my.cnf /etc/mysql/.
COPY	./tools/entrypoint.sql /tmp/entrypoint.sql

RUN		chmod 755 /var/lib/mysql && \
		service mysql start && \
		mysql < /tmp/entrypoint.sql

EXPOSE	3306

CMD ["mysqld_safe"]
