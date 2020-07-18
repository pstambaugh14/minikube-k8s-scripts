#!/bin/bash
for containerId in $(docker ps -q)
do
    hostvar=$(docker exec -it ${containerId} hostname) && \
    docker exec -it ${containerId} hostname 
    echo "${hostvar} is the hostname..."
    found=$(find / -type f -name '*' 2>/dev/null)
    echo "${found}" &&
    echo "" 
done

