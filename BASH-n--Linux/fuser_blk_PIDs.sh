#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "Please run as 'root' user..."
   exit
fi

sudo fuser -v -m /dev/sdb2
