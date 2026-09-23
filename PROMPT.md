Continue the existing CLUE development session. The owner now authorizes exactly ONE fresh, real, end-to-end DEV execution of the same MON_INSTRUMENTS input workbook, followed by delivery of the actual output and row-level diagnostic tables.

This supersedes the earlier no-new-provider-calls restriction for this specific run only. It is not authority to bypass the live guard, change provider contracts, broaden search criteria, execute the separate prepared getTransactionItems A/B investigation, or run in production. Do not ask the owner to reconfirm this already approved run. If an actual readiness gate blocks execution, report the precise blocker and supporting evidence; do not weaken the gate or substitute an offline run.

Reconcile current work first
- The owner received the provider-origin fix report at commit 31568a2. It reports acquisition origin recovered as dev from verification.json and corroborating run_summary.json; new runs persist their own acquisition origin. The prior claim that historical recovery was impossible was withdrawn.
- The latest re-export remained offline with zero provider calls. It is not a fresh execution of Symcor/Tungsten.
- Preserve the Excel/result implementation, source/image hash checks, acquisition-origin fix and other current changes. Check the actual checkout and CLUE_HANDOFF.md; do not reset or reapply completed commits blindly.
- Incorporate the row-level table reporting addendum if not already applied. Do not start a second agent task or duplicate a currently active acquisition run. If this exact newly authorized execution is already running, follow it to completion and deliver its results.

1. Select the exact input and environment
Use the authoritative original bytes for all_txions_20260922165027.xlsx, sheet MON_INSTRUMENTS, with 16 source rows (five Debit and eleven Credit) and the existing A:W schema.
The suggested C:\repos\FCRM\sources\all_txions_20260922165027.xlsx path previously contained different bytes: 12,814 bytes rather than the admitted 11,841 bytes. The preceding task recovered the exact source from the historical run's landing copy, matching delivery.content_sha256. Reuse that already verified source, confirm its complete recorded hash and retain it unchanged. Do not use a different file merely because its name matches.

Use the existing controlled Linux DEV environment and the supported live configuration. Confirm that the revision actually executed contains the received fixes and that the active Python runtime/configuration meets the application requirements. If needed, stage that revision through the established DEV execution method in a separate run directory. Do not alter production or shared deployments. Reuse the configured authentication, JKS/certificate and TLS setup without exposing credentials or weakening certificate verification.

Check the real provider-profile eligibility and live guard using current evidence. Owner authorization does not convert unresolved or synthetic contract/profile pins into approved live ones. If blocked, return a table with the failing check, observed value, required condition and smallest missing action. Do not label a run completed if providers never executed.

2. Perform one fresh acquisition
Create a new workspace and new run ID; preserve the historical workspace, working re-export copies and delivered artifacts.
Run the normal application pipeline against real DEV Symcor and Tungsten. Do not use export-only, fixtures, response replay or cached results from the old run as a substitute for acquisition. Use supported isolation/configuration for the fresh run; do not delete shared caches. Normal within-run document sharing, caching and idempotency must remain intact so multiple source associations do not force redundant calls.

Keep the existing eligible-row rules, Debit/Credit retrieval routes, criteria, account/date/identifier mappings, RETURN_ALL_CHEQUES, source-value pass-through, confidence interpretation and image attribution unchanged. Use the normal supported timeouts, concurrency and bounded retry policy; record attempts. Do not launch another batch, broaden dates, pad accounts, add guessed identifiers or perform exploratory retries to obtain a preferred result. Use the documented inline/fallback child-retrieval behavior; do not force extra getTransactionItems calls.

Record acquisition origin at acquisition time, including the actual run ID, code revision, source hash, provider mode and evidence status. Keep it separate from subsequent export activity. All status and counts must reflect the new run's actual evidence.

3. Produce the established business deliverable
Generate a separate output .xlsx preserving all original source tabs and appending exactly result with the existing 41 columns: A:W source values, X:Y images, Z:AO field/confidence pairs. Preserve positional confidence headers. Keep diagnostics in companion files, not extra business columns or worksheet tabs.
Retain source identity and provenance for every association and every source with no document. Preserve actual partial outcomes; do not force SUCCESS or reproduce historical counts artificially. Use the existing conformance checker and focused output checks. Do not repeat unrelated test suites or completed fixture/re-export demonstrations.

4. Present results as tables
Start with a run-identity table: new run ID, DEV environment, executed revision, source path/hash, source row count, start/end times, acquisition provider mode/evidence, actual provider-call counts, actual command (without secrets), exit code and final status. Explicitly label this as a fresh provider run only if native evidence demonstrates it.

Show a source-summary table covering all 16 original input rows, including:
source worksheet/Excel row | account | source date field/value | actual submitted date/range | operation | document count | completed/partial outcome counts | incomplete stage/reason.

Provide the complete association table as CSV and a readable Markdown report:
source row | result row | account as supplied | account as sent | source date | submitted date/range/operator | request ID/operation | provider UTI if applicable | actual DocID/universalDocID | search outcome | front/back image outcomes | OCR outcome | final outcome | last successful/incomplete stage | evidence locator.

Use one row per source/document association, retaining a row for a source with no document. Do not deduplicate by account/date or hide failures. If the displayed association table is abbreviated, label the subset and provide the complete file. Actual DocIDs must be available in the complete table.

For every incomplete source, also provide a request-parameter table:
source row/request ID | parameter | source value | actual serialized value | operator | sent/empty/omitted/not-applicable/not-recorded | relevant contract/evidence finding.
Keep secrets out of diagnostic captures. Distinguish a genuine zero-hit response from transport/authentication errors, SOAP faults, parsing defects or absent evidence. An omitted optional parameter is not automatically a defect. Mark downstream stages NOT_ATTEMPTED only when supported. Do not infer historical or current wire values from code defaults.

5. Compare with the historical baseline
Use historical acquisition run run-20260923T002748516082Z-ac3021a6, revision d34e07e, solely as a comparison baseline:
- 16 sources; 354 output rows; 350 associations; 88 unique associated documents; 684 embedded images.
- Outcomes: 341 completed_extraction, 1 extraction_fields_blank, 8 image_unavailable and 4 no_matching_document; PARTIAL/exit 3.
- Reported original source rows 2, 4, 5 and 6 had no matching document; row 3 had one document. Confirm identities from records before comparison.

Show a before/after table for all five Debit sources, including exact submitted account/date/other criteria, returned DocIDs or explicit NONE_RETURNED, response status, stage reached and any changed result. Compare the eight historical image-unavailable associations and the blank-extraction case as well. Explain observed changes using evidence; do not assume a rerun fixes unchanged criteria.

Historical counts are reference values, not mandatory targets for a new provider run. Report any real change in returned document sets, image availability or extraction. Keep root-cause hypotheses separate from established findings. The eight confidence-semantic BLOCKED checks are distinct from the historical eight image-unavailable associations and must not be marked resolved without the required evidence.

6. Deliver and update the handoff
Copy the new workbook, JSON/CSV companions, run summary, conformance results and row-level diagnostic reports into a new clearly named Windows Downloads review folder containing the new run identity. Open that folder and workbook for owner inspection if available. Return exact absolute paths and the tables directly in your final response.
Update CLUE_HANDOFF.md with the new run's actual status and evidence, including any blocker or incomplete result. Preserve prior files and hashes. Do not push, merge, deploy to production or send external messages. All development text and artifacts must be English.
