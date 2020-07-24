#!/bin/bash
kubectl port-forward <POD_NAME> <CONTAINER_PORT>:<HOST_PORT> --namespace=<NAMESPACE>
