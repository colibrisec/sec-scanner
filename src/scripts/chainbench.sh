#!/bin/bash
chainbenchLatest=$(curl --silent "https://api.github.com/repos/aquasecurity/chain-bench/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
chainbenchLink=$(echo "$chainbenchLatest" | cut -d 'v' -f 2)
#FOLDER=chain-bench_"${chainbenchLink}"

FILE=chain-bench_"${chainbenchLink}"_Linux_64bit.tar.gz
if [ ! -f "$FILE" ]; then
  wget https://github.com/aquasecurity/chain-bench/releases/download/"$chainbenchLatest"/chain-bench_"${chainbenchLink}"_Linux_64bit.tar.gz
  tar zxvf "$FILE"
fi

chain-bench scan --repository-url "${PARAM_REPO}"