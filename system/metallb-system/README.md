# Metallb

MetalLB is a load-balancer implementation for bare metal Kubernetes clusters, using standard routing protocols.

Kubernetes does not offer an implementation of network load balancers (Services of type LoadBalancer) for bare-metal clusters. The implementations of network load balancers that Kubernetes does ship with are all glue code that calls out to various IaaS platforms (GCP, AWS, Azure…). If you’re not running on a supported IaaS platform (GCP, AWS, Azure…), LoadBalancers will remain in the “pending” state indefinitely when created.

Bare-metal cluster operators are left with two lesser tools to bring user traffic into their clusters, “NodePort” and “externalIPs” services. Both of these options have significant downsides for production use, which makes bare-metal clusters second-class citizens in the Kubernetes ecosystem.

MetalLB aims to redress this imbalance by offering a network load balancer implementation that integrates with standard network equipment so that external services on bare-metal clusters also “just work” as much as possible.

## Configuration

Configuration of *Metallb* is contained in the `templates` directory.

## Manual Installation

Install helm if not already installed:
```bash
brew install helm
```

Install Metallb using helm:
```bash
helm install metallb . --create-namespace --namespace metallb-system
```

## Deletion
Uninstall Metallb using helm:
```bash
helm uninstall metallb . --create-namespace --namespace metallb-system
```
