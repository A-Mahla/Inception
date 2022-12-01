if [ ! -f "/var/lib/mysql/.config_mysql_ok" ]
then

	service mysql start

	sleep 2

	envsubst < /tmp/config.sql > /tmp/config_exp.sql
	mysql < /tmp/config_exp.sql

	mysqladmin -uroot -p$DB_ROOT_PWD shutdown


	touch "/var/lib/mysql/.config_mysql_ok"

fi

exec mysqld
