#!/bin/bash

if [ -f /var/www/html/wp-config.php ]
then
	echo "Wordpress is already downloaded, configured and installed"
else
	wp core download --allow-root
	wp config create --allow-root --dbhost=mariadb:3306 --dbname=$DB_NAME \
	--dbuser=$DB_USER --dbpass=$DB_USER_PWD
	wp core install --allow-root --url="$DOMAIN_NAME" --title="Inception" \
	--admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PWD" --admin_email="$WP_ADMIN_MAIL"
	wp user create $WP_USER $WP_USER_MAIL --user_pass=$WP_USER_PWD
fi
echo "Wordpress is running"
php-fpm7.3 -F
