#!/bin/sh

if [ ! -f "/var/lib/mysql/.config_mysql_ok" ]
then

	echo "INITIALISATION"
	mysql_install_db > /dev/null

	mysqld_safe & sleep 2

	envsubst < /tmp/config.sql > /tmp/config_exp.sql
	mysql < /tmp/config_exp.sql

	mysqladmin -uroot -p$DB_ROOT_PWD shutdown

	touch /var/lib/mysql/.config_sql_ok
fi

exec mysqld
