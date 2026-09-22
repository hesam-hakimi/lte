Continue the CLUE diagnosis using the existing evidence.

Visual review in ChatGPT of the owner’s screen photographs found:

* The Debit front is a VOID / TEST ITEM.
* No payor name/address, payee name/address or memo is visible.
* Amount 5,000.91 and date 07/17/2026 are visible, but they are not among the five front fields listed in your diagnosis.
* The back contains “For Deposit Only”, date 2026/08/28, and test/format text.

Update the diagnosis to record that the five blank front fields are consistent with this test image. Attribute this evidence to visual review of screen photographs, not a native-file or request-payload audit.

Complete only the remaining back-field check:

1. List the exact three bank_of_deposit field names, their template columns and documented meanings.
2. Show their individual saved raw response values/statuses; the current grouped summary is insufficient.
3. Compare each field’s meaning with the visible endorsement text. Distinguish absent target information, visible target information not detected, and unresolved semantics. Do not treat generic endorsement or test text as bank identity without supporting evidence.

Report whether any specific discrepancy remains. Preserve raw responses and extraction_fields_blank; keep review conclusions separate from runtime outcomes.

Use existing artifacts only. No provider calls, code changes, workbook regeneration or full test-suite rerun are needed for this review. Keep the other acceptance concerns separate.
