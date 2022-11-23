FROM	debian:buster

RUN		apt-get update \
		&& apt-get install -y mariadb-server

RUN		service mysql start \
		&& mysqladmin -u root password "root" \
		&& mysql -e "DELETE FROM mysql.user WHERE User=''" \
		&& mysql -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1')" \
		&& mysql -e "DROP DATABASE IF EXISTS test" \
		&& mysql -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%'" \
		&& mysql -e "FLUSH PRIVILEGES"

EXPOSE	3306

CMD		["bash"]
