FROM	debian:buster

RUN		apt-get update && \
		apt-get install -y curl && \
		apt-get install -y php php-common

COPY	./conf/wp-config.php /tmp/wp-config.php

RUN		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
		chmod +x wp-cli.phar && \
		mv wp-cli.phar /usr/local/bin/wp

RUN		wp core download --locale=nl_NL --allow-root && \
		wp config create --allow-root --dbname=worldpressdb --dbuser=amahla --dbpass=Secret94 && \
		wp core install --allow-root \
		--url=amahla.42.fr \
		--title=Example \
		--admin_user=supervisor \
		--admin_password=strongpassword

EXPOSE	9000

RUN ["wp-admin"]
