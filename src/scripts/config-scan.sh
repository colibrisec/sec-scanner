#!/bin/bash
trivyLatest=$(curl --silent "https://api.github.com/repos/aquasecurity/trivy/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
trivyLink=$(echo "$trivyLatest" | cut -d 'v' -f 2)

FILE=trivy_"${trivyLink}"_Linux-64bit.tar.gz
if [ ! -f "$FILE" ]; then
  wget https://github.com/aquasecurity/trivy/releases/download/"$trivyLatest"/trivy_"${trivyLink}"_Linux-64bit.tar.gz
  tar zxvf trivy_"${trivyLink}"_Linux-64bit.tar.gz
fi
./trivy config -f json -o results-config.json .
