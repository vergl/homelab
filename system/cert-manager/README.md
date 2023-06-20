# cert-manager

`cert-manager` is a powerful and extensible X.509 certificate controller for Kubernetes and OpenShift workloads. It will obtain certificates from a variety of Issuers, both popular public Issuers as well as private Issuers, and ensure the certificates are valid and up-to-date, and will attempt to renew certificates at a configured time before expiry.

## Installation

Install `cert-manager` using `kustomize`:
```bash
kubectl apply -k .
```

Install [godaddy-webhook](https://github.com/snowdrop/godaddy-webhook) with `kubectl`:
```bash
kubectl apply -f https://github.com/snowdrop/godaddy-webhook/blob/main/deploy/webhook-all.yml