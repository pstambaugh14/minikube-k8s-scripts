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

