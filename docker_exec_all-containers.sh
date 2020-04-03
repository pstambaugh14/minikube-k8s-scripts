#!/bin/bash
#USE THIS TEMPLATE TO RUN A 'FOR' LOOP IN ORDER TO USE DOCKER "EXEC" COMMANDS INTO EACH RUNNING CONTAINER!

#THIS TEMPLATE EXECUTES A 'FIND' COMMAND FOR 'CONFIG' FILES AND PRINTS THE PATH(S) OF THE FOUND FILE(S) CONTAINING 'CONFIG' IN ITS NAME ONLY WHEN FOUND.
#OTHERWISE, STDOUT WOULD PRINT EXCESS DATA...

for containerId in $(docker ps -q)
do
    docker exec -it "${containerId}" hostname && pwd
    found=$(find / -type f -name '*config*') &&
    if [[ -n ${found} ]]; then printf ${found}
    fi
done
