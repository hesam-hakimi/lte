Continue from the saved-evidence audit. Implement the confirmed mapping correction for the three bank-of-deposit stamp fields and verify the regenerated workbook.

1. Preserve the exact business-template headers and A:AO layout. Add an explicit mapping from the actual provider keys to the corresponding canonical workbook fields:

* bank_of_deposit_FI_stamp → value/confidence in AJ/AK
* bank_of_deposit_transit_stamp → AL/AM
* bank_of_deposit_account_stamp → AN/AO

Read the exact canonical names from the current template/contract. Reuse the existing normalization boundary. Do not use broad character removal, fuzzy matching, or rename the workbook headers.

2. Preserve the provider’s value, ocr_confidence, detected flag, and status semantics. An existing field with detected=false and confidence=0.0 must remain returned_not_detected with numeric zero. An absent field must remain distinguishable from it.
3. Correct representative fixtures to use the real provider key names. Add focused coverage with distinct nonempty values for the three fields, explicit zero, and an absent field. Keep synthetic test evidence separate from the live run.
4. Replay the saved real Tungsten responses through the corrected normal mapping/export path and regenerate the workbook. Do not manually edit cells or rerun services merely to verify this mapping.

For this saved sample, expect all eight values to remain blank and all eight confidences to be numeric zero, because that is what the provider returned. In particular, AK2, AM2, and AO2 must now preserve the provider’s zeros.

5. Verify all eight fields against the raw responses, preserve A:W, and confirm the embedded image hashes and anchors remain correct.

Return the focused changes, actual test results, regenerated workbook path, and before/after field trace. Clearly label this verification as replay of saved live responses, not a new live execution.

Document the remaining same-run Symcor capture gap and front/back association limitations. Do not claim positive OCR extraction accuracy from this blank-field cheque. Preserve unrelated work; no deployment, commit, or push.
