#Note: If your Docker registry username is different from the local username you used to create the image, you will have to tag your image with your registry username. For the example given in the last step, you would type:

#Pull the Image from remote to local
docker pull <USERNAME>/<IMAGE>:<TAG>

#Then Tag the Image
docker tag <USERNAME>/<IMAGE>:<TAG> <YOUR-USERNAME>/<IMAGE>:<TAG>

#Then you may push your own image using:
docker push <YOUR-USERNAME>/<IMAGE>:<TAG>
