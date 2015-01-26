#!/bin/sh

GITSSH_PATH=$1
SSHKEY_PATH=$2

cat <<EOF > "$GITSSH_PATH"
exec ssh -oIdentityFile=${SSHKEY_PATH} -oStrictHostKeyChecking=no $@
EOF

chmod +x "$GITSSH_PATH"
