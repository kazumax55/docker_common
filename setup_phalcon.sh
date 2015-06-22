
# cd $(dirname $0)
# git clone git://github.com/phalcon/cphalcon.git ${SETUP_DIR}/cphalcon

[ -f /opt/rh/php55/enable ] && source /opt/rh/php55/enable

cd ${SETUP_DIR}/cphalcon/build
./install
