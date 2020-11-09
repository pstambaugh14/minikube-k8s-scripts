#!/bin/bash

echo "Printing the current user running this script..."
echo "===================================="
echo "|  $(whoami) is the current user    |"
echo "===================================="
echo ""

echo "Printing basic user id information for $USER..."
id
echo ""

EUIDVAR=`id -u`
echo "$EUIDVAR is the euid (effective user ID)"
echo ""

RUIDVAR=`id -u -r`
echo "$RUIDVAR is the ruid (real UID)"
echo ""

echo "Printing the Login Control SessionID for this current Session..."
SEATVAR=`loginctl show-seat seat0 | grep ActiveSession | sed 's/ActiveSession=//'`
echo $SEATVAR


echo "Printing All Users with Login capabilities."
cat /etc/passwd | grep -v nologin | grep -v false
echo ""

echo "Printing User Information via passwd..."
PWDVAR=`cat /etc/passwd | grep $RUIDVAR`
echo ""

PIDVAR=$$

echo "$PIDVAR is the current shell PID..."
echo ""

echo "Printing shell process information to stdout..."
ps -ef | grep -i $$ | grep -v grep | grep -v "ps -ef"
echo ""

echo "Printing additional shell information to stdout..."
ps aux |grep -i $$ | grep -v grep
echo ""

echo "Printing the current TTY for this session..."
#TTYVAR=`loginctl |grep -i $EUID | awk '{ print $5 }' | grep -i $SEATVAR`
TTYVAR=`loginctl |grep -i $EUID | grep -i $SEATVAR | awk '{ print $1 }'`
echo "$TTYVAR is the current TTY"
echo ""
TTYLA=`ls -la /dev/${TTYVAR}`
echo "Printing the ownership and permissions of /dev/${TTYVAR}..."
echo "${TTYLA}"

PTSVAR=$(tty)

echo "Getting current pseudo TTY of this shell..."
echo "${PTSVAR} is the current pseudo TTY"
echo ""

echo "Printing basic $USER id information..."
id
echo ""

echo "Printing RunLevel in Linux..."
who -r
echo ""

echo "Printing who is logged in..."
who -H -a
echo ""

echo "Printing Extended User Information... "
w -o
echo ""

echo "Printing CGroup and Graphical Shell-related Information..."
loginctl
echo ""

echo "Printing last logged user sessions..."
last 
echo "" 

#echo "Printing General Namespace Information..."
#lsns -W -u --output-all
#echo ""

#echo "Printing Systemd Control Groups Listing & Kernel Threads..."
#systemd-cgls -a -k
#echo ""



