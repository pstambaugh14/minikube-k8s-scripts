#!/bin/bash

#RUN ALL THREE WITH CORRECT VALUES - this is the JENKINS EXAMPLE
kubectl -n kube-system create sa jenkins
kubectl create clusterrolebinding jenkins --clusterrole cluster-admin --serviceaccount=jenkins:jenkins
kubectl create clusterrolebinding default --clusterrole cluster-admin --serviceaccount=jenkins:default

#YOU CAN ALSO TEST WITH:

kubectl -n default create sa jenkins
kubectl get pods -n jenkins
kubectl get pods -n jenkins jenkins-deployment-84797b8db5-b8pjw --output=jsonpath={.spec.serviceAccount} && echo

$ printenv |grep -i kubernetes_serv
KUBERNETES_SERVICE_PORT_HTTPS=443
KUBERNETES_SERVICE_HOST=10.96.0.1

APISERVER=https://${KUBERNETES_SERVICE_HOST}:${KUBERNETES_SERVICE_PORT_HTTPS}

TOKEN=$(cat /run/secrets/kubernetes.io/serviceaccount/token)

curl $APISERVER/api  --header "Authorization: Bearer $TOKEN" --cacert /run/secrets/kubernetes.io/serviceaccount/ca.crt

kubectl get serviceaccounts

curl $APISERVER/api/v1/pods  --header "Authorization: Bearer $TOKEN" --cacert /run/secrets/kubernetes.io/serviceaccount/ca.crt
