#!/bin/bash
#USE THIS TEMPLATE TO RUN A 'FOR' LOOP IN ORDER TO USE DOCKER "EXEC" COMMANDS INTO EACH RUNNING CONTAINER!

#THIS TEMPLATE EXECUTES A 'FIND' COMMAND FOR '.RIOCONFIG' FILES AND PRINTS THE PATH(S) OF THE FOUND FILE(S) CONTAINING '.RIOCONFIG' IN ITS NAME ONLY WHEN FOUND.
#OTHERWISE, STDOUT WOULD PRINT EXCESS DATA...

#hostvar=$(docker exec -it "${containerId}" hostname)

clear

echo "Starting the Script... Searching the whole filesystems within each running container...: "
echo ""
echo "Script will print the full-path and container's hostname of any filename containing 'rioconfig' that exists in this terminal session."
echo ""

for containerId in $(docker ps -q)
do
    docker exec -it "${containerId}" hostname && echo "${hostvar} is the hostname..."
    hostvar=$(docker exec -it "${containerId}" hostname) \
    found=$(find / -type f -name '*sh' 2>/dev/null) \
    printvar=$(printf "$found \n") &&
if [[ -n ${found} ]] && [[ -f ${found} ]]; then
echo -e "Located ${printvar} in container ${hostvar}!"
elif [[ -n $found ]] && [[ ! -f ${found} ]];
then echo "" &>/dev/null
else echo "ERROR: Something went wrong... "; exit 1
fi
done

echo "Script finish executing... Exiting... "; exit 0;
