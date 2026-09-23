The deployment decision has changed: do not include JKS files in the deployment or Vault handoff. Prepare PEM material from the existing Symcor client identity.

This supersedes the earlier instruction to copy JKS files without extracting them.

1. Inspect the active Symcor TLS implementation and existing certificate configuration. Identify the exact client certificate/key used and the formats supported by the current Python client.
2. Reuse verified existing PEM files where available. Otherwise, securely export the matching client certificate chain and private key from the original JKS using the existing credentials. Preserve the original JKS. Do not generate a new identity or select an arbitrary alias.
3. Prepare a restricted folder outside Git containing:
    * client-chain.pem
    * client-key.pem
    * server-ca.pem only if required by the current server-verification configuration.
    Keep client-chain certificates distinct from server trust CAs. Protect the private key using the approved handling method and document whether the current TLS client supports an encrypted key. Do not silently change the application to accommodate it.
4. Perform offline checks: certificate/key match, certificate validity dates, and loading through the applicable TLS configuration. Report what these checks establish; do not claim live connectivity.
5. Prepare a protected, temporary symcor-tls.json payload for HashiCorp Vault KV v2 containing the PEM contents. Do not print its contents or any passwords. Include a key password only if required, using its actual value from the existing approved source without assuming it equals the JKS password.
6. Return the secure local paths, a sanitized file/setting mapping, and a Vault upload command template. Use placeholders for any unknown Vault address, namespace, mount, or destination. Make the template refuse to overwrite an existing secret.

Do not upload until the exact destination and approved authentication context are known. Do not make network calls, change application settings, commit secret material, or expose private keys, passwords, or secret JSON in chat/logs.

If the private key is unavailable or not exportable, report that specific blocker. A public certificate alone is not a substitute.
