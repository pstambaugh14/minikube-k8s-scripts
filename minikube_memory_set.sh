#!/bin/bash
#minikube config set memory 4096

#read -p "What would you like the memory set to (in MB): ex) 4GB = 4096: " MEMNUMVAL
#echo $MEMNUMVAL

#ANOTHER WAY TO RUN THIS:

minikube config set memory "$1"
