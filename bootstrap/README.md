# Bootstrap
This directory helps to configure ArgoCD in a Kubernetes cluster.

## ArgoCD
[ArgoCD](https://argo-cd.readthedocs.io/en/stable/) is a declarative, GitOps continuous delivery tool for Kubernetes.

Argo CD follows the GitOps pattern of using Git repositories as the source of truth for defining the desired application state.

In our case, we use this GitHub repository to keep all applications in our cluster in sync.

## How it works
First, we create an ArgoCD instance in a Kubernetes cluster. 
Directory `argocd` contains a Helm chart with ArgoCD and its configuration.

Then, we create a `root` application, which is used as an [app of apps pattern](https://argo-cd.readthedocs.io/en/stable/operator-manual/cluster-bootstrapping/). Now, all services in this repository (including ArgoCD itself) are managed as a single unit. We can add, edit or remove any information in our manifests and it will instantly be synchronized with a cluster.

## Installation
Go to `argocd` directory and run a [make](./argocd/Makefile) script:
```bash
cd argocd && make
```
It will install ArgoCD to our cluster.

As for now, we don't have a load balancer or an ingress installed yet, so if we want to open ArgoCD UI we have to get an admin password:
```bash
make get-passwd
```
and port-forward UI:
```bash
make port-forward
```

When ArgoCD is installed and ready to go, let's install the `root` application:
```bash
cd ../root && make
```

Now our ArgoCD service is installed and ready to go. It manages itself as well as all other services which are managed in `values.yaml` file.