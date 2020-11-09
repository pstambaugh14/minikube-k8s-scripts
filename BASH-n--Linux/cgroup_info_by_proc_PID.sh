#!/bin/bash

if [[ $EUID -ne 0  ]]; then
    echo "Please run again as root"
    exit
fi

find /proc/*/cgroup -type f -name "*cgroup*" -exec ls -la {} \; -exec cat {} \;

