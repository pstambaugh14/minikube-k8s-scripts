#!/bin/bash

#The -a flag tells docker run to bind to the container’s STDIN, STDOUT or STDERR. This makes it possible to manipulate the output and input as needed.

#This pipes data into a container and prints the container’s ID by attaching only to the container’s STDIN.
echo "test" | docker run -i -a stdin ubuntu cat -

#This isn’t going to print anything unless there’s an error because we’ve only attached to the STDERR of the container. The container’s logs still store what’s been written to STDERR and STDOUT.
docker run -a stderr ubuntu echo test

#This is how piping a file into a container could be done for a build. The container’s ID will be printed after the build is done and the build logs could be retrieved using docker logs. This is useful if you need to pipe a file or something else into a container and retrieve the container’s ID once the container has finished running.
cat somefile | docker run -i -a stdin mybuilder dobuild

