#!/bin/sh

# Global variables
DIR_CONFIG="/etc/npc"
DIR_TMP="$(mktemp -d)"

curl --retry 10 --retry-max-time 60 -H "Cache-Control: no-cache" -fsSL github.com/ehang-io/nps/releases/download/v0.26.10/linux_amd64_client.tar.gz -o ${DIR_TMP}/npc.tar.gz
mkdir -p ${DIR_CONFIG}
busybox tar -xzf ${DIR_TMP}/npc.tar.gz -C ${DIR_CONFIG}
busybox chmod 777 ${DIR_CONFIG}

rm -rf ${DIR_TMP}

${DIR_CONFIG}/npc -server=${IP}:8024 -vkey=${VKEY} auto_reconnection=true -type=tcp
