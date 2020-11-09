#!/bin/bash

#STOOPID THAT LINUX HASN'T MADE THIS EASIER ALREADY... THIS IS HOW WE DO IT... 

SEATVAR=`loginctl show-seat seat0 | grep ActiveSession | sed 's/ActiveSession=//'`

echo $SEATVAR
