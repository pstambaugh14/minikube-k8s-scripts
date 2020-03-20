#!/bin/bash
kubectl get service <service> --output='jsonpath="{.spec.ports[0].nodePort}"'
