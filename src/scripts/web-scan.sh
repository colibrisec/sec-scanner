#!/bin/bash
zapLatest=$(curl --silent "https://api.github.com/repos/zaproxy/zaproxy/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
zapLink=$(echo "$zapLatest" | cut -d 'v' -f 2)
FOLDER=ZAP_"${zapLink}"

FILE=ZAP_"${zapLink}"_Linux.tar.gz
if [ ! -f "$FILE" ]; then
  wget https://github.com/zaproxy/zaproxy/releases/download/"$zapLatest"/ZAP_"${zapLink}"_Linux.tar.gz
  tar zxvf "$FILE"
fi
java --version
"${FOLDER}"/zap.sh -cmd -quickurl "${PARAM_URL}" -quickprogress -quickout ../zapreport.json
