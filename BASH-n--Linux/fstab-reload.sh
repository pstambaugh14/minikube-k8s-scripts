#!/bin/bash

#You need to run the following command from root:
#mount -a
#This simple command remounts all file systems which specified in /etc/fstab, with the exception of partitions with the noauto option.

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

mount -a
