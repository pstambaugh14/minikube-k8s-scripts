#/bin/bash

#CHECK IF KUBERNETES_SERVICE ENVIRONMENT VARIABLES ARE CONFIGURED:
printenv | grep -i kubernetes_serv

#DEFINE SOME ENVIRONMENT VARIABLES MANUALLY:
KUBERNETES_SERVICE_PORT_HTTPS=443
KUBERNETES_SERVICE_HOST=10.96.0.1
APISERVER="https://${KUBERNETES_SERVICE_HOST}:${KUBERNETES_SERVICE_PORT_HTTPS}"
TOKEN=$(cat /run/secrets/kubernetes.io/serviceaccount/token)

#TEST IT OUT:
curl $APISERVER/api --header "Authorization: Bearer $TOKEN" --cacert /run/secrets/kubernetes.io/serviceaccount/ca.crt
curl $APISERVER/api/v1/pods --header "Authorization: Bearer $TOKEN" --cacert /run/secrets/kubernetes.io/serviceaccount/ca.crt
