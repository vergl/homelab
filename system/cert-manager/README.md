# cert-manager

`cert-manager` is a powerful and extensible X.509 certificate controller for Kubernetes and OpenShift workloads. It will obtain certificates from a variety of Issuers, both popular public Issuers as well as private Issuers, and ensure the certificates are valid and up-to-date, and will attempt to renew certificates at a configured time before expiry.

## Installation

### Prerequisites
`sealed-secrets` controller should be installed in cluster. Also, you should have `kubeseal` utility installed on your machine.

### Generate SealedSecret in place of regular Secret
You have to create a secret manifest with cloudflare api-token. Example (filename: _cloudflare-secret.yaml_)
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: cloudflare-api-token-secret
  namespace: cert-manager
type: Opaque
stringData:
  api-token: <your token here>
```

Then we have to **seal** it with `kubeseal`:
```bash
kubeseal --controller-namespace sealed-secrets --controller-name sealed-secrets --format yaml <cloudflare-secret.yaml > sealed-cloudflare-secret.yaml
```

Don't forget to delete Secret file before deploying to repository
```bash
rm cloudflare-secret.yaml
```
