#!/bin/bash
read -p "Please enter the name of the configmap: " cmnamevar
kubectl -n development describe configmaps $cmnamevar
