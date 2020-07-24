#!/bin/bash

#NOTE: THE --type=<Port> WILL HAVE TO BE CHANGED FOR YOUR ENVIRONMENT
kubectl expose deployment <DEPLOYMENT> --type=NodePort
