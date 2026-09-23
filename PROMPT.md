Continue the existing CLUE development session. Address only the provider-origin metadata defect identified in your completed MON_INSTRUMENTS offline re-export report.

Received work: do not restart it
- Excel/result implementation 58316 was received at reported commit b368696.
- The real MON_INSTRUMENTS re-export is now received, including the two compatibility fixes reported at b8cb82c. The report records 16 sources, 354 result rows, 350 associations, 88 unique documents, 684 images, unchanged outcomes, zero A:W/extraction-value differences and zero provider request events.
- The authoritative source bytes were recovered from the run's landing copy after the suggested source path failed the saved delivery hash check. Preserve that verified recovery and both compatibility fixes. A reopen/resave explanation for the different file is a hypothesis, not established history.
- The reported new delivery is under C:\Users\tag5916\Downloads\CLUE_DEV_Review_20260923_MON_INSTRUMENTS_Reexport. Read the current checkout and CLUE_HANDOFF.md to confirm actual paths, revisions and evidence before editing. Preserve newer and concurrent work.

Problem to resolve
The report says clue_provider_mode reflects the export invocation rather than the origin of the saved provider results. Default offline export could label real DEV data as fixtures; the latest export instead labels it no-provider, losing the historical dev label. Zero provider calls describes this export operation, not the origin of its cached data.

Establish the narrow contract
Trace the field through run creation, durable state, reopen, export, companion metadata and the conformance checker. Define separate, unambiguous metadata for:
1. The provider mode that produced the saved results, with its provenance/evidence status.
2. The export operation, including export-only execution and actual provider-call count.
Use existing project naming conventions and check actual consumers before changing a field's meaning. Keep the 41-column business workbook contract unchanged; put technical metadata in the existing companion/run metadata structures. Do not silently remove an existing metadata field or ignore a compatibility consequence.

Preserve historical honesty
The report's conclusion that no historical recovery is possible requires an evidence check. Absence of a dedicated database field does not establish absence of reliable evidence. Historical output reportedly says dev, but that field may itself have reflected an invocation, so it is a lead to investigate rather than automatic proof.

Inspect available original acquisition-run metadata, logs and immutable historical package evidence for run-20260923T002748516082Z-ac3021a6 (reported acquisition revision d34e07e). Tie any evidence used to this exact run using saved run identity and relevant hashes.
- If authoritative evidence establishes the acquisition provider mode, recover it only through an explicit, auditable mechanism in the working copy. Record the evidence source and that recovery occurred; do not portray it as an originally persisted field.
- If evidence is absent, ambiguous or conflicting, retain UNKNOWN/NOT_RECORDED using the project's conventions. Do not infer dev or fixtures from export flags, folder names, defaults, the input workbook or the existence of cached images.
- Never replace unknown origin with no-provider. No-provider belongs to the export operation.
- Do not modify the preserved original DEV workspace or historical delivered files, fabricate provenance, or contact providers to reconstruct history.

Implementation
Persist acquisition provider mode for future runs at the appropriate run lifecycle point and keep it stable across reopen and re-export. Export-only must read stored origin and record its own execution metadata separately. Handle older workspaces explicitly and compatibly. Limit changes to these paths and their focused tests; preserve the source/image hash checks and the live guard.

Focused verification
Use existing fixtures and local durable-state tests; no live Symcor/Tungsten calls.
- A run whose stored origin is dev remains dev when exported under either default/fixtures options or a dev option; the export records zero provider calls.
- A fixture-origin run remains fixtures regardless of export invocation options.
- A historical run with unrecorded origin remains explicitly unknown unless the supported evidence-recovery path establishes it.
- Recovery records its evidence and does not accept evidence for another run or contradictory evidence.
- Reopen and repeated export preserve origin; export-only does not construct or invoke live providers.
- Conformance checks assess origin and export activity separately. Missing origin must be reported accurately instead of being hidden by NOT_APPLICABLE or incorrectly marked PASS.

After fixing the metadata path, re-export once from the existing verified MON_INSTRUMENTS working copy to a separate review folder. Reuse the established comparison tools. Confirm unchanged business content: original tabs plus exactly result, 41 columns, 16/354/350/88/684 totals, outcomes 341/1/8/4, all 8,142 A:W cells and 354 x 16 extraction/confidence values unchanged, and per-source search provenance retained. Keep historical PARTIAL/exit 3 and report the export command's actual exit code separately. Record the actual origin decision and zero new provider calls in the comparison report.

The eight semantic BLOCKED confidence checks remain open until confidence semantics are resolved; they are not the eight image-unavailable associations. Do not change confidence values, matching, retrieval, image attribution or outcomes to make a checker pass. CP-D02/CP-D03, client child-filter validity and general OCR accuracy remain outside this task.

Delivery
Return the root cause, changed files, actual focused test results, before/after technical metadata, evidence supporting historical origin (or the exact reason it remains unknown), and absolute paths to the updated workbook, companions and comparison report. Update CLUE_HANDOFF.md with received/completed status and remaining limitations. Open the new review folder for the owner if available.

Do not rerun the live batch, repeat broad investigations, run unrelated test suites, push, merge or deploy. All development text and artifacts must be in English. Clearly distinguish inspected native evidence, earlier reported results and unresolved questions.
