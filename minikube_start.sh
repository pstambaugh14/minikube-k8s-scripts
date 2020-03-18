#!/bin/bash
#minikube start --memory='2048mb' = RUN ONCE TO SET BASE NODE MEMORY - OTHERWISE ENTIRE VM MUST BE ERASED AND RE-CREATED.
#minikube start --vm-driver=kvm2
#minikube --memory 4096 --cpus 2 start --vm-driver=virtualbox
minikube --memory 4096 --cpus 2 start --vm-driver=kvm2
