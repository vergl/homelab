# Kubernetes

This directory contains configurations for the Kubernetes cluster.

## Installation guide
0. Install `kubernetes` using [Kubespray](../iaac/kubespray/README.md)
1. Install [`metallb`](./bootstrap/00-metallb/README.md) as a load-balancer 
2. Install [`cert-manager`](./bootstrap/01-cert-manager/README.md) to store our certificates