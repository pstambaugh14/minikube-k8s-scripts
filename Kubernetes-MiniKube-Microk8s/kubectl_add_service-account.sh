#!/bin/bash

#LIST YOUR CURRENT SERVICE ACCOUNTS
kubectl get serviceaccounts --all-namespaces
#OR:
kubectl get serviceaccounts -n <NAMESPACE>

#RUN WITH DIFFERENT NAMESPACES IN CASE DESIRED
kubectl -n kube-system create sa <SERVICE_ACCOUNT>
kubectl -n default create sa <SERVICE_ACCOUNT>
kubectl -n <NAMESPACE> create sa <SERVICE_ACCOUNT>

#ADD THE clusterrolebinding AS A cluster-admin BY NAMESPACE/USER
kubectl create clusterrolebinding <SERVICE_ACCOUNT> --clusterrole cluster-admin --serviceaccount=<NAMESPACE>:<SERVICE_ACCOUNT>
kubectl create clusterrolebinding <SERVICE_ACCOUNT> --clusterrole cluster-admin --serviceaccount=kube-system:<SERVICE_ACCOUNT>
kubectl create clusterrolebinding <SERVICE_ACCOUNT> --clusterrole cluster-admin --serviceaccount=default:<SERVICE_ACCOUNT>

#PRINT THE SERVICE ACCOUNT AFFILIATED WITH THE POD
kubectl get pods -n <NAMESPACE> <pod_name> --output=jsonpath={.spec.serviceAccount} && echo
