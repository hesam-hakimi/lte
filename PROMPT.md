Continue the existing CLUE session from the received diagnostic-metadata fix report.

1. Close the specific cache-path validation gap.
    Show whether an existing automated test exercises the normal extraction pipeline writing both durable state and the on-disk extraction cache, followed by reopening the workspace and generating diagnostic output through the normal resume/export path.
    It must not inject the final extraction dictionary directly.
    If this coverage already exists, provide the test reference and result. Otherwise add one focused offline regression using existing fixtures/helpers. Verify that image quality and field explanations survive while extraction values and confidence remain unchanged.
    Distinguish this from restoring historical metadata from saved captures: old runs cannot recover discarded information from state alone.
    Reuse existing suite evidence; broader testing is needed only for an applicable gate or a demonstrated failure.
2. Investigate the remaining outcomes from saved evidence, as two separate groups.
    Eight image-unavailable associations:
    * Identify exact source rows and complete provider document identities.
    * Reconcile association count against unique document count.
    * Inspect saved getDocs requests/responses, AvailableSegments, requested masks, sorryFlag and returned content.
    * Determine what the evidence establishes about provider unavailability versus request, parsing or association handling.
    Four Debit NO_MATCH cases:
    * Compare original input values with the actual saved search criteria and documented transformations.
    * Check existing test-data documentation for expected matches.
    * Separate confirmed empty search results from unverified expectations about whether documents should exist.
    * Do not alter identifiers or dates to manufacture matches.

Report each case with its evidence locator, finding, uncertainty and smallest justified next action. If existing artifacts cannot resolve an item, identify the precise missing evidence.

Use saved artifacts and workspace copies. No live provider calls or speculative production-code changes for the outcome investigations. Preserve existing workbooks, outcomes and prior fixes. Keep the reviewed sparse Debit case closed at its limited scope; general OCR accuracy, image-side attribution, source-data gaps and runtime compatibility remain separate.
