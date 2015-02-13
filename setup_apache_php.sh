#!/bin/sh

PHP_VERSION=${1:-php}

yum install -y --enablerepo=remi ${PHP_VERSION}


cat <<EOF > /etc/supervisord.d/httpd.conf
[program:httpd]
command=/usr/sbin/httpd -DNO_DETACH -DFOREGROUND
numprocs=1
autostart=true
autorestart=true
redirect_stderr=true
stdout_logfile=/var/log/httpd.log
EOF
