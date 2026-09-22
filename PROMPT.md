Continue the CLUE session. Execute a focused live getDocs diagnostic from Linux DEV using the provider-supplied example found in our existing documentation.

This authorizes preparing and sending diagnostic requests for one Debit document and one Credit document. Preserve the test-only boundary: do not modify application code, dependencies, deployment, shared configuration, credentials, or existing runtime state. All responses and artifacts must be in English.

1. Reuse the authoritative contract and existing environment.

Use the original document under:
C:\repos\fcrm_clue\existing code\symcor\

Locate:
AWSSpecRelease6.1 (2021.05.03).docx
Appendix D → Get Document Samples → Request XML

Reuse the extracted document text and saved PAT WSDL/XSD from the completed review. Do not repeat the full documentation investigation or transcribe XML from screenshots.

Execute through the established connection:
tag5916@crcluesbdzwnk0.dev.vmc2.td.com

Reuse the existing Python transport/session, encrypted client identity, secure secret loader, and verified CA configuration. Keep TLS and hostname verification enabled. Do not request passwords already available through the working configuration.

Use the established Symcor PAT endpoint:
https://penhubpat.td.com/aws/services/AwsService

2. Select exactly two documents from saved evidence.

Debit:
Use the document associated with Debit Excel row 3, whose images were successfully retrieved through inline search.

Credit:
Select one child document from Credit Excel row 2. Prefer a document with image availability indicated and without sorryFlag=1. Record the actual availability metadata.

For each document, extract its matching siteSpecificDocID and universalDocID from the same saved provider response. Preserve their exact values and association. Do not use the example’s IDs, a UTI, a parent document ID, or identifiers reconstructed from the workbook.

Keep original identifiers private. Use source sheet/row references in the summary.

3. Prepare valid diagnostic XML outside the application.

Create a small reusable diagnostic helper and request files in a private run-specific directory outside Git. Reuse the existing transport to send the prepared XML. Do not edit or monkey-patch build_get_docs_envelope or implement another batch pipeline.

Follow the provider example and saved PAT schema:

* Correct SOAP envelope, namespace, operation wrapper, and element order.
* The configured clientID and existing tracing mechanism.
* docIDList containing exactly one docID.
* Both siteSpecificDocID and universalDocID.
* No documentFolder element.
* imageFormat = 0.
* deliveryMethod = ONLINE.
* deliveryDetail = NOTHING, following the provider sample; record the prose/sample difference.
* schedulePolicy = SCHEDULE_OFFLINE, the documented compatibility value.
* schedulePriorityLevel = 1.

For imageMask, inspect the selected document’s availability metadata and the documented mask semantics. Use the available mask if the documentation establishes that it uses the same encoding. Otherwise use the provider sample’s value 15 and explicitly record that choice. Do not invent individual bit mappings or interpret the mask as an image count.

Validate each request against the saved applicable XSD before sending. Distinguish actual schema validation from manual comparison. Resolve diagnostic XML mistakes without changing application code.

4. Execute the two requests.

Show the exact launch command without secrets, then execute:

* One getDocs request for the selected Debit document.
* One getDocs request for the selected Credit document.

Use bounded timeouts and one attempt per document. A Debit failure must not suppress the Credit attempt unless a common connection or authentication failure prevents execution.

Save request, response headers, raw response body, UTC timestamp, elapsed time, and correlation information privately. Preserve all previous captures and pending_technical cases.

Do not rerun the 17-row dataset, retry the known-invalid builder, vary field values by trial and error, or initiate Tungsten jobs during this diagnostic.

5. Verify the returned content.

For each response, report separately:

* Transport/TLS outcome.
* HTTP status and any SOAP fault.
* Expected response structure.
* Document identity/correlation, where provided.
* Image/MIME part count, CID resolution, byte lengths, and whether image decoding succeeds.

Do not treat HTTP 200 alone as success. Do not assume exactly two images: mask 15 requests all four documented segment types. Assign front/back or BW/GS labels only when supported by response metadata or documented mapping; otherwise report those labels as unverified.

Use existing parsing utilities where possible. If the response contains images but the current parser cannot process them, distinguish successful provider retrieval from the parsing failure.

6. Return the evidence and next action.

Provide a compact Debit-versus-Credit results table, exact commands, evidence paths, and a comparison with the previously malformed requests.

State clearly:

* Whether a contract-conforming getDocs request retrieved images.
* Any remaining request, provider, availability, or parsing issue.
* Which application changes would be required later, without implementing them.
* That the application’s Credit end-to-end flow remains unvalidated until the correction is integrated and tested through the normal pipeline.

If either request fails, identify the first observed failing stage and the smallest evidence-supported next step. Do not automatically attribute failure to Symcor or retention.

Complete this focused diagnostic now. No code fixes, commits, deployments, full regression runs, or messages to other teams.
