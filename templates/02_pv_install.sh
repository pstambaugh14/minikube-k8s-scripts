#!/bin/bash
minikube ssh "sudo mkdir -p /host/path/directory-to-mount" &&
minikube ssh "sudo chown -R  docker:docker /host/path/directory-to-mount" &&
minikube ssh "sudo chmod 0755 -R /host/path/directory-to-mount" &&
volvar=`kubectl get pv -n <PERSITENT_VOLUME> |grep -i <PERSITENT_VOLUME> | awk '{ print $ 1}'`
#if [[ $volvar =~ '^<PERSITENT_VOLUME>*' ]]; then
echo $volvar
if [[ $volvar != '<PERSITENT_VOLUME>' ]]
then
#if [[ "$nsvar" != '<PERSITENT_VOLUME>' ]]; then
  echo "Volume does not Exist, Will Create Volume $volvar..."
  kubectl create -f <PERSITENT_VOLUME>.yaml
else
  echo "Volume $volvar already exists... moving on..."
#  break
fi

#IF DESIRED FOR ENVIVONMENT VARIABLES, IF, SAY, PIPELINING, UNCOMMENT:
#export volvar=$volvar
