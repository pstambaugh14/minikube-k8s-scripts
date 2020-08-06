#!/bin/bash

#This test is used to check Docker API connectivity and return some general configuration settings.

#WORKING:
curl -X GET "http(s)://<host_name>:<port>/v1.40/containers/json?all=false&size=false" -H  "accept: application/json" \
--cert ~/.docker/certs/cert.pem --key ~/.docker/certs/key.pem --cacert ~/.docker/certs/ca.pem | jq
#| python -m json.tool


#Also WORKING (if no TLS, if API/Docker Daemon also still on UNIX Socket Listening)
curl --unix-socket /var/run/docker.sock -H "Content-Type: application/json" \
  -d '"{"status": ["running"]}"' \
  -X GET http:/v1.40/containers/json \
  | jq
  #| python -m json.tool
