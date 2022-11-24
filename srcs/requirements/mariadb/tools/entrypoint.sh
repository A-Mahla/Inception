#!/bin/sh

service mysql start

echo "DELETE FROM mysql.user WHERE User='';" | mysql -u root
echo "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');" | mysql -u root
echo "DROP DATABASE IF EXISTS test;" | mysql -u root
echo "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';" | mysql -u root

echo "CREATE USER IF NOT EXISTS 'amahla'@'%' IDENTIFIED BY 'Secret94';" | mysql -u root
echo "CREATE DATABASE IF NOT EXISTS wordpressdb;" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpressdb.* TO amahla@'%';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'BossSecret94';" | mysql -u root

service mysql stop
