#!/bin/bash

#EXAMPLE:
#Create your four containers. Notice the --network flags. You can only connect to one network during the docker run command, so you need to use docker network connect afterward to connect alpine4 to the bridge network as well.

docker run -dit --name <container_name1> --network alpine-net alpine ash

docker run -dit --name <container_name2> --network alpine-net alpine ash

docker run -dit --name <container_name3> alpine ash

docker run -dit --name <container_name4> --network alpine-net alpine ash

docker network connect bridge <container_name4>


#You can also choose the IP addresses for the container with --ip and --ip6 flags when you start the container on a user-defined network.
docker run -itd --network=<network_name> --ip=<ip_address> <image_name>
