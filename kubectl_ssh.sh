#!/bin/bash
kubectl get pods --all-namespaces
kubectl exec -it <POD_NAME> -- /bin/bash
