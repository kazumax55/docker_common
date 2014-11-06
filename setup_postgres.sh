#!/bin/sh

yum -y install postgresql-server postgresql-devel
/etc/init.d/postgresql initdb

cat <<EOF > /etc/supervisord.d/postgresql.conf
[program:postgresql]
command=/usr/bin/postgres -D /var/lib/pgsql/data
user=postgres
autorestart=true
EOF

cat <<EOF > /var/lib/pgsql/data/pg_hba.conf
local   all         all                               trust
host    all         all         127.0.0.1/32          trust
host    all         all         192.168.0.0/24        trust
host    all         all         ::1/128               trust
EOF


cat <<EOF > /var/lib/pgsql/data/postgresql.conf

listen_addresses = '*'
EOF
