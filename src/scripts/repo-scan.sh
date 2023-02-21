#!/bin/bash

if [ "${PARAM_IGNOREUNFIXED}" == true ]; then
  ./trivy fs -f json -o results-repo.json --severity "${PARAM_SEVERITY}" --ignore-unfixed .
else
  ./trivy fs -f json -o results-repo.json --severity "${PARAM_SEVERITY}" .
fi
