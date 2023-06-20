# Sealed Secrets

Sealed Secrets provides declarative Kubernetes Secret Management in a secure way. Since the Sealed Secrets are encrypted, they can be safely stored in a code repository. This enables an easy to implement GitOps flow that is very popular among the OSS community.

Bitnami Sealed Kubernetes controller can be used to encrypt/decrypt your application secrets in a secure way.

The order of events is the following:

- You install the Bitnami Sealed secrets controller in the cluster. It generates a public and private key. The private key stays in the cluster and is never revealed.
- You take a raw secret and use the `kubeseal` utility to encrypt it. Encryption happens with the public key of the cluster that you can give to anybody.
- The encrypted secrets are stored in Git. There are safe to be committed and nobody can decrypt them without direct access to the cluster.
- During runtime you deploy the sealed secret like any other Kubernetes manifest. The controller converts them to plain Kubernetes secrets on the fly using the private key of the cluster.
- Your application reads the secrets like any other Kubernetes secret. Your application doesn’t need to know anything about the sealed secrets controller or how the encryption decryption works.
