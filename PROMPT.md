Continue the current CLUE session. The next goal is a bounded real Symcor test from my Windows laptop using the application’s actual transport.

Your latest report says the JKS opens, alias clue.dev.td.com contains a usable private key, and the current application does not present a client certificate. Reuse that evidence and the existing diagnostics.

1. Confirm the active checkout, current handoff and actual Symcor request path, including any Session or adapter configuration. Preserve unrelated changes and reconcile any ongoing connectivity attempt.
2. If the missing client-certificate configuration is confirmed, implement the smallest change needed to supply the client identity and certificate chain to the active Symcor transport. Keep server CA verification separate from client authentication. Scope the identity to the intended Symcor endpoint.

Use a supported loading method compatible with the installed runtime. Do not pass a JKS file directly to Requests’ cert parameter. If conversion is necessary, preserve the original JKS, protect temporary key material outside the repository, and clean it up. Never print passwords or private keys, expose them in command arguments, or commit them.

Use the locally available password securely. Define and document the configuration the application actually consumes; do not assume the existing JKS variable is effective.

3. Run focused checks for the changed transport. Verify that the configured client identity is used and invalid required mTLS settings fail clearly without silently falling back to a connection without a client certificate.
4. Perform one bounded connectivity attempt against the confirmed PAT endpoint:
    https://penhubpat.td.com/aws/services/AwsService

Keep certificate and hostname verification enabled, preserve the required proxy route, disable redirects, and use explicit timeouts.

If TLS succeeds and approved test criteria are available, execute one limited read-only searchTransaction request through the existing application request builder. Do not invent search criteria or run the full processing job.

Keep this test serial and preserve existing retry limits and concurrency controls. Do not repeat identical failed attempts.

Return:

* Changed files and the configuration names actually used.
* Focused validation results.
* Observed DNS/TCP/TLS/HTTP/SOAP results, marking unobserved stages accurately.
* A reproducible command with secrets omitted.
* The exact remaining blocker and saved report path.

An HTTP response alone does not establish successful SOAP authorization. Do not attribute a reset to F5 without supporting evidence. Keep this task focused; no deployment, commit, push, or broad acceptance-suite rerun.
