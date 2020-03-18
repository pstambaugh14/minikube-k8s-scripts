#!/bin/bash
servvar=`kubectl get service -n <NAMESPACE> | grep -i <SERVICE> | awk '{ print $1 }'`

#if [[ $servvar =~ '^<SERVICE>*' ]]; then
#if [[ "$nsvar" != '<SERVICE>' ]]; then
if [[ "$servvar" != '<SERVICE>' ]]; then
  echo "Service $servvar does not Exist, Will Create Service..."
  kubectl create -f <SERVICE>-service.yaml
else
  echo "Service $servvar already exists... exiting"
#  break
fi

#IF DESIRED FOR ENVIVONMENT VARIABLES, IF, SAY, PIPELINING, UNCOMMENT:
#export servvar=$servvar
