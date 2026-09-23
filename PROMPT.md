Continue from the DEV trust comparison. Run one controlled laptop PAT test using the existing local CA bundle whose SHA-256 matches the DEV bundle.

Certificate-use confirmation is already recorded. Reuse the validated combined PEM, existing application transport and known-good control request.

Run this wrapper exactly once:

& ‘C:\repos\clue-e2e-20260922\tls_handoff_tools\Invoke-SymcorDevControlCheck.ps1’ -CaBundle ‘C:\Users\tag5916\AppData\Local\clue\tls-pem-handoff-20260923\server-ca.pem’ -IHaveIssuerScopeConfirmation

Before connecting, verify offline that the CA hash matches the recorded DEV value and the target remains:
https://penhubpat.td.com/aws/services/AwsService

Keep certificate and hostname verification enabled. Use a 20-second limit, no retries, no redirects and no additional diagnostic connections. Change only the process-scoped CA selection and restore the previous environment afterward.

Report:

* Effective CA source and hash.
* Server TLS verification result.
* Client authentication evidence, distinguishing observed results from assumptions.
* HTTP/SOAP outcome and whether the expected response with actualSize=1 was received.

If it fails, stop and report the exact stage and sanitized error. A verification error alone does not prove Netskope interception; a connection reset alone does not identify its cause.

Keep the formal CA-reference question open. Do not install certificates, change global trust, expose secrets, upload to Vault or run the batch.
