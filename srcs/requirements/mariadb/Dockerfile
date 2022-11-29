FROM	debian:buster

RUN		apt-get update \
		&& apt-get install -y gettext \
		&& apt-get install -y mariadb-server

COPY	./conf/my.cnf /etc/mysql/.
COPY	./tools/config.sql /tmp/config.sql

EXPOSE	3306

#ENTRYPOINT	service mysql start && \
#			envsubst < /tmp/config.sql >  /tmp/config_exp.sql && \
#			mysql < /tmp/config_exp.sql && \
COPY		../../.env /

RUN			export $(cat .env | xargs) 
			service mysql start && \
			envsubst < /tmp/config.sql >  /tmp/config_exp.sql && \
			mysql -uroot -p"" < /tmp/config_exp.sql

ENTRYPOINT	mysqld
