#!/bin/bash
read -p "Please enter the name of the namespace: " nsvar
read -p "Please enter the name of the configmap: " cmnamevar
kubectl -n $nsvar describe configmaps $cmnamevar
