 
#!/bin/bash

#A simple script to check out the capabilities of parsing JSON from shell into Docker's API (could be useful for many other scenarios).

#In this, in particular, it is: requesting the Docker Daemon (API) to print 'Hello World' in an already-pulled image of your choice that will spin-up a container.
curl --unix-socket /var/run/docker.sock -H "Content-Type: application/json" \
  -d '{"Image": "<image_name>", "Cmd": ["echo", "hello world"]}' \
  -X POST http:/v1.24/containers/create
