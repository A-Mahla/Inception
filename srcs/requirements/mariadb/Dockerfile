FROM	debian:buster

RUN		apt-get update \
		&& apt-get install -y mariadb-server \
		&& apt-get install -y gettext

COPY	./conf/50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY	./tools/config.sh /tmp/config.sh
COPY	./tools/config.sql /tmp/config.sql

RUN		mkdir -p /var/lib/mysql && \
		mkdir -p /var/run/mysqld && \
		chown -R mysql:root /var/run/mysqld

EXPOSE	3306

#ENTRYPOINT	service mysql start && \
#			envsubst < /tmp/config.sql >  /tmp/config_exp.sql && \
#			mysql < /tmp/config_exp.sql && \
#			mysqld
ENTRYPOINT	["sh", "/tmp/config.sh"]
