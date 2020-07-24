#!/bin/bash
# Run this command to return a set of BASH environment variables
$ eval $(minikube docker-env)

#This method can also be used
#$ minikube docker-env

#THESE ENVIRONMENT VARIABLES CAN ALSO BE PASSED IF DESIRED/NEEDED
#export DOCKER_TLS_VERIFY="1"
#export DOCKER_HOST="tcp://192.168.x.x:2376"
#export DOCKER_CERT_PATH="/home/docker/.certs/"
