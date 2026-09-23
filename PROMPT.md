# CLUE — Excel input and preserved workbook with result sheet

Decision ID: CLUE\-IO\-EXCEL\-RESULT\-2026\-09\-23
Recorded: 2026\-09\-23
Authority: Direct owner instruction in the current CLUE conversation\.
Status: OWNER\-CONFIRMED REQUIREMENT; implementation and execution evidence not yet received\.
Implementation prompt: 58316, prepared with this decision\.

## Owner instruction

The owner specified two changes: input will be Excel in the previous format; output will retain the input workbook’s original tabs and add the results in a new sheet named `result`\.

This supersedes the earlier DAT/CSV input requirement and `in` result\-sheet target for this workflow\. It does not change the existing source schema, enrichment\-column contract, retrieval/matching semantics or one\-to\-many association behavior\.

## Effective contract

|Concern         |Current requirement                                                                      |
|----------------|-----------------------------------------------------------------------------------------|
|Input           |Excel workbook (.xlsx), existing business template and exact A:W headers                 |
|Output          |A separate enriched copy of the input workbook                                           |
|Original tabs   |Preserve every original tab’s name, relative order, data, formulas and presentation      |
|New tab         |Append one sheet named exactly `result`                                                  |
|Result layout   |Existing 41 columns A:AO                                                                 |
|A:W             |The corresponding source row’s 23 values, repeated for each accepted document association|
|X:Y             |Existing front/back cheque-image columns                                                 |
|Z:AO            |Existing eight extraction-field/confidence pairs                                         |
|Diagnostics     |Existing companion artifacts; no new diagnostic columns in the business table            |
|Multiple cheques|Existing RETURN_ALL_CHEQUES behavior retained                                            |
|Source file     |Read-only; do not overwrite it                                                           |
|Legacy inputs   |Existing unrelated DAT/CSV support remains available; it does not override this workflow |

Workbook preservation includes original sheet names/order/visibility, values, formulas, styles, merged ranges, row/column dimensions and existing workbook features\. Reader normalization must not rewrite the original tabs\. Process transaction sheets under the existing supported profile, preserving source sheet/row identity; a notes tab is not automatically a transaction table\.

If an incoming source already has a case\-insensitive `result` sheet\-name collision, report it before provider work\. Do not overwrite source content or invent `result1`\. This is an implementation safeguard for the two confirmed requirements, not a new business\-selection rule\.

## Scope and evidence limits

This document records a requirement and an implementation prompt\. It does not claim that Windows/DEV code was changed or tests passed\. The native checkout and input workbook are on the owner’s environment\. Existing run outputs are historical evidence and must not be overwritten\.

Relevant historical references:

- [Prior business mapping](Releases/CLUE_Reference_2026-09-23_R1/docs/03_Business_Output_and_Source_Mapping.md): the 41\-column layout remains; its `in` target is superseded here\.
- [Earlier alignment instruction](../CLUE_Input_Output_Alignment_Implementation_Prompt.txt): preserve supplied A:W values and exact enrichment columns\.
- The current conversation’s completed\-run reports and contract corrections remain the evidence for their respective changes\. The frozen release’s old 40872\-pending checkpoint is not the current session status\.

This limited contract update does not resolve CP\-D02/CP\-D03, source\-to\-archive linkage, account representation, provider readiness, OCR accuracy or image\-side attribution\. It does not authorize a new provider run\.

## Implementation prompt 58316

Continue the existing CLUE session\. Implement the following owner\-confirmed input/output changes through the normal application pipeline\.

1. Excel input
   The input for this workflow is now an Excel workbook &#40;\.xlsx&#41;, using the existing business format and its 23 A:W columns\. This supersedes the previous CSV\-content\-with\-\.dat requirement for this workflow\. Reuse the current workbook profile and exact supplied headers; retain unrelated legacy input support\.
2. Preserve the workbook and append results
   Produce a separate output \.xlsx based on the original input workbook\. Preserve every original worksheet with its name, order, content, formulas, formatting, merged cells, dimensions, visibility and existing workbook features\. Append one worksheet named exactly result, after the original tabs\. Keep the source file unchanged\.

Write enrichment rows only to result\. Preserve the existing 41\-column A:AO layout: A:W source values, X:Y front/back cheque images, and Z:AO the eight existing field/confidence pairs in their exact template order\. Preserve repeated confidence headers positionally\. Keep technical diagnostics in the existing companion artifacts\.

Reuse existing rules for identifying transaction sheets and eligible rows; do not ingest every tab blindly or accidentally process the generated result sheet\. Keep source worksheet and row identity through processing and re\-export\. If the incoming workbook already contains a sheet named result, including a case variant, report the collision before provider calls rather than overwrite an original tab or invent a different output\-sheet name\.

Scope and implementation
Read the actual checkout, current handoff, input profile and workbook writer first\. Preserve completed fixes and other sessions’ changes\. Implement workbook preservation in the normal writer, including offline export\-only/re\-export; do not manually reconstruct a demonstration output after the pipeline runs\. Retain the immutable source workbook identity and the material needed for later re\-export\. Preserve historical DAT\-run export behavior where no original Excel workbook exists\.

Keep retrieval criteria, source\-to\-document associations, RETURN\_ALL\_CHEQUES, source A:W pass\-through, provenance, PARTIAL/NO\_MATCH/image\-unavailable outcomes and the live\-execution guard unchanged\. This request changes input/output packaging, not cheque selection, identifier/date mappings or confidence semantics\.

Verification and delivery
Use existing fixtures or captured\-response replay; no new Symcor/Tungsten calls or rerun of the completed live batch\. Verify with a multi\-sheet workbook containing transaction data and a non\-transaction tab:

- all original tabs retain their names/order and contents, including formulas and material formatting;
- result is the only additional sheet and has the exact 41\-column structure;
- multi\-cheque expansion retains the correct source row’s A:W values;
- partial outcomes and diagnostic provenance remain intact;
- close/reopen/export\-only preserves the workbook and makes zero provider calls;
- the original input checksum is unchanged and a conflicting result tab is handled without overwriting data\.

Run focused regression checks for the changed reader/writer/export paths\. Reuse the existing conformance checker and update its output\-sheet expectation for this workflow; do not weaken the other assertions or repeat unrelated investigations\.

Update README, contracts, run instructions and CLUE\_HANDOFF\.md with this owner decision\. Label implementation and test status using actual evidence\. Return changed files, actual verification results, and absolute paths to the sample input, generated output workbook and concise comparison report\. Open the output folder for owner review\. All development text and deliverables must be in English\.
