#!/bin/sh

# Global variables
DIR_CONFIG="/etc/npc"
DIR_TMP="$(mktemp -d)"

curl --retry 10 --retry-max-time 60 -H "Cache-Control: no-cache" -fsSL github.com/ehang-io/nps/releases/download/v0.26.10/linux_amd64_client.tar.gz -o ${DIR_TMP}/npc.tar.gz
mkdir -p ${DIR_CONFIG}
busybox tar -xzf ${DIR_TMP}/npc.tar.gz -C ${DIR_CONFIG}
chmod 777 ${DIR_CONFIG}

rm -rf ${DIR_TMP}

busybox ${DIR_CONFIG}/npc install -server=${IP}:8024 -vkey=${VKEY} -type=tcp
busybox ${DIR_CONFIG}/npc start
