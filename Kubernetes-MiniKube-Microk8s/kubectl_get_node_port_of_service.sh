#!/bin/bash
kubectl get service <SERVICE> --output='jsonpath="{.spec.ports[0].nodePort}"'
