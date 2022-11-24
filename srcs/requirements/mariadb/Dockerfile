FROM	debian:buster

RUN		apt-get update \
		&& apt-get install -y mariadb-server

#COPY	./conf/my.cnf /etc/my.cnf
COPY	./tools/entrypoint.sh /tmp/entrypoint.sh

EXPOSE	3306

#ENTRYPOINT ["sh","/tmp/entrypoint.sh"]

CMD		["bash"]
