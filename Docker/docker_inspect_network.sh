#!/bin/bash

docker inspect -f '{{json .NetworkSettings}}' <container_name or id> | jq

OR:

docker inspect -f '{{json .NetworkSettings}}' <container_name or id> | jq '.Networks'
