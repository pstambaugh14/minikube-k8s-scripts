#!/bin/bash
docker inspect -f "{{ .NetworkSettings.IPAddress }}" <CONTAINER-NAME>
