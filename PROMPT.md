Continue the existing CLUE session from the received response to prompt 25784.

Implement the narrowly identified search-provenance persistence fix. Preserve the unresolved CP-D03 business question.

1. Confirm the exact point where processing_date_source is lost, then preserve search provenance through the normal execution, durable storage, workspace reopening, and diagnostic export paths.
    Record the input profile, source-row locator, source date field and value, submitted ProcessingDate criteria, and the mapping’s unresolved status. Keep provenance associated with the source row and search request, including NO_MATCH results and cases where multiple source rows share a document.
    Use the existing metadata structure where suitable. Keep this information outside the 41-column business workbook.
2. Preserve historical evidence honestly.
    Older runs without recorded provenance must remain distinguishable from new runs that persist it. Do not silently reconstruct historical provenance from current code. Any reconstruction from saved evidence must be explicitly labelled and performed on a copy.
3. Verify the real persistence path with focused offline coverage:
    * Normal execution followed by close, reopen, and diagnostic re-export.
    * NO_MATCH provenance and source-row isolation for shared documents.
    * Older records lacking provenance.
    * Unchanged search criteria, business values, and outcome classifications.
    Reuse existing fixtures. Run the focused tests and any mandatory gate required by the actual change.
4. Correct the handoff wording using the completed audit:
    Debit: 6 mapped, 16 absent from the supplied fixture, 1 unresolved.
    Credit: 5 mapped, 16 absent from the supplied fixture, 2 unresolved.
    Do not describe unresolved fields as absent or imply that obtaining the Rahona extract resolves record linkage automatically.

Report changed files, test results, and one inspectable diagnostic example with its exact local path.

Do not change date mappings, account representations, existing contract guards, business-column F, association behavior, or the workbook layout. Preserve prior fixes and PARTIAL outcomes. No live provider calls, business-workbook regeneration, external messages, or archive/lifecycle work.
