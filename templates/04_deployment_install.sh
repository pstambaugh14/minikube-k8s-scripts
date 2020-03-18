#!/bin/bash
pod_exists=`kubectl get pods -n <POD> | grep -i <POD> | awk '{ print $1 }'`
echo $pod_exists
#if [[ $pod_exists =~ '^<POD>*' ]]; then
#if [[ "$nsvar" != '<POD>' ]]; then
#if [[ "$pod_exists" =~ '^<POD>*' ]]; then
#then
#if [ "$pod_exists" =~ ^"[<POD>.*]$" ]
if ! [[ $pod_exists =~ <POD>* ]] ;
then
  echo "Pod does not Exist, Will Create Pods via Deployment..."
  kubectl create -f <DEPLOYMENT>.yaml
else
  echo "Pod/Deployment $pod_exists Already Exists, Deleting Previous Pod & Creating a New One..."
  kubectl delete deployment <DEPLOYMENT> -n <NAMESPACE> && kubectl delete pod $pod_exists -n <NAMESPACE> &&  kubectl create -f <DEPLOYMENT>.yaml
fi

#IF DESIRED FOR ENVIVONMENT VARIABLES, IF, SAY, PIPELINING, UNCOMMENT
#export pod_exists=$pod_exists

