# RKE2 Vagrant quickstart

This is a quick way to get rke2 up and running on a local system to try it out.

## Requirements

1. vagrant installed on your local machine. 
2. kubectl installed on your local machine (if you want to access Kubernetes outside of the guest machine).

## Running and accessing rke2 via vagrant

To create the vagrant machine with rke2 installed:
    vagrant up

To access the cluster within the vagrant machine:
    vagrant ssh
    export KUBECONFIG=/etc/rancher/rke2/rke2.yaml
    kubectl get pods -A

To access the cluster from your local workstation:
    export KUBECONFIG=config/rke2.yaml
    kubectl get pods -A

