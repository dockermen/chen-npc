#!/bin/sh

# Global variables
DIR_CONFIG="/etc/npc"
DIR_TMP="$(mktemp -d)"

curl https://github.com//ehang-io/nps/releases/download/v0.26.10/linux_amd64_client.tar.gz -o ${DIR_TMP}/npc.tar.gz
mkdir -p ${DIR_CONFIG}
busybox tar -xzf ${DIR_TMP}/npc.tar.gz -C ${DIR_CONFIG}
chmod 777 ${DIR_CONFIG}

rm -rf ${DIR_TMP}

${DIR_CONFIG}/npc -server=${IP}:8024 -vkey=${VKEY} -type=tcp
