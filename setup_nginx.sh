#!/bin/sh

rpm -ivh http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm
yum install -y nginx
rm -f /etc/nginx/conf.d/*

cat <<EOF > /etc/supervisord.d/nginx.conf
[program:nginx]
command=/usr/sbin/nginx -g "daemon off;"
numprocs=1
autostart=true
autorestart=true
EOF
