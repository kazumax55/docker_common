#!/bin/sh

yum -y install postgresql-server postgresql-devel
/etc/init.d/postgresql initdb

cat <<EOF > /etc/supervisord.d/postgresql.conf
[program:postgresql]
command=/usr/bin/postgres -D /var/lib/pgsql/data
user=postgres
autorestart=true
EOF
