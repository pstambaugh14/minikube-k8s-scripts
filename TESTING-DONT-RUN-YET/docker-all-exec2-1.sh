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

#for containerId in $(docker ps -q)
#do
#    hostvar=$(docker exec -it ${containerId} hostname) && \
#    docker exec -it ${containerId} hostname
#    echo "${hostvar} is the hostname..."
#    found=$(find / -type f -name '*' 2>/dev/null)
#    echo "${found}" &&
#    echo ""
#done


#for containerId in $(docker ps -q)
#do
#hostvar=$(docker exec -it ${containerId} hostname) &&
#docker exec -it ${containerId} hostname &&
#hostvar=$(docker exec -it "${containerId}" hostname)
#echo "${hostvar} is the hostname..." && \
#echo ""
#found=$(find / -type f -name '*' 2>/dev/null) &&


for containerId in $(docker ps -q); do
#hostvar=$(docker exec -it ${containerId} hostname) &&
docker exec -it ${containerId} hostname  
hostvar=$(docker exec -it "${containerId}" hostname) 
#echo "${hostvar} is the hostname..." && \
#echo ""
found=$(find / -type f -name '*') 
    for foundpath in $(docker exec -it ${containerId} find / -type f -name '*sh*' 2>/dev/null); do
    #echo "${foundpath} should be where we are?" &&
    printvar=$(printf "${found} \n")
    if [[ -n ${foundpath} ]] && [[ -f ${foundpath} ]]; then 
      echo "test test ${foundpath}"
      printf "Located ${printvar} in container ${hostvar}" &&
      #echo -e "Located ${printvar} in container ${hostvar}" &&
      #printf "Located ${printvar} in container ${hostvar}" &&
    #elif [[ -n ${foundpath} ]] && [[ ! -f ${foundpath} ]]; then 
      #printf "something not good"
      #echo "$foundpath"
      #printf "something not good" 
    #else
      #echo "ERROR Something went wrong"; exit #1
      #printf "something really not good"
    fi
    done
      #echo "" 
    #echo ""
done


    #printvar=$(printf "$found \n") \ 
    #if [[ -n ${found} ]] && [[ -f ${found} ]]; then \ 
    #echo -e "Located ${printvar} in container ${hostvar}" \ 
    #echo -e "${found} - file found in container ${hostvar}" \ 
    #elif [[ -n $found ]] && [[ ! -f ${found} ]]; \
    #then echo "" &>/dev/null \
    #else echo "ERROR Something went wrong"; exit 1 \ 
    #fi  
    #done

#echo "Script finish executing... Exiting..."; exit 0;

