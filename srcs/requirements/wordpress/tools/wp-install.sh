#!/bin/bash

sleep 10
if [ -f /var/www/html/wp-config.php ]
then
	echo "Wordpress is already downloaded, configured and installed"
else
	
	wp core download --allow-root

	wp config create --allow-root --dbhost=mariadb:3306 --dbname=$DB_NAME \
	--dbuser=$DB_USER --dbpass=$DB_USER_PWD
	wp core install --allow-root --url="$DOMAIN_NAME" --title="Inception" \
	--admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PWD" --admin_email="$WP_ADMIN_MAIL"
	wp user create --allow-root $WP_USER $WP_USER_MAIL --user_pass=$WP_USER_PWD --role=author

	wp config set --allow-root WP_REDIS_PORT 6379 --add
	wp config set --allow-root WP_CACHE_KEY_SALT $DOMAIN_NAME --add
	wp config set --allow-root WP_REDIS_HOST redis --add
	wp config set --allow-root  WP_DEBUG true --raw
	wp plugin install redis-cache --activate --allow-root
	wp plugin update --all --allow-root
	wp redis enable --allow-root

fi
echo "Wordpress is running"
php-fpm7.3 -F
