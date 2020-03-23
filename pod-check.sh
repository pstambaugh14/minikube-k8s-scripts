#!/bin/bash

pod_exists=`kubectl get pods -n <NAMESPACE> | grep -i <PODNAME> | awk '{ print $1 }'`

if [ "$pod_exists" != "<PODNAME>" ]
then
  echo "Pod does not Exist, Will Create Pod..."
  kubectl create -f <POD.YAML>
else
  echo "Pod Already Exists, Deleting Previous Pod..."
  kubectl delete pod <PODNAME> -n <NAMESPACE>
fi
