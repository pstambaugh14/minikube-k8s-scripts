#!/bin/bash
read -p "What is the Namespace? " NAMESPACE
echo "Here is a list of the Pods within the namespace.  Please copy the container you'd like to configure"
echo
kubectl get pod -n $NAMESPACE | awk '{ print $ 1 }' | sed -n '1!p'
echo
read -p "Please paste the name of the container: " CONTAINER
kubectl exec -it -n $NAMESPACE $CONTAINER -- /bin/bash
