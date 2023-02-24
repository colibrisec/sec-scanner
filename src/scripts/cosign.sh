#!/bin/bash
cosignLatest=$(curl --silent "https://api.github.com/repos/zaproxy/zaproxy/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

FILE=cosign-linux-amd64
if [ ! -f "$FILE" ]; then
  wget https://github.com/zaproxy/zaproxy/releases/download/"$cosignLatest"/cosign-linux-amd64
  tar zxvf "$FILE"
fi

# Implement futher to store signed vuln scans / sboms

ls
echo "Signing ${PARAM_TYPE}"