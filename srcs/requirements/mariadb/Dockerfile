FROM	debian:buster

RUN		apt-get update \
		&& apt-get install -y gettext \
		&& apt-get install -y mariadb-server mariadb-client

COPY	./conf/my.cnf /etc/mysql/.
COPY	./tools/config.sh /tmp/config.sh

EXPOSE	3306

#ENTRYPOINT	service mysql start && \
#			envsubst < /tmp/config.sql >  /tmp/config_exp.sql && \
#			mysql < /tmp/config_exp.sql && \
#			mysqld
ENTRYPOINT	["sh", "/tmp/config.sh"]
