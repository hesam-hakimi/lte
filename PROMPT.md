URGENT: Run a focused connectivity test FROM the Linux DEV server TO Symcor PAT now. Defer unrelated deployment, Python upgrades, and regression testing. All responses must be in English.

Reuse the established laptop SSH connection:

* DEV: tag5916@crcluesbdzwnk0.dev.vmc2.td.com
* Symcor: https://penhubpat.td.com/aws/services/AwsService

Execute the checks remotely on DEV, not on the laptop. Use existing diagnostic scripts where suitable; otherwise use installed Linux tools, curl and OpenSSL.

1. Confirm the execution location.
    Record hostname -f, whoami and UTC timestamp. Report whether the request uses a proxy, without exposing credentials.
2. Check DNS and TCP separately.
    Resolve penhubpat.td.com from DEV and test TCP port 443 with a bounded timeout. Record resolved IPs and the actual result. Do not reuse the previous report as current evidence.
3. Test verified HTTPS and client authentication.
    Use the existing configured CA bundle and Symcor client certificate/private key, if available. Check documented application/configuration paths rather than assuming everything is under the user’s home directory.

Keep certificate and hostname verification enabled. Do not use –insecure or disable verification. Do not print secrets or copy laptop credentials for this task.

If client credentials are unavailable, complete the network checks and collect the TLS error, then report authenticated access as BLOCKED. Do not classify a missing client certificate or untrusted CA as a firewall failure.

4. Send one GET request to:
    https://penhubpat.td.com/aws/services/AwsService?wsdl

Use a 10-second connection timeout and 30-second overall timeout. Save the response and diagnostic output privately. Record curl exit code, HTTP status and whether the body is the expected WSDL rather than an HTML/error page. Do not use HEAD/404 as the service-health verdict.

If the existing authenticated SOAP diagnostic is ready, also execute one read-only getCriterionRules request for ALL1 using the configured clientID and existing validated request builder. Check for a valid operation response and SOAP faults. Do not search for or retrieve cheque records.

Return a concise table:
Stage | PASS / FAIL / BLOCKED / NOT RUN | Evidence

Include DNS, TCP 443, server certificate verification, client authentication, WSDL and the optional SOAP operation.

Finish with direct answers:

* Can DEV reach Symcor over the network?
* Can DEV complete a verified authenticated request?
* What is the first failing stage, and what exact configuration or resource is missing?

Provide the executed commands with secrets redacted and the saved evidence paths. Report uncertainty where the evidence does not establish the cause.
