#!/bin/bash

if [ -f /var/www/html/wp-config.php ]
then
	echo "Wordpress is already downloaded, configured and installed"
else
	wp core download --allow-root
	wp config create --allow-root --dbhost=mariadb:3306 --dbname=wordpressdb \
	--dbuser=amahla --dbpass=Secret94
	wp core install --allow-root --url="amahla.42.fr" --title="Inception" \
	--admin_user="supervisor" --admin_password="StrongSecret94" --admin_email="amahla@supervisor.com"
fi
echo "Wordpress is running"
php-fpm7.3 -F
