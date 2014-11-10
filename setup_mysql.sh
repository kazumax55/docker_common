#!/bin/sh

yum -y install openssl-devel mysql-devel mysql-server
mysql_install_db

cat <<EOF > /etc/supervisord.d/mysqld.conf
[program:mysqld]
command=/usr/bin/mysqld_safe
user=mysql
autorestart=true
EOF
