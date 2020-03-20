#!/bin/bash

#This method will run a new docker container and then execute the default shell.
#docker run -it ubuntu /bin/sh

#This method will execute a shell into a running container and execute Bourne shell.
docker exec -it <CONTAINER_NAME> /bin/bash
