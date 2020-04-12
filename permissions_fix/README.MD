# GITHUB TITLE - pstambaugh14/minikube-k8s-scripts/permissions_fix

## Introduction

This script is intented to be used for 8th-layer errors and/or a desire to return to default permissions for whatever reason(s) necessary or desired.  

Have you ever accidentally executed a chmod -R 0644 in a directory that has executable files and scripts?
Or, if you are unsure what default permissions to give to specific files that you are unfamiliar with?

Whatever the case may be, this is a very easy-to-use script to get your environment back to the way it should be!

***WARNING: THIS IS STILL IN ALPHA TESTING SO PLEASE BE CAUTIOUS IF YOU ARE TO RUN THIS.  I WOULD MOST DEFINITELY NOT RECOMMEND THIS FOR ANY SORT OF PRODUCTION ENVIRONMENT WHATSOEVER AT THE MOMENT.***

FEATURES:
- Defaults for .git directories
- 
## Credits

- Please check: https://hub.docker.com/<repo>/<image> AND
                https://github.com/<user>/<project>

# Overview
- More info

# New Goals:
- Provide a legit README.MD...
- Upon further examination of the code, implement the following changes:
    A) MAJOR CHANGE!:. Rather than configure each file that does NOT require executable permissions, execute 0664 on ANY other file extensions other than those required of exec configuration line...
    B) Fix comments in the wrong spot (reference to if condition checking if tmp file already exists or not.
- MUST: Ensure that pem, pki, ssh, rsa, gpg files and directories associated with them have proper permissions as well!!! CRUCIAL!  This is especially needed if, say, executed from the /home/$USER's ~ directory... 
    A) example - Correct access rights for .gnupg and subfolders:
        find ~/.gnupg -type f -exec chmod 600 {} \;
        find ~/.gnupg -type d -exec chmod 700 {} \;

-----------------------------------------------------------------------------------------------------------------------------

# Overall Goal of This Project
Explain

# Credits:
Credits to licenses, person(s) involved, due credit to open-source providers or any other contributor.  

## License
Created by <FULL_NAME>.
https://github.com/<username>/<repo>
MIT, APACHE, etc. Other Credits due.

## INSTALL INSTRUCTIONS
INSTRUCTIONS

## Configuration
EXPLANATION

## Quick Start
QUICK START

## ADVANCED/MORE DETAILED INFORMATION ON INSTALL, CONFIGS, ISSUES, BUGS, DEPLOYMENT, STARTUP, ETC.
INFO INFO INFO

## ADDITIONAL INFO:

```
MORE INFO
```
