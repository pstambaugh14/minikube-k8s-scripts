#!/bin/bash
savar=`kubectl -n kube-system get sa |grep -i <SA_NAME>`
if [[ $savar =~ '^<SA_NAME>*' ]]; then
#if [[ "$nsvar" != '<SA_NAME>' ]]; then
  echo "Service Account $savar does not Exist, Will Create Service Account $sarvar..."
  #Creates Service_Account under specified namespaces, for example:
  kubectl -n kube-system create sa <SA_NAME>
  kubectl -n default create sa <SA_NAME>
  kubectl -n <NAMESPACE> create sa <SA_NAME>
  #Across the entire cluster, grant the permissions in the 'cluster-admin' ClusterRole to a service account named “<SA_NAME>” in the namespaces “kube-system”, "default" & "<NAMESPACE>":
  kubectl create clusterrolebinding <SA_NAME-BINDING> --clusterrole cluster-admin --serviceaccount=kube-system:<SA_NAME>
  kubectl create clusterrolebinding <SA_NAME-BINDING> --clusterrole cluster-admin --serviceaccount=default:<SA_NAME>
  kubectl create clusterrolebinding <SA_NAME-BINDING> --clusterrole cluster-admin --serviceaccount=<NAMESPACE>:<SA_NAME>
else
  echo "Service Account $savar already exists... exiting"
#  break
fi

#IF DESIRED FOR ENVIVONMENT VARIABLES, IF, SAY, PIPELINING, UNCOMMENT:
#export savar=$savar
