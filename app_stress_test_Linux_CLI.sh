#!/bin/bash
#Use this script to connect to containers via Docker CLI or isolated application hosts via SSH to stress-test your application's given resources.  
#Can also be used for debugging/testing system monitoring tools.
#Please be careful with this script as it doesn't seem to kill even after exiting the shell session.  Be sure to 'ps -ef'

echo ""$$" $$ should be the PID of this script.  Use ps -ef |grep -i $$ to find the parent ID and kill -9 the process tree."

#Uncomment the next line to 'arm' the script 'Ready'.
#fulload() { dd if=/dev/zero of=/dev/null | dd if=/dev/zero of=/dev/null | dd if=/dev/zero of=/dev/null | dd if=/dev/zero of=/dev/null & }; fulload; read; killall dd
