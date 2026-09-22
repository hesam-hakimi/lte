URGENT: Transfer my existing Symcor client identity from my laptop to DEV and use it to complete the authenticated connectivity test.

I authorize transferring my Symcor client certificate and matching private key, or the keystore containing that identity, to my private directory on DEV for this test. This supersedes the earlier restriction against copying the laptop Symcor identity for this specific task.

Use the established SSH/SCP connection:
tag5916@crcluesbdzwnk0.dev.vmc2.td.com

1. Identify the correct laptop files.
    Reuse the exact Symcor identity and configuration used in the successful laptop PAT test. Check the existing configuration and documented TLS location, including %LOCALAPPDATA%\clue\tls where applicable.

Confirm that the identity includes its matching private key. Prefer the existing working PEM pair or PKCS#12 bundle. If conversion from JKS is necessary, use existing tooling and export only the configured identity without altering the original keystore.

2. Transfer into a private DEV location.
    Create a new run-specific directory under:
    /home/tag5916/clue_private/tls/

Use directory permissions 0700 and credential-file permissions 0600, owned by tag5916. Transfer only the selected Symcor identity, required intermediate certificates, and CA bundle if needed.

Preserve SSH host-key verification. Leave /etc/certs and other users’ files unchanged. Keep credentials outside Git. Do not copy the laptop’s SSH private key or entire .env file.

Verify transfer integrity and certificate/key correspondence without printing private material or passwords. Reuse the existing secure passphrase mechanism; if a password is genuinely missing, request hidden terminal entry rather than asking for it in chat.

3. Immediately test FROM DEV.
    Use installed curl/OpenSSL; this task does not depend on a Python upgrade or a new service account.

Perform one GET to:
https://penhubpat.td.com/aws/services/AwsService?wsdl

Explicitly configure the newly transferred client identity. Keep hostname and server certificate verification enabled. Use the correct CA trust and a 10-second connection timeout / 30-second overall timeout.

Save the response and diagnostics privately. Check the curl exit code, HTTP status, and whether the body is the expected WSDL—not merely HTTP 200.

4. Report actual results.
    Include execution hostname/user, UTC timestamp, remote credential paths, public certificate fingerprint, TLS outcome, HTTP status, WSDL validation, and evidence paths. If unsuccessful, identify the first failing stage from the actual error.

Proceed with the authorized transfer and test now. Keep broader deployment and end-to-end processing outside this urgent task.
