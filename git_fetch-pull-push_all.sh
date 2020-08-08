#!/bin/bash

#This script will update ALL of your GitHub projects sitting on a local repository onto your GitHub repository.
#By 'update' I mean - git fetch, pull, add, commit, and push.
#Git projects are found from the specified parent directory prompt and down-level from there.

#NOTE: This Script Does NOT have functionality in terms of options for tags/branches yet!  You may receive errors if looking
#      to specify specific branches/tags while running the script.  Either way, this script defaults to whichever branch/tag
#      is specified as origin 'master'.  

#WARNING!  This script WILL overwrite local repositories with latest remote code AND will then overwrite remote code with latest local code.

#Exit when any command fails
#set -e

#Root check
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

#Current Path Variable
DIRVAR=`pwd`

#Git Prompts
read -p "From which directory would you like to start search for Git projects? - ex) "/" for root, "${DIRVAR}" from this directory.: " searchvar
echo ""
read -p "Username for https://github.com: " username
echo ""
read -sp "Password for https://github.com for $username: " password
echo ""
read -p "Commit Message for ALL local repositories about to be potentially committed: " commit
echo ""
echo "Received Username and Password, Continuing... "
echo ""
echo ""

#Find the Git projects Starting from the Parent Directory Until a maxdepth of 14 directories
echo "Searching for Git projects under "${searchvar}"..."
echo ""
find "${searchvar}" -mindepth 0 -maxdepth 14 -type d -name '.git' 2>/dev/null | tee /tmp/dirlist.tmp
echo ""

#Provide stdout/console with a number for how many Git projects found
numvar=`wc -l /tmp/dirlist.tmp | awk '{ print $1 }' | head -1`
echo "Found a total number of "${numvar}" directories with Git projects!" 
echo ""
echo ""

#Validation via Y/y to continue
echo "Next, will begin applying fetches, pulls, adds, commits and pushes to all found Git projects...! "
read -p "Are you sure? - Please validate before continuing! Y/y | N/n : " -n 1 -r
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo "Key other than Y/y input, exiting... "
    exit 1
fi

#Confirmation of Validation
echo ""
echo "Received confirmation - continuing execution of script... "
echo ""

#Iterations and While Loop as 'read' Array from List of Found .git folders
i=0
while read line
do
	arr[$i]="$line"
	cd "${line}/../"
	VAR1=`pwd`
	echo "Changing Directory into "${VAR1}""
	echo ""
	echo "Checking to see if in correct directory..."
	/usr/bin/pwd
	echo ""
	echo "Setting Credentials for GitHub..."
	#git config user.email "${email}"
	#git config user.name "${username}"
	echo ""
	echo "Pulling Origin URL within Local Directory..."
	origin=$(git remote get-url origin)
	echo "Setting Username and Password for Fetch and Pull..."
	origin_with_pass=${origin/"//"/"//"${username}":"${password}"@"}
	echo "Testing Fetch Command..."
	output=$(git fetch ${origin_with_pass} master 2>&1) && exit_status=$? || exit_status=$?
	echo "$output is the output variable."
	echo "$exit_status is the exit_status varaible"
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
		output2=$(git commit -m ""${commit}"" 2>&1 ) && exit_status1=$? || exit_status1=$?
		output3=$(git push "${origin_with_pass}" master 2>&1 ) && exit_status2=$? || exit_status2=$?
		#if [[ $exit_status1 -ne 0 && $exit_status2 -ne 0 ]]; 
		if [[ $exit_status2 -ne 0 ]]; 
		then
			echo "Your branch is up to date with 'origin/master, skipping..." 
		else
			echo "Executing git commit -m "${commit}" on "${origin}""
			git commit --author=""${username}" <>" -m "${commit}"
			echo ""	
			echo ""		
			echo "Executing 'git push origin master'"
			git push "${origin_with_pass}" master
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