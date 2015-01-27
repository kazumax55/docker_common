#!/bin/sh

GIT_SSH=$1
SSHKEY_PATH=$2

cat <<EOF > "${GIT_SSH}"
exec ssh -oIdentityFile=${SSHKEY_PATH} -oStrictHostKeyChecking=no \$@
EOF

chmod +x "${GIT_SSH}"
