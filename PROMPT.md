Continue the existing CLUE development session. Produce and deliver an offline re-export of the completed MON_INSTRUMENTS run using the implemented Excel/result-sheet workflow.

Current evidence
- The owner has received your 58316 implementation report: reported commit b368696, 675 passed / 5 skipped / 0 failed, with a four-source/eight-result fixture demonstration. Do not repeat that implementation or treat its result as pending.
- This task applies the normal export path to the previously completed real run. It does not authorize provider execution.
- Read the actual checkout status and current CLUE_HANDOFF.md first. Preserve newer work and concurrent changes; do not reset to a historical commit.

Identify the completed run from its native records
- Original source: C:\repos\FCRM\sources\all_txions_20260922165027.xlsx
- Transaction sheet: MON_INSTRUMENTS; 16 source rows, five Debit and eleven Credit.
- Historical run revision: d34e07e.
- Run ID: run-20260923T002748516082Z-ac3021a6.
- Reported DEV workspace: /home/tag5916/clue_private/newinput_20260922/mon_instruments/ws
- Reported delivered evidence: C:\Users\tag5916\Downloads\CLUE_DEV_Review_20260923_MON_INSTRUMENTS\
These locations are evidence locators, not proof of current availability. Confirm identity from the saved run metadata, source identity and available hashes. Do not select the older 17-source/363-result dataset.

Execution boundary
1. Reuse the completed run's durable associations, cached images, OCR results, outcomes and provenance. Copy existing artifacts from the controlled DEV location if necessary; perform the export on a separate working copy so the original workspace and delivered evidence remain intact.
2. Use the normal application export-only/re-export path. Make zero Symcor or Tungsten calls. Do not launch, resume or retry provider processing, send any prepared getTransactionItems request, or substitute fixture-generated data for real cached results.
3. Keep retrieval criteria, RETURN_ALL_CHEQUES, source/document associations, source A:W values, confidence semantics, provenance and the live guard unchanged. Do not filter or deduplicate to reduce row counts.

Workbook preservation
Produce a separate output .xlsx preserving every original tab, its name, relative order, contents, formulas, formatting, dimensions, visibility and material workbook features. Append exactly one sheet named result with the existing 41-column A:AO contract: source A:W, cheque images X:Y, and the eight field/confidence pairs Z:AO. Preserve repeated confidence headers positionally. Keep diagnostics in the existing companion artifacts.

This run predates the new source-workbook retention implementation. Do not assume a retained source snapshot already exists. Use the exact original workbook after checking its identity against saved evidence. If historical re-export needs a small compatibility fix to accept that verified source, make it in the normal export path, with focused verification. Do not manually assemble a demonstration workbook, invent historical metadata, or weaken the live guard. If essential source bytes or saved results cannot be recovered, report the precise missing artifact and stop before producing a misleading substitute.

Inspect the actual workbook for features relevant to preservation. Verify any charts or pivot tables that are present; disclose a concrete unsupported feature instead of silently dropping it. Handle an existing case-insensitive result-tab collision without overwriting or renaming an original tab.

Acceptance checks
Reuse the existing conformance checker and perform a read-only comparison against the original source and completed run artifacts. Do not weaken assertions to fit an output.
- Original tabs are preserved, result is the only added tab, and the source checksum is unchanged.
- Result has the exact 41 headers in the established order.
- Baseline totals remain 16 source rows, 354 result rows, 350 source/document associations, 88 unique associated documents and 684 embedded cheque images on result.
- Outcomes remain 341 completed_extraction, 1 extraction_fields_blank, 8 image_unavailable and 4 no_matching_document.
- All 354 result rows retain their recorded provenance and source-row identity. Compare all 8,142 source A:W cells against their corresponding original source rows; report mismatches, preserving blanks and identifiers.
- Original processing status remains PARTIAL with historical exit code 3. Report the export command's actual exit code separately; a successful export does not turn the provider run into a successful extraction run.
- Reopen the export workspace and verify export-only can reproduce the same business content without provider calls. Do not delete the owner's original workbook to demonstrate this.
- If any count differs, explain it from native evidence; do not force the expected totals by changing associations, outcomes or images.

Delivery
Save the new workbook, existing-format JSON/CSV companions and a concise comparison_report.json in a new review folder under the current Windows user's Downloads, separate from the historical delivery. The comparison report must include run/source identity, source and output hashes, preservation checks, actual counts, A:W comparison results, provenance/outcome checks, zero-provider-call evidence and any limitations. New output bytes will differ because the workbook packaging changed; do not require byte identity with the historical workbook.

Update the local CLUE_HANDOFF.md with the received 58316 result and this task's actual outcome. Return the exact export command, actual exit code, focused checks performed and absolute paths to the workbook, companions and comparison report. Open the output folder and workbook for owner review using the normal file-opening mechanism; if that fails, report it accurately. Use programmatic verification; no screenshots, video or new OCR are needed.

Do not rerun the entire test suite unless a specific export-path code change requires it. Do not push, merge or deploy. All prompts, development output and artifacts must be in English. Distinguish inspected evidence, reported historical results and unresolved items. CP-D02/CP-D03, child-filter validity and general OCR accuracy remain unresolved by this export task.
