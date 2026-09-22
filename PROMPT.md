Continue the existing CLUE session from the completed Q correction.

68249 was a ChatGPT prompt reference, not a repository task identifier. You reported that no corresponding investigation is active or completed in this session. The complete diagnosis scope is below; do not continue searching for that number.

1. Reconcile the mapping report using existing evidence.
    AW_field_mapping_report.json reports 6 MAPPED, 16 ABSENT and 2 UNRESOLVED for 23 columns. Explain any overlap and provide separate Debit and Credit counts, with exactly one status per column per direction. Preserve Debit Q = documented ItemSeqNo and unresolved Credit Q = blank. This reporting clarification does not require another export or provider run.
2. Diagnose the all-blank pilot Debit OCR result.
    Locate the saved corrected run:
    /home/tag5916/clue_private/e2e_fixed_20260922/pilot_debit
    The case is Debit Items, Excel row 3. Two images and two completed Tungsten jobs were reported, but all extracted fields were blank.
    Use saved captures and workspace copies. Trace:
    * Source row and Symcor document identity.
    * Retrieved image bytes and hashes versus submitted image bytes.
    * Tungsten request configuration, job/document identities, completion and result retrieval.
    * Raw field values, statuses and confidence.
    * Parsed fields, persisted fields and exported Z:AO cells.
    Compare one successful Credit case from the saved runs. Identify the first stage where values are absent or lost. Distinguish a genuinely empty raw provider response from an incorrectly fetched/interpreted response or downstream application data loss.
3. Establish the evidence before proposing a correction.
    Check the existing Tungsten documentation for relevant request/result semantics. Do not infer OCR correctness or expected cheque content from HTTP 200, job completion or confidence alone.
    If an application defect is demonstrated, provide a minimal offline reproducer and the smallest supported correction. Keep this phase diagnosis-only; do not change provider profiles or repeat live calls. If saved evidence is insufficient, identify the exact missing artifact or bounded test needed.
4. Deliver inspectable evidence.
    Download the original Debit image pair for my visual review, reusing existing downloads if their hashes match. Also provide the existing mapping JSON and a concise diagnosis report in the Windows review folder. Report exact paths, image hashes, findings, uncertainties and the proposed next action.

Preserve the current source mappings, output contract, getDocs and classification fixes. Keep the eight unavailable-image associations, four NO_MATCH cases, OCR accuracy, image-side attribution and Python mismatch separate. Archive/lifecycle and publishing remain deferred.
