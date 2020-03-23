#!/bin/bash

#Fix Permissions of Files Hopefully to Original

#Print Current Working Directory
echo $PWD

#Fix Permissions for Directies and Subdirectories (but NOT recursive chmod on ALL FILES under app root directory as it would affect ALL files and folders which we don't want)
find $PWD -type d -name '*' -exec chmod 0775 {} \;

#Fix Files with Universal Necessities
find $PWD -type f -name '*.txt' -exec chmod 0664 {} \;
find $PWD -type f -name '*.sh' -exec chmod 0775 {} \;
find $PWD -type f -name '*.md' -exec chmod 0664 {} \;
find $PWD -type f -name '*Dockerfile*' -exec chmod 0664 {} \;
find $PWD -type f -name '*Jenkinsfile*' -exec chmod 0664 {} \;
find $PWD -type f -name '*.yaml' -exec chmod 0664 {} \;
find $PWD -type f -name '*yml' -exec chmod 0664 {} \;
find $PWD -type f -name '*.json' -exec chmod 0664 {} \;
find $PWD -type f -name '*ignore' -exec chmod 0664 {} \;
find $PWD -type f -name '*LICENSE*' -exec chmod 0664 {} \;
find $PWD -type f -name '*.hbs' -exec chmod 0775 {} \;
find $PWD -type f -name '*.js' -exec chmod 0664 {} \;
find $PWD -type f -name '*.lock' -exec chmod 0664 {} \;


###UNCOMMENT THIS IF .GIT FOLDERS FAIL TO CHANGE PERMISSIONS###
#!/bin/bash
#Place shell script into each .git directory, as mass changing via chmod does not function recursively.
#Find each .git Directory
#gitvar=`find $PWD -type d -name '.git'`
#Find the number of .git directories total
#gitnum=`echo $gitvar | awk '{print NF}'`
#Begin the Loop which iterates until array/list provided by stdout of $gitnum runs to 0
#echo $gitvar > $PWD/file.txt
#i="0"
#while [ $i -le "$gitnum" ]
#do sudo chown -R patrick:patrick $gitdir && sudo chmod -R 0664 $gitdir && sudo chmod 0775 $gitdir
#i=$[$i+1]
#gitdir=`cut -d' ' -f$i file.txt`
#done
