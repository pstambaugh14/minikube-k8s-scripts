#!/bin/bash
minikube ssh
docker ps -a | grep -i logstash
docker run -it --net container:<containername>  nicolaka/netshoot
