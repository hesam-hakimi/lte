The certificate issuer, Murugesan, has now replied directly to my question about using this certificate for laptop DEV connectivity testing:

“There is no password associated for this cert. you can use it.”

The issuer-scope blocker is resolved for this test. My authorization for one bounded, read-only DEV request remains in effect.

Run the prepared live test now:

& ‘C:\repos\clue-e2e-20260922\tls_handoff_tools\Invoke-SymcorDevControlCheck.ps1’ -IHaveIssuerScopeConfirmation

Use the validated combined PEM unchanged, the confirmed Python interpreter, and the existing default certifi trust configuration without a custom CA override. Keep certificate and hostname verification enabled.

Execute the existing known-good control request against penhubpat.td.com once, using the configured 20-second timeout and no retries. Preserve and restore environment settings through the corrected wrapper.

Do not repeat completed offline checks or request another general approval.

Report:

* Whether the live request was actually sent.
* Server TLS verification result.
* HTTP/SOAP authentication outcome.
* Whether the expected response and actualSize=1 were received.

If it fails, report the precise failure stage and sanitized error. Do not disable verification, add trust anchors, or automatically retry.

Keep secrets and response contents out of chat. Do not run the full batch, upload to Vault, commit or push.
