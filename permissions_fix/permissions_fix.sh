#!/bin/bash

#Stop on Error Reported
set -e

#Fix Permissions of Files and Directories

#Please remember to run this script as root/sudo.

#Root User Check
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
  echo "Not running as root, please run with sudo ./permissionsfix.sh or as 'root' user (sudo -i to login as root) " 1>&2; exit 2;
fi

#Print Current Working Directory
echo "$PWD is the current working directory -- ONLY directories under this current directory will receive new permissions... "
echo ""

#Fix Permissions for Directories and Subdirectories (but NOT recursive chmod on ALL FILES under app root directory as it would affect ALL files and folders which we don't want)
echo "Finding directories recursive to $PWD (only directories under $PWD will receive corrected permissions...) "
find . -type d -name '*' -exec chmod 0755 {} \;
echo ""

#Pull Configuration Data
echo "Pulling Configuration Data... "
source files.conf

#Configurations Specific to Executable Files
#echo "Parsing Configuration Data... "
declare -i EXECUNUM
EXECUNUM=$(echo ${#EXECU[@]})

#Check to see if 
echo "Checking to to see if workspace is clean."
if [[ -f /tmp/elements.tmp ]]; then
   rm -f /tmp/elements.tmp
elif [[ ! -f /tmp/elements.tmp ]]; then
    touch /tmp/elements.tmp
fi

#Creates in I/O temporary array as parsing some of this otherwise is not fun... XD
for element in "${EXECU[@]}"; do
 find . -type f -name "*"$element"" -exec echo {} \; >> /tmp/elements.tmp
done

#If there are executable file extensions via config that match what's been found, continue.
if [[ -s /tmp/elements.tmp ]]; then
echo "There exists file extensions able to be modifed as executables... "
elif [[ ! -s /tmp/elements.tmp ]]; then
  echo "There are no executable file extensions found under $PWD, moving on... "
else
  echo "ERROR: An error has occured..." 1>&2; exit 1
fi

#While loop to iterate until 'x' which is the total number of executable or non-executable filetypes.
#Once iteration finalizes, the loop breaks.
#This Loop is intended to validate that the conifigured filetypes exist in the host OS before...
#...executing the permissions commands.  This helps expedite the script's runtime processes (time).

i=0
while [ $i -lt "$EXECUNUM" ];
do
  execvar=$(echo ${EXECU["$i"]})
  findvar=$(find . -type f -name "*"$execvar"")
  if [[ $(find . -type f -name "*"$execvar"") ]]; then
  echo "Found $execvar filetypes that will be set to 0775 executable permissions... "
  find . -type f -name "*"$execvar"" -exec chmod 0755 {} \;
  fi
  ((i=i+1))
done


rm -f /tmp/elements.tmp


declare -i NOEXECUNUM
NOEXECUNUM=$(echo ${#NOEXECU[@]})

if [[ -f /tmp/elements.tmp ]]; then
   rm -f /tmp/elements.tmp
elif [[ ! -f /tmp/elements.tmp ]]; then
    touch /tmp/elements.tmp
fi

#Create the temp file array for available files
for element in "${NOEXECU[@]}"; do
 find . -type f -name "*"$element"" -exec echo {} \; >> /tmp/elements.tmp
done

#If there are non-executable files available, continue.
if [[ -s /tmp/elements.tmp ]]; then
echo "There exists file extensions able to be modifed as non-executables... "
elif [[ ! -s /tmp/elements.tmp ]]; then
  echo "There are no non-executable file extensions found under $PWD, onto searching for .git directories... "
else
 echo "ERROR: An error has occured..." 1>&2; exit 1
fi

#While loop to iterate until 'x' which is the total number of executable or non-executable filetypes.
#Once iteration finalizes, the loop breaks.
#This Loop is intended to validate that the conifigured filetypes exist in the host OS before...
#...executing the permissions commands.  This helps expedite the script's runtime processes (time).

i=0
while [ $i -lt "$NOEXECUNUM" ];
do
  noexecvar=$(echo ${NOEXECU["$i"]})
  findvar2=$(find . -type f -name "*"$noexecvar"")
  if [[ $(find . -type f -name "*"$noexecvar"") ]]; then
  echo "Found $noexecvar filetypes that will be set to 0664 executable permissions... "
  find . -type f -name "*"$noexecvar"" -exec chmod 0664 {} \;
  fi
  ((i=i+1))
done

#Apply the 0664 chmod to each file discovered categorized as a non-executable.
#for element in "${NOEXECU[@]}"; do
#    echo "Applying chmod 0664 to $element type files..."
#    find . -type f -name "*"$element"" -exec chmod 0664 {} \;
#done

#Clean up temp files
rm -f /tmp/elements.tmp


#Git Section

#The 'Git' section is available for those of you with .git folders in your projects.
#This section will bring the .git folder and all of its files back to default permissions.
#For some reason, the .git folders needed extra love even after running the initial script
#without this section included.

#Checks to see if .git directories exist under current working directory
#where this script was executed.
echo "Validating if '.git' directories exist under $PWD..."
lsvar=$(find -type d -name '.git')
gitdir=($lsvar)

#If .git directories were found continue, otherwise exit.
if [[ -z "$gitdir" ]]; then
echo "No .git Directory exists under $PWD directory, exiting..."; exit 0;
else
echo "At least one '.git' directory found under $PWD!  Proceeding... "
fi
echo ""

#Prevents false temp files from being loaded.
if [[ -f /tmp/elements.tmp ]]; then
   rm -f /tmp/elements.tmp
elif [[ ! -f /tmp/elements.tmp ]]; then
    touch /tmp/elements.tmp
fi

#Prepares for a clean print of stdout to shell for user experience. :)
find -type d -name '.git' > /tmp/elements.tmp
cleandir=`cat /tmp/elements.tmp`

#Express at least one .git directory was found and run scripts
#echo "Found a total of ${#gitdir[@]} '.git' directories below $PWD as: ${gitdir[@]}... "
echo "Found a total of ${#gitdir[@]} '.git' directories below $PWD as: $cleandir... "
echo ""
rm -f /tmp/elements.tmp

#Find .git Directories and Set Appropriate Permissions
#echo "Changing the permissions of the following directories to defaul to 0755: "
echo $lsvar | tr ' ' '\n'
#chmod 0755 $lsvar
echo ""

#Find Subdirectories under .git Directories
#echo "Changing the permissions of the files within the directories... "
find . -type d -name '.git' > /tmp/ls.tmp
cat /tmp/ls.tmp

#Converts potential string variable value into an integer.
#declare -i numvar
#numvar=$(wc -l < /tmp/ls.tmp)


#Applying chmod 0755 to directories (global default).
#i=1
for dir in $lsvar
do
echo "Changing the Permissions of Directories Under: $dir"
find $dir -type d  -name '*' -exec chmod 0755 {} \;
done

#Applying chmod 0775
for dir in $lsvar
do
echo "Changing Permissions of Files in $dir... "
find $dir -type f -name '*' -exec chmod 0664 {} \;
done

#Finished!
echo "Script finished executing.  Permissions changed to default values.  Enjoy! =D"

#Cleaning Temporary Files
rm -f /tmp/ls.tmp

#Exiting
exit 0;

#VALDATE FILE TYPES!!
#VALIDATE PERMISSIONS AFTER EXECUTING!
#VALIDATE OWNERSHIP!
