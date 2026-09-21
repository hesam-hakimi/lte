Continue from the latest live-verification results.

The laptop-to-Symcor PAT connection and the manually corrected getCriterionRules request succeeded. Image retrieval and end-to-end processing remain unverified.

1. Resolve the application defect.
    Compare build_criterion_rules_envelope() with the fetched WSDL, current documentation, and saved successful request. Confirm the required clientID element, namespace, and order. Implement the smallest supported correction using the existing configured client ID; do not hard-code the test value.

Explain any discrepancy with Appendix B. Do not assume PAT behavior establishes the production contract or run production probes.

2. Verify the normal application path.
    Confirm the configured TD CA bundle reaches the actual application adapter. Keep server-certificate verification enabled.

Repeat getCriterionRules against PAT through the normal application client, without a manually patched SOAP envelope. Validate the response structure and rules, not only HTTP 200. Add only focused regression coverage for the affected behavior.

3. Resolve DEV testing correctly.
    Distinguish the source execution environment from the destination service environment. Review the approved DEV-to-Symcor mapping. If DEV is authorized to call the PAT endpoint and existing access is available, run the equivalent bounded test from DEV. Otherwise report the specific missing access or mapping evidence.
4. Complete one real image-retrieval case.
    First check existing approved test references for an account number and processing date known to contain a cheque in PAT. Do not treat synthetic spreadsheet examples as approved live search inputs.

If a valid case is available, execute the documented search and image-retrieval sequence, pass the retrieved images to the real Tungsten integration, and generate the workbook through the normal pipeline. Verify the image/document/row association and compare extracted fields with visible cheque content.

If approved input is unavailable, complete the code correction and available verification, then state exactly what test data the Symcor owner must provide.

Return:

* Changes and focused test results.
* Evidence that the normal application request now succeeds.
* Separate laptop and DEV results.
* Separate statuses for image retrieval, real Tungsten processing, and Excel validation.
* The first remaining blocker and artifact paths.

Preserve unrelated work. No fixture fallback, certificate-verification bypass, infrastructure changes, deployment, commit, or push.
