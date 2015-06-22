yum -y install python-setuptools
easy_install pip
pip install meld3==1.0.0
pip install supervisor==3.1.3

echo_supervisord_conf > /etc/supervisord.conf
sed -i 's|^logfile=.*|logfile=/var/log/supervisor/supervisord.log|' /etc/supervisord.conf
sed -i 's|^pidfile=.*|pidfile=/var/run/supervisord.pid|' /etc/supervisord.conf
sed -i 's/^;\[include\]/[include]/' /etc/supervisord.conf
sed -i 's|^;files =.*|files = supervisord.d/*.conf|' /etc/supervisord.conf

mkdir -p /etc/supervisord.d /var/log/supervisor
