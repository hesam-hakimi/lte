Validate the newly delivered Symcor PEM on my Windows laptop and prepare a minimal real DEV connectivity test using the existing CLUE application.

Read the current local project instructions, latest handoff, configuration and TLS implementation first. Confirm the correct repository and Python environment; do not assume the current terminal directory is correct. Reuse existing validation and smoke-test helpers.

New input:

* Email attachment: clue.dev.td.com.pem.txt.
* The sender says it contains the certificate and private key.
* The agreed delivery is an unencrypted PEM private key, but verify the actual file.
* This is a NEW delivery. Do not substitute the previous encrypted client-key.pem or report its results as validation of this attachment.

1. Locate and inspect the file
    Look for the exact attachment in Downloads and the established local handoff folder. If missing or ambiguous, ask only for its local path.
    Keep the original unchanged and keep all key-bearing files outside Git with access restricted to my Windows account.
    Inspect the content programmatically without printing PEM, Base64, private keys, passwords or environment-file contents. Identify its actual format, certificate count and whether a private key is present and encrypted.
2. Validate the identity locally
    Check certificate validity dates, issuer, relevant key usage/EKU, certificate-chain structure, and whether the private key matches the client certificate.
    If the previous client certificate fingerprint is available, compare it and report whether this is the same identity.
    Verify loading through the application’s actual TLS configuration.
    Use the delivered combined PEM unchanged if supported. Do not generate a new identity, convert formats or overwrite existing certificate files.
    If the key is encrypted, report that the delivery differs from the agreed format; do not silently decrypt it or request a password in chat.
3. Respect the delivery scope
    The email footer labels this a deployment copy and explicitly excludes testing and format changes.
    Check whether existing project evidence confirms that laptop DEV connectivity validation is permitted for this copy.
    If that scope is unresolved, finish the local inspection and prepare the exact live-test command, but do not use this credential online yet. State the specific confirmation needed from the certificate issuer.
    Once that scope is confirmed, proceed with the test below without another general approval request.
4. Run the minimal real DEV test
    Use the existing application’s Symcor client, configured DEV endpoint and existing authentication mechanism.
    Reuse one previously successful, read-only DEV request with known test input. Do not invent account data or use production.
    Apply certificate overrides only to the test process and restore the prior configuration afterward.
    Preserve TLS certificate and hostname verification. Never use verify=False or trust the client certificate issuer as a workaround for server verification.
    Use the trust configuration actually used by this Python runtime. Do not assume that the Windows trust store and the application’s trust store are identical.
    Use bounded timeouts and no retry loop. Do not run the full batch, Tungsten processing, Vault upload or deployment.
5. Report evidence clearly
    Report separately:

* PEM parsing and key encryption status.
* Certificate/private-key match and TLS loader result.
* Whether the live request actually ran.
* Server TLS verification.
* Client authentication and HTTP/SOAP outcome.
* Whether the expected application response was received.

Do not treat a successful local load, an HTTP response alone, or a SOAP authentication fault as proof of successful Symcor authentication.
Distinguish laptop results from anything still unverified on VMC2.

Return a short PASS/FAIL/NOT RUN table, the sanitized cause of any failure, the exact reusable PowerShell command, and the next concrete action.
Keep sensitive response data local and out of chat/logs. Make only the minimal helper changes needed; do not commit or push.
