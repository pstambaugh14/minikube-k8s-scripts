#!/bin/bash
nsvar=`kubectl get namespace |grep -i <NAMESPACE> | awk '{ print $1 }'`
echo $nsvar
#if [[ $nsvar =~ '^<NAMESPACE>*' ]]; then
if [[ $nsvar != '<NAMESPACE>' ]]
then
  echo "Namespace does not Exist, Will Create Namespace $nsvar..."
  kubectl create ns <NAMESPACE>
else
  echo "Namespace $nsvar already exists... exiting"
#  break
fi

#IF DESIRED FOR ENVIVONMENT VARIABLES, IF, SAY, PIPELINING, UNCOMMENT:
#export nsvar=$nsvar
