#service mysql start

#/etc/init.d/mysql start
mysql_install_db > /dev/null

mysqld_safe & sleep 2

mysql -u root --skip-password << EOF
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%';
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PWD';
CREATE DATABASE IF NOT EXISTS $DB_NAME;
GRANT ALL PRIVILEGES ON $DB_NAME.* TO $DB_USER@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PWD';
EOF

#sleep 2
#ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PWD';

#mysql -e "DELETE FROM mysql.user WHERE User='';"
#mysql -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
#mysql -e "DROP DATABASE IF EXISTS test;"
#mysql -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%';"
#mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PWD';"
#mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
#mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO $DB_USER@'%';"
#mysql -e "FLUSH PRIVILEGES;"
#mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PWD';"

#echo "DELETE FROM mysql.user WHERE User='';" | mysql
#echo "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');" | mysql
#echo "DROP DATABASE IF EXISTS test;" | mysql
#echo "DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%';" | mysql
#echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PWD';" | mysql
#echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" | mysql
#echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO $DB_USER@'%';" | mysql
#echo "FLUSH PRIVILEGES;" | mysql
#echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PWD';" | mysql

#/etc/init.d/mysql stop
#mysql

#service mysql stop
#mysqladmin ping

mysqladmin -uroot -p$DB_ROOT_PWD shutdown
#systemctl stop mariadb
#sleep 2

mysqld -u root
