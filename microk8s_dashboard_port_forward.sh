#!/bin/bash
microk8s.kubectl port-forward -n kube-system service/kubernetes-dashboard 443:443
#kube-system   kubernetes-dashboard        ClusterIP   10.152.183.25    <none>        443/TCP
