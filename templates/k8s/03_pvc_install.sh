#!/bin/bash
pvcvar=`kubectl get pvc -n <PVC> |grep -i <PVC> | awk '{ print $ 1}'`
#if [[ $pvcvar =~ '^<PVC>*' ]]; then
#if [[ "$nsvar" != '<PVC>' ]]; then
echo $pvcvar
if [[ $pvcvar != '<APPLICATION>-<PVC>' ]]
then
  echo "PersistentVolumeClaim $pvcvar does not Exist, Will Create PersistentVolumeClaim..."
  kubectl create -f <PVC>.yaml
else
  echo "PersistentVolumeClaim $pvcvar already exists... exiting"
#  break
fi

#IF DESIRED FOR ENVIVONMENT VARIABLES, IF, SAY, PIPELINING, UNCOMMENT:
#export pvcvar=$pvcvar
