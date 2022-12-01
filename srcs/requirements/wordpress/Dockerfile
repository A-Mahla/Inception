FROM	debian:buster

RUN		apt-get update && \
		apt-get install -y curl && \
		apt-get install -y php php-fpm php-mysqli mariadb-client php-redis

COPY	./tools/wp-install.sh /tmp/.
COPY	conf/www.conf /etc/php/7.3/fpm/pool.d/.

RUN		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
		chmod +x wp-cli.phar && \
		mv wp-cli.phar /usr/local/bin/wp && \
		mkdir -p /run/php && \
		touch /run/php/php7.3-fpm.pid

WORKDIR	/var/www/html

EXPOSE	9000

ENTRYPOINT ["bash", "/tmp/wp-install.sh"]
