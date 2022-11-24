FROM	debian:buster

RUN		apt-get update \
		&& apt-get install -y mariadb-server

COPY	./conf/my.cnf /etc/mysql/.
COPY	./tools/entrypoint.sh /tmp/entrypoint.sh

RUN		service mysql start && mysql < /tmp/entrypoint.sh

EXPOSE	3306

CMD ["mysqld_safe"]
