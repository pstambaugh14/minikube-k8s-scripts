#!/bin/bash

#This script will update ALL of your GitHub projects sitting on a local repository onto your GitHub repository.
#By 'update' I mean - git fetch, pull, add, commit, and push.
#Use this script if all of your GitHub projects are under the same parent directory.

#NOTE: This Script Does NOT have functionality in terms of options for tags/branches yet!  You may receive errors if looking
#      to specify specific branches/tags while running the script.  Either way, this script defaults to whichever branch/tag
#      is specified as origin 'master'.  

#WARNING!  This script WILL overwrite local repositories with latest remote code AND will overwrite remote code with latest local code.

# exit when any command fails
#set -e

read -sp "Username for https://github.com: " username
echo ""
read -sp "Password for https://github.com for $username: " password
echo ""
read -p "Commit Message for ALL local repositories about to be potentially committed: " commit
echo ""
echo "Received Username and Password, Continuing... "
echo ""
echo ""

DIRVAR=`pwd`
find "${DIRVAR}" -mindepth 1 -maxdepth 1 -type d -name '**' > /tmp/dirlist.tmp
numvar=`wc -l /tmp/dirlist.tmp | awk '{ print $1 }' | head -1`
echo "Found a total number of "${numvar}" directories to git fetch and pull from!" 
echo ""
echo ""

i=0
while read line
do
	arr[$i]="$line"
	cd "${line}"
	VAR1=`pwd`
	echo "Changing Directory into "${VAR1}""
	echo ""
	echo "Checking to see if in correct directory..."
	/usr/bin/pwd
	echo ""
	echo ""
	echo "Pulling Origin URL within Local Directory..."
	origin=$(git remote get-url origin)
	echo "Setting Username and Password for Fetch and Pull..."
	origin_with_pass=${origin/"//"/"//"${username}":"${password}"@"}
	#$(git fetch ${origin_with_pass} master)
	echo "Testing Fetch Command..."
	output=$(git fetch ${origin_with_pass} master 2>&1) && exit_status=$? || exit_status=$?
	echo "$output is the output variable."
	echo "$exit_status is the exit_status varaible"
	#git fetch ${origin_with_pass} master || :
	#RESULT="$?"
	#if [[ $RESULT -eq 0 ]]; 
	#if [[ $RESULT == 0 ]];
	#if [ -z "$(git fetch ${origin_with_pass} master 2>&1 >/dev/null)" ];
	if [ $exit_status -eq 0 ];
	then	
		echo "Fetching from origin 'master'"
		git fetch ${origin_with_pass} master
		echo ""
		echo ""
		echo "Pulling from origin 'master'"
		git pull ${origin_with_pass} master
		echo ""
		echo ""
		echo "Executing 'git add .'"
		git add .
		echo ""
		#Checks to see if output of stdout from command equals the string.  
		#Then, if string is true =0, else !0...
		#if [ $? == 0 ]; then
		output2=$(git commit -m ""${commit}"" 2>&1 ) && exit_status1=$? || exit_status1=$?
		output3=$(git push "${origin_with_pass}" master 2>&1 ) && exit_status2=$? || exit_status2=$?
		if [[ $exit_status1 -ne 0 && $exit_status2 -ne 0 ]]; 
		then
			echo "Your branch is up to date with 'origin/master, skipping..." 
		else
			#git commit -m ""${commit}""
			#echo "Executing git commit -m "${origin}": "${commit}""
			#echo ""
			echo "Executing 'git push origin master'"
			git push ${origin_with_pass} master
			echo ""
			echo ""
			echo "Done! Onto the Next One..."
			echo "" 
			echo ""
		fi
	else 
		echo "Nothing to do here, moving on..."	
	fi 	
	i=$((i+1))
done < /tmp/dirlist.tmp
echo "Finishing up..."
rm -f /tmp/dirlist.tmp
echo ""
echo ""
echo "Done!  All Local Git Repositories Up-To-Date with GitHub!"



