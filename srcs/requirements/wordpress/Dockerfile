FROM	debian:buster

RUN		apt-get update && \
		apt-get install -y curl && \
		apt-get install -y php php-fpm php-mysqli mariadb-client

#COPY	./conf/wp-config.php /tmp/wp-config.php
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/.

RUN		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
		chmod +x wp-cli.phar && \
		mv wp-cli.phar /usr/local/bin/wp


#COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/.
#RUN		chown -R www/data /var/www/wordpress && \
#RUN		mkdir -p /var/www
#		chmod -R 775 /var/www/wordpress && \
#		cd /var/www/wordpress

WORKDIR	/var/www/worldpress

EXPOSE	9000

CMD		wp core download --allow-root && \
		wp config create --allow-root --dbhost=mariadb:3306 --dbname=worldpressdb --dbuser=amahla --dbpass=Secret94 && \
		wp core install --allow-root \
		--admin_user=supervisor \
		--admin_password=strongpassword && \
		php-fpm7



#CMD ["php-fpm7"]
