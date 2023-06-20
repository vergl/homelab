# ExternalDNS

ExternalDNS synchronizes exposed Kubernetes Services and Ingresses with DNS providers.

Inspired by Kubernetes DNS, Kubernetes’ cluster-internal DNS server, ExternalDNS makes Kubernetes resources discoverable via public DNS servers. Like KubeDNS, it retrieves a list of resources (Services, Ingresses, etc.) from the Kubernetes API to determine a desired list of DNS records. Unlike KubeDNS, however, it’s not a DNS server itself, but merely configures other DNS providers accordingly—e.g. AWS Route 53 or Google Cloud DNS.

In a broader sense, ExternalDNS allows you to control DNS records dynamically via Kubernetes resources in a DNS provider-agnostic way.

## Installation

In our case, we use `Cloudflare` as our DNS provider. SealedSecret should be pre-generated with cloudflare-api-token before it could be deployed.