Continue the existing CLUE session. Implement the narrow diagnostic-metadata preservation fix identified in your latest report.

The review of owner-provided screen photographs supports the absence of the five front OCR targets in this Debit test image. The visible back text is:
“For Deposit Only”; “2026/08/28”; “Image format”; “business2”; “IDAutomationMICR_B.ttf”; “X9Ware LLC”.

No visible text identifies a bank-of-deposit FI, transit or account number. Record this as photograph-based review evidence. Resolve the remaining transcription question and stop repeating the same blank-field investigation. This does not establish general OCR accuracy.

1. Verify and correct the reported metadata loss in the current checkout.
    Preserve overall_image_quality through the normal parser, extraction result, durable state and diagnostic manifest.
    Include the existing per-field issues and ocr_suitability in the diagnostic manifest.
2. Preserve meaning and attribution.
    Keep image-level and field-level metadata separate and associated with the correct image/job and source/document association.
    Do not copy image-level reasons into individual fields, confuse image-quality confidence with extraction confidence, or invent metadata absent from the response.
    Different placement of provider explanations is not itself a provider defect without a documented contract.
3. Validate with focused offline tests using existing saved responses.
    Demonstrate that metadata survives parsing, persistence/reload and manifest generation. Cover the Debit image-level reason, per-field explanations and responses without optional metadata.
    Reuse existing test helpers. Run the full suite only if an applicable repository gate requires it.
4. Provide a corrected diagnostic example from existing evidence in a copied workspace, with a Windows review path.
    Report the root cause, changed files and actual test results.

Keep all diagnostic additions outside the 41-column business workbook. Preserve extraction values, confidence values, extraction_fields_blank, associations and existing fixes. Do not repeat provider calls or regenerate business workbooks for this change. Keep the remaining acceptance concerns and deferred archive/publishing work separate.
