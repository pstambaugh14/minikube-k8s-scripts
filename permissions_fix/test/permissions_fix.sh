#!/bin/bash

#Fix Permissions of Files and Directories

#Please remember to run this script as root/sudo.

#Root User Check
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root, please run with sudo ./permissionsfix.sh or as 'root' user (sudo -i to login as root) "
    exit
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
echo "Parsing Configuration Data... "
declare -i EXECUNUM
EXECUNUM=$(echo ${#EXECU[@]})

#Execute chmod 0755 to each file extension in the array from sourced configuration file.
#A chmod 0755 will make it so ONLY the owner of the executable file can execute it.

#echo "Validating if executable files exist under $PWD..."

echo "Checking to see if potentially executable file extensions exist under $PWD... "

####NEXT STEP IF PREVIOUS FAILS###
#for element in "${EXECU[@]}"; do
#    find . -type f -name "*"$element"" -exec echo {} \; > /tmp/elements.tmp
#done

#exevar=$(find . -type f -name "${Fruits[@]}")
#exefs=($exevar)
#if [[ -z "$exefs" ]]; then
if [[ -f /tmp/elements.tmp ]]; then
   rm -f /tmp/elements.tmp
elif [[ ! -f /tmp/elements.tmp ]]; then
    touch /tmp/elements.tmp
fi

for element in "${EXECU[@]}"; do
 find . -type f -name "*"$element"" -exec echo {} \; >> /tmp/elements.tmp
done
if [[ -s /tmp/elements.tmp ]]; then
echo "There exists file extensions able to be modifed as executables... "
else
# [[ ! -s /tmp/elements.tmp ]];
  echo "ERROR: There are no executable file extensions found under $PWD, exiting... " 1>&2; exit 1
fi

for element in "${EXECU[@]}"; do
  echo "Applying chmod 0755 to $element type files..."
  find . -type f -name "*"$element"" -exec chmod 0755 {} \;
done
rm -f /tmp/elements.tmp

#Configurations Specific to Non-Executable Files
declare -i NOEXECUNUM
NOEXECUNUM=$(echo ${#NOEXECU[@]})

#Execute chmod 0664 to each file extension in the array from sourced configuration file.
#A chmod 0664 will make the file(s) read/write-able by the owner and group members.
#But it will only be readable (not writable) by users outside of the group.
if [[ -f /tmp/elements.tmp ]]; then
   rm -f /tmp/elements.tmp
elif [[ ! -f /tmp/elements.tmp ]]; then
    touch /tmp/elements.tmp
fi

for element in "${NOEXECU[@]}"; do
 find . -type f -name "*"$element"" -exec echo {} \; >> /tmp/elements.tmp
done
if [[ -s /tmp/elements.tmp ]]; then
echo "There exists file extensions able to be modifed as non-executables... "
else
# [[ ! -s /tmp/elements.tmp ]];
  echo "ERROR: There are no non-executable file extensions found under $PWD, exiting... " 1>&2; exit 1
fi

for element in "${NOEXECU[@]}"; do
    echo "Applying chmod 0664 to $element type files..."
    find . -type f -name "*"$element"" -exec chmod 0664 {} \;
done
rm -f /tmp/elements.tmp


#Git Section

#The 'Git' section is available for those of you with .git folders in your projects.
#This section will bring the .git folder and all of its files back to default permissions.
#For some reason, the .git folders needed extra love even after running the initial script
#without this section included.

echo "Validating if .git directories exist under $PWD..."
lsvar=$(find -type d -name '.git')
gitdir=($lsvar)

#Check to see that .git directories exist under current working directory.
if [[ -z "$gitdir" ]]; then
echo "No .git Directory exists under $PWD directory, exiting..."; exit 0;
else
echo "At least one '.git' Directory found under $PWD!  Proceeding... "
fi
echo ""

if [[ -f /tmp/elements.tmp ]]; then
   rm -f /tmp/elements.tmp
elif [[ ! -f /tmp/elements.tmp ]]; then
    touch /tmp/elements.tmp
fi

find -type d -name '.git' > /tmp/elements.tmp
cleandir=`cat /tmp/elements.tmp`

#Express at least one .git directory was found and run scripts
#echo "Found a total of ${#gitdir[@]} '.git' directories below $PWD as: ${gitdir[@]}... "
echo "Found a total of ${#gitdir[@]} '.git' directories below $PWD as: $cleandir... "
echo ""
rm -f /tmp/elements.tmp

#Find .git Directories and Set Appropriate Permissions
echo "Changing the permissions of the following directories: "
echo $lsvar | tr ' ' '\n'
chmod 0755 $lsvar
echo ""

#Find Subdirectories under .git Directories
echo "Changing the permissions of the files within the directories... "
find . -type d -name '.git' > /tmp/ls.tmp
cat /tmp/ls.tmp

declare -i numvar
numvar=$(wc -l < /tmp/ls.tmp)

i=1
for dir in $lsvar
do
echo "Changing the Permissions of Directories Under: $dir"
find $dir -type d  -name '*' -exec chmod 0755 {} \;
done

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
