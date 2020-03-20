#!/bin/bash
#RUN THIS SCRIPT TO ENABLE NON-ROOT EXECUTION OF DOCKER CLI
sudo usermod -aG docker ${USER}
#To apply the new group membership, log out of the server and back in, or type the following:
su - ${USER}
