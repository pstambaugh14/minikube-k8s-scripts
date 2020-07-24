#!/bin/bash
#This script is intended to emulate a logoff followed by a login by the user executing the script. 
#This comes in handy when there are situations in which something like 'sudo usermod -a -G <group> <$USER>' 
#doesn't reflect in accordance with the live Operating System's configurations globally (i.e. - when a 
#reboot, logoff or whatever is necessary to interact with another element, application, setting, etc.).

exec su -l $USER
