#!/bin/bash

FILE=ZAP_"${zapLink}"_Linux.tar.gz
if [ ! -f "$FILE" ]; then
  wget https://github.com/zaproxy/zaproxy/releases/download/"$zapLatest"/ZAP_"${zapLink}"_Linux.tar.gz
  tar zxvf "$FILE"
fi
cd "${FOLDER}"
./zap.sh -quickurl "${PARAM_URL}" -quickprogress -quickout ../zapreport.json
