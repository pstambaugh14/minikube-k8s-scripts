#!/bin/bash
#MODIFY ACCORDINGLY TO NEEDS OF DEPLOYMENT OR POD SETUP

#DEPLOYMENT SETUP
pod_exists=`kubectl get pods -n <NAMESPACE> | grep -i <POD_NAME> | awk '{ print $1 }'`
#if [ "$pod_exists" != "jenkins" ]
#if [[ ! $pod_exists =~ ^(jenkins*)$ ]]; then
#if [[ ! $pod_exists =~ /jenkins.*/g ]]; then
#if [[ $pod_exists =~ '^jenkins*' ]]; then
#  echo "Pod does not Exist, Will Create Pod..."
#else
#  echo "Pod Already Exists, Deleting Previous Pod..."
#  kubectl delete pod $pod_exists -n jenkins
#fi
if [[ $pod_exists =~ '^<POD_NAME>*' ]]; then
  echo "Pod does not Exist, Will Create Pod..."
  kubectl create -f <APPLICATION>-deployment.yaml
  #OR
  #./04_deployment_install.sh
else
  echo "Pod Already Exists, Deleting Previous Pod & Creating a New One..."
  kubectl delete deployment <APPLICATION>-deployment -n <NAMESPACE>
  kubectl delete pod $pod_exists -n <NAMESPACE> && kubectl create -f <APPLICATION>-deployment.yaml
fi

#IF DESIRED FOR ENVIVONMENT VARIABLES, IF, SAY, PIPELINING, UNCOMMENT:
#export pod_exists=$pod_exists

#POD SETUP
#pod_exists=`kubectl get pods -n <NAMESPACE> | grep -i <POD_NAME> | awk '{ print $1 }'`
#if [[ $pod_exists =~ '^<POD_NAME>*' ]]; then
#  echo "Pod does not Exist, Will Create Pod..."
#  kubectl create -f <APPLICATION_POD_DEPLOY>.yaml
  #OR
  #./pods_install.sh
#else
#  echo "Pod Already Exists, Deleting Previous Pod & Creating a New One..."
#  kubectl delete pod $pod_exists -n <NAMESPACE> && kubectl create -f <APPLICATION_POD_DEPLOY>.yaml
#fi

#IF DESIRED FOR ENVIVONMENT VARIABLES, IF, SAY, PIPELINING, UNCOMMENT:
#export pod_exists=$pod_exists

