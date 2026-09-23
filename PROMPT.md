Continue the existing CLUE session. Execute the newly supplied Symcor workbook through the normal application pipeline using the latest implemented changes. The owner authorizes the live Symcor/Tungsten calls needed for this new input. This is an execution task, including delivery of the resulting workbooks.

1. Reconcile the current implementation

Read the current project reference, state, business-output mapping and prompt ledger. Treat archived statements as historical.

Prompt 40872 now has a received implementation report: commit d34e07e, search-provenance persistence, 10 new tests, full suite reported as 642 passed / 5 skipped / 0 failed. Any reference still marking its result pending predates that report.

Verify the actual checkout and execution environment contain the latest source-mapping/Q correction, getDocs, classification, output-profile, diagnostic-metadata, cache-path and search-provenance changes. Preserve existing work. Do not reset the checkout, blindly apply commits, or repeat completed investigations.

2. Identify and inspect the new input

The owner’s screenshot places the new workbook under:
C:\repos\FCRM\sources\

Resolve the unique file matching:
20260922165027.xlsx

Report its exact filename, size and SHA-256. If this does not uniquely identify a file, request only the missing file identity.

Do not substitute the older:
C:\repos\fcrm_clue\inputs\rahona\All Transactions.xlsx

Inspect the actual workbook programmatically. The displayed sheet is MON_INSTRUMENTS. Inventory all sheets, full headers, cell types, data rows, directions and populated A:W fields. Determine the supported input profile from its actual schema. Do not assume the photographed row count is authoritative.

Keep the original unchanged. If a minimal sheet-selection or input-adapter adjustment is necessary, implement it through the normal application with focused verification; do not hand-build the final output.

3. Preserve source values and contract boundaries

Preserve supplied A:W business values, identifier representations, duplicate source-row identities and one-to-many lineage.

The earlier DAT_CSV rule deriving Debit Q from ItemSeqNo and leaving Credit Q blank must not overwrite explicitly supplied Transaction_Details in this workbook. Preserve explicitly supplied Transaction_Original_Amount as well.

The screenshot suggests CIF_Number contains values resembling earlier item sequence numbers, while Transaction_Details contains UTI-like strings. Verify and flag these semantic concerns; do not reinterpret CIF_Number as ItemSeqNo, rewrite Q, or declare their business meanings validated.

Separate source-column pass-through from provider search criteria and record linkage. Inspect accompanying native documentation for authoritative mappings. Do not invent joins, assume Account plus date uniquely identifies a document, or equate UTI, CIF and ISN.

CP-D03 remains unresolved unless new evidence explicitly resolves it. Preserve its guards. Do not convert to DAT_CSV merely to bypass a native/Rahona contract guard. Do not pad identifiers, substitute dates, or use start_dt/end_dt as an automatic broad search range.

If an essential contract or linkage requirement genuinely blocks execution, complete the safe offline preparation and report the exact missing rule and affected rows. Do not fabricate a successful run.

4. Execute with the latest code

Use the established DEV provider configuration and supported runtime. Record the actual code revision, interpreter version, input profile, command and run identifier. Keep the Python-version mismatch explicit if it remains; do not lower the declared requirement.

Create an isolated, resumable workspace for this input. Run all eligible rows through the normal pipeline. If using Debit/Credit pilots, continue the same run without repeating their provider calls.

Preserve prior runs and evidence. Use existing bounded retries and resume behavior. Do not rerun old batches or the full test suite merely to execute this new file.

Persist diagnostic metadata and per-source-row search provenance, including NO_MATCH rows. Distinguish prepared criteria from confirmed transmitted requests. Missing historical provenance must not be reconstructed from current code or described as predating the fix without supporting run-version evidence.

5. Verify and deliver

Keep the business workbook exactly 41 columns A:AO, sheet in, images X/Y, and eight field/confidence pairs Z:AO. Diagnostic and provenance metadata belong outside that business layout.

Compare exported A:W values against this workbook for every source/output association. Report populated, source-blank and semantically unresolved fields separately. Correct formatting alone is not complete business output.

Reconcile actual source rows, output rows, associations, unique documents, images and outcomes. Preserve NO_MATCH, image_unavailable, extraction_fields_blank and PARTIAL where applicable. Provider completion does not establish OCR accuracy.

Download the resulting business workbook(s), manifests, summaries and mapping diagnostics into a fresh timestamped Windows review folder. Verify DEV/download checksums and open that folder in Explorer.

Report exact paths, commands, revision/runtime, counts, exit status, value-level verification results and remaining blockers. Distinguish measured evidence from inference. Keep OCR accuracy, image-side attribution, unavailable images, NO_MATCH and runtime compatibility separate.

Do not send external messages, merge, push, deploy, or perform archive/lifecycle work.
