#!/bin/bash

if [[ $EUID -ne 0  ]]; then
    echo "ROOT, SON!"
fi 

pmap -x 
