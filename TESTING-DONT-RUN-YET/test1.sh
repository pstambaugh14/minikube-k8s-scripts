#!/bin/bash
#for containerId in $(docker ps -q)
#do
#echo ${containerId}
#docker exec -it ${containerId} hostname &&
#found=$(find / -type f -name '*') &&
#done

###ORIGINAL_WORKING###
#for containerId in $(docker ps -q)
#do
#    docker exec -it "${containerId}" hostname && pwd
#    found=$(find / -type f -name '*config*') &&
#    if [[ -n ${found} ]]; then printf ${found}
#    fi
#done

for containerId in $(docker ps -q)
do
    found=$(find / -type f -name '*.sh')
    docker exec -it "${containerId}" hostname
    docker exec -it "${containerId}" export found=$(find / -type f -name '*.sh')
    docker exec -it "${containerId}" if [[ -n ${found} ]]; then echo "Found ${found} in container ${containerId}" &&
    fi
done
