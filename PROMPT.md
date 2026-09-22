Continue the CLUE session. Fix the missing source transaction data in business-output columns A:W through the normal application pipeline. This is an implementation task, including regeneration and download of the corrected workbooks.

The previous export corrected the layout but left 22 input columns empty. Matching the template’s headers alone is insufficient.

1. Establish the source-to-output mapping.
    * Read the authoritative template: C:\repos\FCRM\data\All Transactions_ip_op_template.xlsx, sheet in.
    * Inspect the actual TDB input workbook, converted CSVs, existing Rahona inputs, mapping code and project documentation.
    * For every A:W column, identify its meaning, source field, any documented transformation and supporting evidence.
    * Different column names do not establish that the data is unavailable. Check semantic mappings.
    * Do not guess account roles, date ranges, customer information or other missing values. Distinguish genuinely absent source data from data lost during processing.
2. Fix source-data preservation and mapping.
    * Trace the original input through parsing, stored source records, document associations and workbook export. Identify exactly where available values are omitted.
    * Implement supported mappings and preserve original business-input values, including leading zeros, identifiers and date meaning.
    * When one input row produces several document rows, copy that input row’s transaction context to every associated output row.
    * Preserve duplicate source rows and their identities. Do not associate records solely by account/date or output row position.
    * Keep genuinely unavailable fields empty and explain them in the companion report. Do not fabricate values or use OCR to replace missing transaction context.
3. Preserve the approved output contract.
    * Exactly 41 columns A:AO, sheet in.
    * A:W: source transaction data.
    * X/Y: cheque_front / cheque_back.
    * Z:AO: the existing eight field/confidence pairs.
    * Preserve all existing associations, images, extraction results and unavailable/no-match outcomes. Keep technical diagnostics outside the business workbook.
4. Validate actual values.
    * Add focused regression tests comparing known source values with exported cells, including multiple documents per input row, duplicate source rows and leading-zero identifiers.
    * Test supported Rahona input preservation and verified TDB mappings separately.
    * If the TDB fixture cannot supply every business field, complete the supported correction and identify the exact remaining data requirements. Do not describe the workbook as fully populated or business-complete.
5. Regenerate and deliver.
    * Re-export all four existing runs from copies of saved workspaces using the corrected application code. Do not repeat Symcor or Tungsten calls.
    * Preserve previous evidence and downloads.
    * Download the corrected workbooks to a new Windows review folder, verify transfer checksums and open that folder for visual inspection.

Report the root cause, implemented mappings, remaining source-data gaps, tests and local workbook paths. Include a small before/after comparison showing populated A:W values and reconcile all 363 output rows.

Preserve the getDocs and classification fixes. Keep the blank Debit OCR investigation open separately. Do not merge, push, change shared deployments or resume unrelated packaging/archive work.
