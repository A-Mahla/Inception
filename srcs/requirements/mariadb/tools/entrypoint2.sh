#!/bin/sh

DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%';

CREATE USER IF NOT EXISTS 'amahla'@'%' IDENTIFIED BY 'Secret94';
CREATE DATABASE IF NOT EXISTS wordpressdb;
GRANT ALL PRIVILEGES ON wordpressdb.* TO amahla@'%';
FLUSH PRIVILEGES;

ALTER USER 'root'@'localhost' IDENTIFIED BY 'BossSecret94';
