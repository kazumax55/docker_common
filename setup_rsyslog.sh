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
