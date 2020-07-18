#!/bin/bash

. test1.sh

./test1.sh

for foundpath in $(docker exec -it ${containerId} find / -type f -name '*rioconfig*' 2>/dev/null)
do
    printvar=$(printf "${found} \n") &&
    if [[ -n ${foundpath} ]] && [[ -f ${foundpath} ]]; then printf "Located ${printvar} in container ${hostvar}" &&

