#!/bin/bash
read -p "Please enter the namespace: " nsvar
read -p "Please enter the configMap name: " cmnamevar

#THIS WILL RETURN YOUR DATA IN YAML FORMAT.
kubectl -n $nsvar get configmaps $cmnamevar -o yaml

#OTHER OUTPUT FORMATS INCLUDE: 'https://kubernetes.io/docs/reference/kubectl/overview/#output-options'
```
-o custom-columns=<spec>	Print a table using a comma separated list of custom columns.
-o custom-columns-file=<filename>	Print a table using the custom columns template in the <filename> file.
-o json	Output a JSON formatted API object.
-o jsonpath=<template>	Print the fields defined in a jsonpath expression.
-o jsonpath-file=<filename>	Print the fields defined by the jsonpath expression in the <filename> file.
-o name	Print only the resource name and nothing else.
-o wide	Output in the plain-text format with any additional information. For pods, the node name is included.
-o yaml	Output a YAML formatted API object.
```
