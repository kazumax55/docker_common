#!/bin/sh

yum install -y rsyslog

cat <<EOF > /etc/supervisord.d/rsyslog.conf
[program:rsyslog]
command=/usr/sbin/rsyslogd -n -c5
autostart=true
autorestart=true
redirect_stderr=true
EOF

sed 's/$ModLoad imjournal/# $ModLoad imjournal/' -i /etc/rsyslog.conf
sed 's/$OmitLocalLogging on/$OmitLocalLogging off/' -i /etc/rsyslog.conf
sed 's/$IMJournalStateFile imjournal.state/# $IMJournalStateFile imjournal.state/' -i /etc/rsyslog.conf
sed 's/*.info;mail.none;authpriv.none;cron.none/# *.info;mail.none;authpriv.none;cron.none/' -i /etc/rsyslog.conf

cat <<EOF>>/etc/rsyslog.conf
*.info;mail.none;authpriv.none;cron.none;local0.none;local1.none        /var/log/messages
local0.*        /var/log/app/local0
local1.*        /var/log/app/local1
EOF
