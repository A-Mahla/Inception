FROM	debian:buster

RUN		apt-get update \
		&& apt-get install -y mariadb-server

COPY	./conf/50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY	./tools/entrypoint.sh /tmp/entrypoint.sh
COPY	./tools/entrypoint2.sh /tmp/entrypoint2.sh

RUN		service mysql start && mysql < /tmp/entrypoint2.sh

EXPOSE	3306

ENTRYPOINT ["mysqld_safe"]
