#!/bin/bash
#curl --unix-socket /var/run/docker.sock -X GET http:/v1.39/containers/json
curl --unix-socket /var/run/docker.sock -X GET -H "Content-type: application/json" -H "Accept: application/json" http:/v1.39/containers/json > output.json
cat output.json | python -m simplejson.tool > output_clean.json

