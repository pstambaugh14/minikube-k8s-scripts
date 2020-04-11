TODO:
1) Provide a legit README.MD...
2) Upon further examination of the code, implement the following changes:
    A) MAJOR CHANGE!:. Rather than configure each file that does NOT require executable permissions, execute 0664 on ANY other file extensions other than those required of exec configuration line...
    B) Fix comments in the wrong spot (reference to if condition checking if tmp file already exists or not.
3) MUST: Ensure that pem, pki, ssh, rsa, gpg files and directories associated with them have proper permissions as well!!! CRUCIAL!  This is especially needed if, say, executed from the /home/$USER's ~ directory... 
    A) example - Correct access rights for .gnupg and subfolders:
find ~/.gnupg -type f -exec chmod 600 {} \;
find ~/.gnupg -type d -exec chmod 700 {} \;
4) 
    
