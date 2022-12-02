FROM	debian:buster

RUN		apt-get update \
		&& apt-get install -y mariadb-server \
		&& apt-get install -y gettext

COPY	./conf/my.cnf /etc/mysql/mariadb.conf.d/.
COPY	./tools/config.sh /tmp/config.sh
COPY	./tools/config.sql /tmp/config.sql

RUN		mkdir -p /var/lib/mysql && \
		mkdir -p /var/run/mysqld && \
		chown -R mysql:root /var/run/mysqld && \
		chown -R mysql:root /var/lib/mysql

EXPOSE	3306

ENTRYPOINT	["sh", "/tmp/config.sh"]
