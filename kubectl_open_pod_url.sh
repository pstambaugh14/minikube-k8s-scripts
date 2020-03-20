#!/bin/bash
#PROMPTS FOR YOUR ENVIRONMENT VARIABLES
read -p "What is the namespace?" namespace
echo "$namespace"
read -p "What is the name of the pod?" podname
echo $podname
read -p "What is the name of the service?" servicename
echo $servicename

#MAGIC TO GET OUR DATA READY - PARSING DATA FOR A NICE CLEAN FORMAT TO READ
hostip=`kubectl get pods -n $namespace -o yaml | grep -i hostip | awk '{ print $2 }' | head -n 01`
serviceport=`kubectl get service $servicename -n $namespace -o json |grep -i nodePort | awk '{ print $ 2 }' | sed 's/\,//g' | head -n 01`


#WILL PRINT IN STDOUT/SHELL THE FULL URL AND PORT OF THE POD/SERVICE
echo "The pod can be access from the following: http://$hostip:$serviceport"

echo "Automatically opening link in default browser..."

#Needs rest for a second...
sleep 2

#Automatically Opens Your Browser (Linux)
xdg-open http://$hostip:$serviceport
