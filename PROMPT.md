Continue the current CLUE session. Perform a focused live verification after the reported F5 changes. Execute the tests using the existing project tools and provide actual results. All responses and artifacts must be in English.

New evidence:

* The infrastructure team reports that F5 changes have been applied.
* A colleague’s log shows a completed TLS 1.2 handshake and “SSL certificate verify ok” for penhubpat.td.com.
* HEAD /aws/services/AwsService returned HTTP 404.
* The source environment of that test is not established by the shared evidence.
* Tungsten connectivity is reported working, but successful Symcor API execution remains unconfirmed.

1. Recover the existing test setup.
    Read the current local handoff, endpoint configuration, previous failing test command, and relevant API contract/WSDL. Reuse the configured credentials, certificate, trust store, and existing test scripts without displaying secrets.

Confirm the effective hostname, port, service path, proxy settings, and provider modes. Do not assume penhubpat.td.com, penhubsys.td.com, and sys.symcorF5.easyweb.td.com are interchangeable. Use the documented endpoint for the selected environment.

2. Repeat the previous failing connection test.
    Run from my laptop. If DEV is accessible through the existing configured access, run the equivalent test there separately.

Record the source environment, UTC timestamp, resolved destination IP, TCP outcome, TLS outcome, certificate-verification setting/result, and HTTP status. Do not infer the remote-observed source IP from the local IP.

Keep certificate verification enabled for a verified TLS result. Do not introduce –insecure, verify=False, or other bypasses. Report any existing bypass explicitly. A successful handshake alone does not establish client-certificate authentication or application authorization.

3. Test a real Symcor operation through the application.
    Use the actual CLUE client and its normal HTTP/TLS stack, not only a standalone curl probe. Run the documented SOAP request using the correct service path, operation, headers, and existing approved test input.

Follow the implemented authentication/search/document/image retrieval sequence as required by the contract. Do not invent operations or guess endpoint paths.

A HEAD response, HTTP 200 alone, or an empty result does not prove successful cheque retrieval. Inspect SOAP faults and application status. If a known cheque is retrieved, verify the returned document identity and that the image payload decodes successfully.

Do not use fixtures or silently fall back to a simulator during this live test.

4. Continue one minimal integration case if retrieval succeeds.
    Pass the retrieved image or image pair through the existing real Tungsten integration and generate the Excel output through the normal pipeline.

Verify that embedded images in X:Y and metadata in Z:AO belong to that same cheque, with A:W preserved. Save the actual provider confidence values. Do not claim OCR accuracy unless the extracted values are compared with the image content.

5. Report the exact outcome.
    Provide a compact table by environment:
    DNS | TCP | TLS verification | Symcor operation | Image retrieval | Tungsten processing | Excel output.

Use PASS, FAIL, BLOCKED, or NOT RUN with evidence. Identify the first failing stage, sanitized error, executed command, and local evidence paths. If TLS succeeds but SOAP fails, describe the remaining application/routing/authentication issue rather than continuing to label it a TLS failure.

Use bounded timeouts and attempts. Preserve unrelated work and existing infrastructure/configuration. Do not run a broad regression suite, deploy, commit, or push. If blocked, finish all available checks and state precisely what is missing.
