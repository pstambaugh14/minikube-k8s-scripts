#!/bin/bash
for containerId in $(docker ps -q)
do
docker exec -it ${containerId} hostname &&
hostvar=$(docker exec -it "${containerId}" hostname)
echo "${hostvar} is the hostname..." && \
echo ""
found=$(find / -type f -name '*' 2>/dev/null) &&
for foundpath in $(docker exec -it ${containerId} find / -type f -name '*rioconfig*' 2>/dev/null)
do
echo "${foundpath} should be where we are?" &&
if [[ -n ${foundpath} ]] && [[ -f ${foundpath} ]]; then
echo -e "Located ${printvar} in container ${hostvar}" &&
elif [[ -e ${foundpath} ]] && [[ ! -f ${foundpath} ]]; then
echo "gah"
else
echo "ERROR Something went wrong"; exit 1
fi
done
echo ""
echo ""
done
