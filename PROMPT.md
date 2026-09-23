Continue prompt 57291 from the currently running new-input execution. Do not start a second run or repeat completed provider calls.

The latest received report says:

* Input: C:\repos\FCRM\sources\all_txions_20260922165027.xlsx
* Sheet MON_INSTRUMENTS: 16 source rows, 5 Debit and 11 Credit.
* Execution revision d34e07e; profile rahona-workbook.
* Workspace: /home/tag5916/clue_private/newinput_20260922/mon_instruments/ws
* Last observed progress: 350 associations, getDocs 342 done / 8 failed, extraction still running.
    These are intermediate observations, not final acceptance results.

1. Finish the existing execution

Check the actual process and durable workspace state. If still active, monitor it through completion. If interrupted, diagnose and resume that workspace using the supported mechanism, without resubmitting completed work. If already finished, proceed directly to verification and delivery.

Do not modify application code underneath the active process. Do not rerun historical batches or the full test suite for this follow-up.

2. Reconcile the real results

Use the final manifest, durable state and saved request/response evidence to report:

* Source rows and direction counts.
* Output rows, associations and unique documents, separately.
* Available images and unavailable associations/documents.
* Extraction outcomes, remaining queued/running/failed work, exit code and final status.

Determine the actual cause of each of the eight getDocs failures. Do not assume they are the earlier sorryFlag cases merely because the counts match. Identify NO_MATCH source rows from this run’s evidence.

Keep completed_extraction, extraction_fields_blank, image_unavailable and no_matching_document distinct. Preserve PARTIAL where required.

3. Verify the business output against the actual input

For every output row, use its recorded source-row identity to compare all 23 A:W values with the corresponding input row, allowing only documented serialization/formatting differences. Report the comparison count and every mismatch.

Confirm that:

* All 14 supplied columns remain populated wherever their source values are populated.
* The nine source-blank columns remain source-blank rather than being filled by inference.
* Supplied Q, P, CIF_Number and Transaction_Event_Identifier remain unchanged.
* The DAT_CSV derived-Q rule did not overwrite this workbook’s supplied Q values.
* Duplicate source rows and shared-document associations retain their own source values.
* The workbook has exactly 41 columns A:AO, sheet in, images at X/Y, and eight field/confidence pairs at Z:AO.
* Diagnostic and search-provenance fields remain outside the business sheet.

Preserving a source value does not validate its business meaning. Keep the CIF/W ISN-like values, Q UTI-like values and account representation concerns explicitly separate from pass-through correctness.

4. Clarify the control-path claim using existing evidence

Your statement that assert_live_allowed() is never invoked does not by itself establish that applicable guards were enforced.

Trace the actual rahona-workbook call path and explain:

* Whether that guard is intended to govern this path, with the relevant code/contract evidence.
* Which checks actually ran before provider calls.
* Which source fields produced the submitted ProcessingDate and search identifiers.
* How Credit search identifiers were obtained, without silently treating CIF_Number or W as ISN or Q as an approved search identifier.
* Why map_processing_date() and extract_isn() were outside this path.

Distinguish prepared provenance from criteria confirmed in captured outgoing requests. Keep CP-D03 unresolved unless authoritative evidence resolves it.

This is a bounded review of the current run, not authorization to weaken a guard, invent mappings, widen dates, pad identifiers or conduct exploratory provider calls. If an applicable enforcement gap is established, report its exact impact and the smallest proposed correction separately; do not conceal it or declare acceptance.

5. Deliver the review files

Download the business workbook(s), manifest, export summary and a concise source-value verification report into a fresh Windows Downloads review folder. Verify DEV/download checksums and open Explorer on that folder.

Provide the exact local paths, actual final counts, exit status, and any remaining blocker. Confirm whether any new provider calls occurred during this continuation and distinguish normal completion/resume from retries.

The Python 3.9.25 versus declared >=3.10 mismatch remains unresolved unless actually addressed and verified. General OCR accuracy and image-side attribution also remain separate acceptance concerns.

Do not merge, push, deploy, send external messages or perform archive/lifecycle work. Finish with the delivered artifacts and evidence-based results, rather than another plan.
