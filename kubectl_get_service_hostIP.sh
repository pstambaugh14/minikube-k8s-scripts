#!/bin/bash
read -p "What is the namespace?" namespace
echo "$namespace"
read -p "What is the name of the pod?" podname
echo $podname
read -p "What is the name of the service?" servicename
echo $servicename

hostip=`kubectl get pods -n $namespace -o yaml | grep -i hostip | awk '{ print $2 }' | head -n 01`
serviceport=`kubectl get service $servicename -n $namespace -o json |grep -i nodePort | awk '{ print $ 2 }' | sed 's/\,//g' | head -n 01`

echo "The pod can be access from the following: http://$hostip:$serviceport"

echo "Automatically opening link in default browser..."

sleep 2

xdg-open http://$hostip:$serviceport
