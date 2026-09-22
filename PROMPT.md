Continue the current CLUE session. Create a one-row input workbook using the supplied known test case and execute the real end-to-end pipeline from my laptop against Symcor PAT and the configured real Tungsten test service.

This specific PAT test is authorized. The previous missing-test-input blocker is resolved for this case. Preserve current changes and reuse the existing application, configuration, certificates, and test helpers.

Exact Symcor search:

* documentFolder: ALL1
* ProcessingDate: “20260717”
* ItemSequenceNumber: “4850040005”
* Account: “05224026”
* DebitCreditIndicator: “D”
* Use operator 1 (EQ) for all four search criteria.

The supplied previous response contains one matching document, amount 5000.88 and currency CAD. Treat this as the expected reference, not a substitute for a fresh live response.

1. Create the input workbook.
    Use the actual business template’s A:W headers and order. Populate the supplied values using the documented mappings. Preserve account and identifier values as text, including leading zeros. Leave unrelated optional fields blank.

ProcessingDate is explicitly supplied here. Do not infer it from TransactionDate or globally change their mapping. If necessary, use a scoped test-case configuration alongside the workbook to carry the exact search criteria without adding business-sheet columns.

Ensure the normal application reads this workbook. Do not bypass input ingestion by calling providers directly and then manually assembling Excel.

2. Execute the real Symcor search and image retrieval.
    Use the working PAT endpoint, configured client ID, client certificate, and TD CA bundle with certificate verification enabled.

Build requests using the current WSDL/XSD and corrected application helpers. Do not copy the email’s rewritten Symantec clicktime URLs into XML namespaces.

Preserve all four search criteria. Validate the fresh response against the account, processing date, and item sequence. If the result differs from the expected single document, report the discrepancy without broadening the query.

Use complete document IDs from the fresh response, not the truncated ID in the screenshot. Follow the documented retrieval sequence to obtain the available front/back images.

The historical search response has images=nil. This does not complete image retrieval; continue with the required document/image retrieval operations. Validate that returned payloads decode into actual images and retain document and side associations.

3. Process the images through real Tungsten.
    Submit the retrieved images using the existing documented payload and image-side handling. Preserve the actual metadata, confidence values, and missing-field results.

No fixtures, synthetic images, canned OCR values, or silent provider fallback are permitted for this run.

4. Generate and verify the final workbook.
    Use the normal application exporter:

* A:W: preserve original input values.
* X:Y: embed the actual front/back images, not file paths.
* Z:AO: populate the eight metadata/confidence pairs in template order.

Reopen the generated workbook and verify headers, input preservation, embedded image anchors, and correspondence between each image, document, provider response, and output row.

Compare readable cheque content with the Tungsten output. Report genuine differences; do not overwrite provider results to match expectations. If content comparison cannot be completed, mark OCR accuracy UNVERIFIED.

5. Deliver the artifacts and evidence.
    Provide absolute local paths for:

* Input workbook and any scoped mapping/configuration.
* Retrieved front/back images.
* Final enriched workbook.
* Run report with actual commands, timestamps, result counts, and sanitized errors.

Report separate PASS/FAIL/BLOCKED/NOT RUN statuses for input ingestion, Symcor search, image retrieval, Tungsten processing, workbook validation, and OCR content comparison.

If an application defect prevents this authorized test, diagnose and implement the smallest supported correction, run focused regression checks, and resume. Do not fabricate missing required business values or alter the search scope.

Use bounded timeouts and retries. Preserve credentials and unrelated changes. Do not call production, modify infrastructure, deploy, commit, or push. Complete the execution rather than returning only a plan.
