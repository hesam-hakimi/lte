One clarification on the files I shared: the agent reports that the current client-key.pem is encrypted, and the key-match/loading checks are still pending.

Our application supports encrypted keys through a custom SSLContext, but I understand the deployment agreement is an unencrypted PEM key. We need to validate the final certificate/key pair before Vault onboarding.

Please confirm whether Vault will provide one combined Base64 PEM or separate Base64 values for the certificate chain, private key, and server CA bundle. The certificate issuer also needs to be accepted by the target Symcor endpoint.
