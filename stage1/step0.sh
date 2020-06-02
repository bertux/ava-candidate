#!/bin/bash
set -e
set -u
#set -x
echo "Stage 1 — Installing and Running AVA"

VERSION="0.5.0"
URL="https://github.com/ava-labs/gecko/releases/download/v$VERSION/gecko-linux-$VERSION.tar.gz"
FILENAME="$VERSION.tar.gz"
FOLDERNAME="/home/ava"

mkdir -p ${FOLDERNAME}
curl -L $URL -o ${FOLDERNAME}/${FILENAME} --cacert /etc/ssl/certs/ca-certificates.crt
tar -zxf /tmp/${FILENAME} --directory ${FOLDERNAME}
