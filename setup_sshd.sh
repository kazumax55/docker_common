#!/bin/sh

yum install -y zsh openssh-server sudo
mkdir -p /var/run/sshd
ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa

echo root:root | chpasswd

cat <<EOF > /etc/supervisord.d/sshd.conf
[program:sshd]
command=/usr/sbin/sshd -D -d
numprocs=1
autostart=true
autorestart=true
redirect_stderr=true
stdout_logfile=/var/log/sshd.log
EOF
