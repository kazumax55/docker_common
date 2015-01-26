CONF_DEST=$1
APP_ROOT=$2
SERVER_NAME=$3
LISTEN_PORT=$4
SOCK_FILE=$5

mkdir -p $(dirname "$CONF_DEST")

cat <<EOF > "$CONF_DEST"
upstream ${SERVER_NAME} {
  server unix:${SOCK_FILE};
}

server {
  listen ${LISTEN_PORT};
  server_name ${SERVER_NAME};

  root ${APP_ROOT}/public;
  error_log ${APP_ROOT}/log/error.log;

  location / {
    proxy_set_header X-Real-IP \$remote_addr;
    proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
    proxy_set_header Host \$http_host;
    proxy_redirect off;
    if (!-f \$request_filename) { proxy_pass http://${SERVER_NAME}; }
  }

  location ~* \.(ico|css|js|gif|jpe?g|png)(\?[0-9]+)?$ {
    expires 1y;
    add_header Cache-Control public;

    # http://guides.rubyonrails.org/asset_pipeline.html#server-configuration
    # add_header Last-Modified "";
    # add_header ETag "";
    log_not_found off;
  }
}

EOF
