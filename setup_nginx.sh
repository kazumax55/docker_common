#!/bin/sh

yum install -y nginx
rm -f /etc/nginx/conf.d/*

cat <<EOF > /etc/supervisord.d/nginx.conf
[program:nginx]
command=/usr/sbin/nginx -g "daemon off;"
numprocs=1
autostart=true
autorestart=true
EOF
