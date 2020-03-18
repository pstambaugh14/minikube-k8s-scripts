#!/bin/bash
read -p "Please enter the configMap name: " cmnamevar
kubectl -n development get configmaps $cmnamevar -o yaml
