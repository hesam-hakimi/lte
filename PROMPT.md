Continue the existing CLUE project and implement the scoped fixes identified by the Excel conformance audit.

USER CLARIFICATION — AUTHORITATIVE FOR THIS WORKFLOW

Columns A:W already exist in the input file. They are supplied input transaction data, not fields to retrieve from Symcor or Tungsten. Preserve them in the corresponding output rows and append the enrichment. Do not continue treating their source ownership as an unresolved business question.

For the workbook inspected in the audit, the target is 41 columns, A:AO:

* A:W: 23 existing input columns, preserved in order.
* X:Y: the two Symcor front/back image outputs.
* Z:AO: eight Tungsten field/confidence pairs, in the exact template order.

AP and AQ are absent from that workbook. Do not invent additional fields.

This authorizes scoped implementation changes, focused offline tests and documentation updates. Complete all work supported by the confirmed contract without repeatedly asking for routine approval. All responses, code, comments and artifacts must be in English. Use native filesystem, Git and workbook tools; no screenshots, OCR or browser automation.

1. Resume the current checkout and reuse the audit

Start at C:\repos\W001CLUEinitialRepo. Verify branch, HEAD and working-tree/index state. Read applicable AGENTS.md, docs\handoff\clue\START_NEW_SESSION.txt and the current referenced handoff/task register. Preserve other sessions’ changes and staging.

Locate and read CLUE_BUSINESS_TEMPLATE_CONFORMANCE_AUDIT_2026-09-21.md, verify_business_template_conformance.py, the audited workbook and relevant current input/output contracts. Reuse the audit evidence; do not repeat the broad audit or restart the project. Record the actual input/template paths and template identity used.

2. Implement input preservation and request mapping

Inspect the actual supplied input file and choose or minimally extend the appropriate input profile. Do not assume its serialization solely from the Excel screenshot, and do not use the legacy DAT_CSV_V1 schema to override the user’s confirmed A:W input contract. Preserve existing DAT support where required by the accepted project scope.

Read the exact 23 input headers and carry each source row through enrichment without losing or renaming its A:W data. Preserve leading zeros, values, blanks, date/time and amount representation, and relevant formatting. Keep the original input file unchanged.

Map the subset of input fields required for Symcor requests into the existing internal request model using documented field meanings. Preserve all remaining input fields for output. Do not invent aliases or equate fields merely because their names look similar. Report any specific unresolved request-field meaning after completing the unblocked work.

Handle the actual supplied file shape, including blank X:AO output placeholders if present. Enrichment columns must not be required populated input fields. Keep legend/SLA/example annotations out of transaction processing. Validate missing or ambiguous required input headers with actionable errors.

Preserve established transaction/cheque association and RETURN_ALL_CHEQUES behavior. When an accepted multi-cheque result expands a row, copy the correct original A:W values to each related output row. Do not use account plus date as a unique key or introduce a new row-expansion policy.

If the actual input file is unavailable, implement and test against a clearly identified synthetic input derived from the verified template headers. Report real-input validation as pending; do not reopen the confirmed source ownership of A:W.

3. Implement the business output layout

Make the normal configured pipeline for this business workflow generate the template-compatible workbook. Do not create a separate test-only writer or manually reshape a generated workbook to make verification pass.

Use the template’s exact worksheet/header placement, 41 column positions, header text, group colors and material number/cell formats. Preserve repeated Confidence level headers positionally without deduplication or suffixes. Include no extra index, status or debug columns in the business table; retain diagnostics through the existing logging/sidecar mechanism.

Replace the current six-column-per-OCR-field layout in this business output with the required value/confidence pairs. Use the existing eight documented metadata fields whose names/order already match the template. Update stale documented input-column definitions, including missing T:W, and record eight confidence columns for this template in the contract.

4. Resolve the remaining representation questions from evidence

Review existing accepted decisions, provider contracts and sanitized samples for:

* CP-D05: the required X:Y image representation, such as an image, file reference or hyperlink.
* Confidence: each provider’s source scale and the required business output scale.

Apply an already documented decision directly. A test fixture alone does not establish the business contract. Do not infer confidence scale from numeric magnitude or silently choose a production default. Preserve missing confidence distinctly from valid zero.

If either decision genuinely remains unresolved, complete the input preservation, layout, status fixes and all other supported changes. Isolate and report the precise unresolved representation; do not claim full conformance. Clearly label any test-only representation used in a synthetic workbook. Ask only the remaining concrete question after reviewing the available evidence, rather than stopping the whole task upfront.

5. Fix the field-status defect

Inspect the reported app.py status fallback and fix it based on the individual field entry, not whether any other field was returned. A returned field must not be labeled not_returned_by_provider. Preserve authoritative provider statuses and distinguish missing values from valid zero or empty values according to the established contract.

Add focused regression coverage for a mixed response containing returned and absent fields, including zero confidence. Avoid unrelated refactoring.

6. Verify through the real pipeline and deliver

Reuse existing sanitized fixtures, offline adapters and helpers. Generate a fresh synthetic .xlsx using the same input reader, mapping and writer used by the configured application, then reopen and compare it with expectations derived independently from the supplied template.

Verify all 41 headers/positions, A:W value preservation, image-to-row association, all eight OCR value/confidence pairings and required formatting. Use distinct synthetic values to detect swapped fields. Reuse relevant coverage for repeated account/date transactions, accepted row expansion, missing image sides and partial OCR. Test the changed input validation and status behavior. Run only relevant regression checks; do not rerun the entire suite or build another simulator.

Reuse the existing conformance checker, keeping its expected schema anchored to the verified 41-column template. Report structural/header equality and semantic mapping separately. Count PASS, FAIL and BLOCKED separately; define extra-column counts clearly. Do not weaken assertions to accommodate the current implementation.

Update the existing audit/handoff/task register with the user’s input clarification, actual changes, commands/results and any remaining decisions. Do not modify CI/CD, .github content, credentials or the original workbook; do not commit/push, run live provider calls or alter the separate DEV/F5 work.

Return:

1. What changed and the exact affected files.
2. A:W, X:Y, Z:AO and layout status, with remaining gaps clearly identified.
3. Actual verification commands/results and the code revision/uncommitted state tested.
4. Absolute paths to the generated synthetic output, updated mapping/report and verification tool.
5. Only the business decisions or missing evidence that still prevent complete conformity.

Claim complete conformance only when the generated output and verified contracts support it. Keep offline file conformance separate from live Symcor/Tungsten integration status.
