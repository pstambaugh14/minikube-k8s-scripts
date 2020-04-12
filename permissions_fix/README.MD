# THE ULTIMATE PERMISSIONS FIX FOR YOUR \*NIX SYSTEMS!

## Introduction

This script is intented to be used for 8th-layer errors and/or a desire to return to default permissions for whatever reason(s) necessary or desired.  

Have you ever accidentally executed a chmod -R 0644 in a directory that has executable files and scripts?
Or, if you are unsure what default permissions to give to specific files that you are unfamiliar with?

Whatever the case may be, this is a very easy-to-use script to get your environment back to the way it should be!

***WARNING: THIS IS STILL IN ALPHA TESTING SO PLEASE BE CAUTIOUS IF YOU ARE TO RUN THIS.  I WOULD MOST DEFINITELY NOT RECOMMEND THIS FOR ANY SORT OF PRODUCTION ENVIRONMENT WHATSOEVER AT THE MOMENT.***

## FEATURES:
- Defaults for .git directories
- 0644 Defaults for non-executable files
- 0755 Defaults for Directories themselves
- Automated checks and failsafes
 
- 
## Credits
Patrick Stambaugh

## Please check: 
https://github.com/pstambaugh14/minikube-k8s-scripts/permissions_fix

# Overview
- If you have any questions please contact me at pstambaugh14@gmail.com.

# New Goals (fixes to come!):
- Provide a legit README.MD...
- Upon further examination of the code, implement the following changes:
    A) MAJOR CHANGE!:. Rather than configure each file that does NOT require executable permissions, execute 0664 on ANY other file extensions other than those required of exec configuration line...
    B) Fix comments in the wrong spot (reference to if condition checking if tmp file already exists or not.
- MUST: Ensure that pem, pki, ssh, rsa, gpg files and directories associated with them have proper permissions as well!!! CRUCIAL!  This is especially needed if, say, executed from the /home/$USER's ~ directory... 
    A) example - Correct access rights for .gnupg and subfolders:
        find ~/.gnupg -type f -exec chmod 600 {} \;
        find ~/.gnupg -type d -exec chmod 700 {} \;

-----------------------------------------------------------------------------------------------------------------------------

## Configuration
Simply configure the NOEXECU and EXECU lines in the files.conf file sitting in the root directory of the repository.
The NOEXECU configuration variable will configure non-executable files for 0664 file permissions and the EXECU line will be configured for executable files.  The script runs as redundant, starting from the directory in which the permissions_fix.sh file resides.  

Example 1:
NOEXECU=( .txt .md Dockerfile* Jenkinsfile* .yaml .yml .json *ignore* LICENSE* .hbs .js .lock docker-compose* .bak Gemfile .conf .properties .test env2yaml .gemfile post_push logstash )

Example 2: 
EXECU=( .py .sh .rb .erb )

## INSTALL INSTRUCTIONS
Simply run the script.  The script runs as redundant, starting from the directory in which the permissions_fix.sh file resides. Also make sure that the files.conf configuration file sits in the same directory as permissions_fix.sh.  

```
MORE INFO
```

