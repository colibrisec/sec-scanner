#!/bin/bash

# Report to where?
# Currently supporting Postee, DefectDojo, and SonarQube
#

if [ "${PARAMETER_SERVER}" == "defectdojo" ]; then
  # defectdojo
  curl -X POST "${PARAM_URL}" -H "Authorization: Bearer " "${PARAM_TOKEN}" --data "${PARAM_REPORT}"
fi

if [ "${PARAMETER_SERVER}" == "sonarqube" ]; then
  # sonarqube
  curl -X POST "${PARAM_URL}" -H "Authorization: Bearer " "${PARAM_TOKEN}" --data "${PARAM_REPORT}"
fi

if [ "${PARAMETER_SERVER}" == "postee" ]; then
  # postee
  curl -X POST "${PARAM_URL}" -H "Authorization: Bearer " "${PARAM_TOKEN}" --data "${PARAM_REPORT}"
fi