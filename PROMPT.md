Implement the focused CLUE getDocs correction and validate it through the real application pipeline on Linux DEV.

I authorize the application changes, focused regression tests, and isolated DEV staging needed for this correction. This supersedes the earlier “test only, no application changes” restriction for this specific task. Proceed without asking again for permission to make this correction.

All responses, code, tests, and documentation must be in English.

1. Establish the current source and preserve existing work.

Read repository instructions, the latest handoff, and the current branch/diff. Preserve unrelated changes and all previous test evidence. Work on a feature branch, using an isolated worktree if necessary.

Reuse the completed investigation:

* AWSSpecRelease6.1 (2021.05.03).docx, Appendix D, Get Document Samples.
* The saved PAT WSDL/XSD.
* Successful diagnostic evidence under:
    /home/tag5916/clue_private/getdocs_diag_20260922/

The diagnostic retrieved two images for one Debit document and one Credit document. It did not validate the application’s complete Credit pipeline.

2. Correct the actual application request and metadata propagation.

Update build_get_docs_envelope and its necessary callers/models to reproduce the validated request:

* Use the correct SOAP namespace, operation wrapper, and element order.
* Replace documentList with docIDList.
* Remove documentFolder from getDocs.
* Include both siteSpecificDocID and universalDocID for the same document.
* Preserve both identifiers through search/searchTransaction parsing, document selection, and retrieval.
* Preserve their exact values; do not truncate, fabricate, or double-encode them.
* Supply imageFormat=0, deliveryMethod=ONLINE, deliveryDetail=NOTHING, schedulePolicy=SCHEDULE_OFFLINE, and schedulePriorityLevel=1, as used in the successful diagnostic.
* Derive imageMask from the selected document’s documented AvailableSegments value and any existing supported selection rules. Do not hardcode the successful sample’s mask 10 for every document.
* Keep the configured clientID, tracing, TLS, and secret-loading behavior.

If required identity or mask information is absent or invalid, return an explicit diagnostic outcome before sending an invalid request. Do not substitute another document’s metadata.

Document the compatibility values and their source. Remove or update comments that still describe the old malformed request as an intentional workaround.

3. Keep retrieval behavior focused.

Retain one document per getDocs request, as successfully tested. Do not add batching or parallel retrieval as part of this fix.

Preserve the existing Debit/Credit routing and the documented Credit inline-child-document handling. Process every returned in-scope child document without silently imposing a 10-document limit.

Reuse the existing HTTP transport and SOAP/MTOM parser. Make additional integration changes only where necessary to carry identifiers, associate the returned images correctly, or complete this corrected retrieval path.

Do not redesign the pipeline, change search criteria, or broaden this task into unrelated status or OCR fixes. Preserve provider-unavailable outcomes such as sorryFlag rather than presenting them as successful retrieval.

4. Add meaningful regression coverage.

Use authoritative schema validation and synthetic or sanitized fixtures to verify:

* The application-generated getDocs XML conforms to the saved PAT XSD; the previous malformed shape is rejected.
* Both document identifiers and document-specific masks survive the normal parsing-to-retrieval path for Debit and Credit.
* Multiple child documents retain their own identifiers, masks, and source-row associations.
* Missing required metadata is handled before sending a malformed request.
* A representative getDocs MTOM response is associated with the requested document through the existing parser.

Keep real identifiers, images, credentials, and live captures outside Git. Do not add a runtime dependency solely for schema testing.

Run the relevant focused tests and repository-required gates. Do not weaken tests or repeat unrelated suites without a concrete reason.

5. Stage the corrected application privately on DEV.

Use the established connection:
tag5916@crcluesbdzwnk0.dev.vmc2.td.com

Prepare a new private staging directory for the corrected application, preserving the previous deployed tree. Record the source revision plus patch/artifact hash so the executed code is identifiable.

Reuse the existing working environment and secure configuration. Keep TLS and hostname verification enabled, including:
CLUE_TUNGSTEN_CA_BUNDLE=/etc/pki/tls/certs/ca-bundle.crt

Keep requires-python >=3.10 unchanged. Record the actual DEV interpreter; a diagnostic execution on Python 3.9.25 does not establish supported deployment compatibility.

Use fresh run-specific workspaces, state, outputs, and captures. Do not clear or modify the previous pending_technical cases.

6. Execute the standard application end to end.

Reuse the already-converted CSV records without changing their values.

First run:

* Debit Items, Excel row 3.
* Credit Items, Excel row 2, including all child documents returned for that row.

Use the normal batch entry point. The diagnostic helper must not substitute for the application under test.

For the Debit pilot, use the existing supported configuration that exercises getDocs, including docsFetchLimit=0 where applicable. Confirm from captures that the corrected builder was actually called.

Validate the complete path:
CSV → normal routing → Symcor discovery → corrected getDocs → images → real Tungsten processing → final CSV/JSON/XLSX outputs.

If the pilots establish the corrected path works, continue with the remaining source rows so all 5 Debit and 12 Credit rows have an accounted-for result for this candidate. Preserve duplicate source rows and their associations. Avoid repeating completed pilot rows unless a subsequent code change invalidates their results.

Use bounded retries and polling. If a common technical failure reappears, stop repetitive calls and identify affected remaining cases as blocked. Fix directly related integration defects within this scope; report unrelated failures separately.

Do not alter the four previously zero-hit Debit cases to manufacture matches.

7. Return a reviewable change and an evidence-based result.

Include:

* Branch, source revision, changed files, and focused diff summary.
* Regression checks and actual results.
* Exact DEV launch commands and staging identity.
* Per-source-row outcomes and separate Debit/Credit totals.
* Documents discovered/retrieved, image counts, Tungsten jobs completed, output verification, and evidence paths.
* Any remaining failure and its first observed stage.

Distinguish NO_MATCH, provider image unavailability, technical failure, blocked/not-run cases, and successful technical completion. Exit 0 or COMPLETE alone is insufficient.

Keep OCR accuracy NOT EVALUATED without independent expected values. Keep front/back labels identified as assumptions unless supported by documented mapping or provider evidence.

Update the relevant handoff with the implemented correction and observed validation. Preserve the remaining status-classification issue separately.

Complete the correction and available DEV validation in this task. Do not merge, activate scheduled jobs, change shared infrastructure, or send messages to other teams.
