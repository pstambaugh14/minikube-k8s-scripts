#!/bin/bash

#This is used to check for API connectivity once HTTPS is implemented.

curl https://<hostname>:2376/images/json \
  --cert ~/.docker/certs/cert.pem \
  --key ~/.docker/certs/key.pem \
  --cacert ~/.docker/certs/ca.pem \
  | python -m json.tool
