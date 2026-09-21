Continue the current CLUE implementation. The user has resolved CP-D05: the business Excel output must display the actual cheque images embedded in the workbook.

Requirements:

* Column X: front cheque image.
* Column Y: back cheque image.
* Embed the image bytes in the .xlsx. File paths, hyperlinks, encoded text, and externally linked images do not satisfy this requirement.
* Make embedded images the default for this business workflow. Reuse and verify the existing embedded-image implementation where possible.
* Anchor each image to its correct row and column. Preserve aspect ratio and adjust row heights and X:Y widths so images are visible without overlapping adjacent rows.
* Preserve A:W values, the 41-column layout, and the eight Tungsten value/confidence pairs in Z:AO.
* Preserve correct transaction/cheque association, including multiple cheques expanding one input row.
* For missing or invalid images, leave the corresponding image position empty and record the reason through existing diagnostics. Do not substitute a path or an unrelated image.

Verify through the normal application pipeline:

1. Use valid, distinct synthetic front/back image fixtures. Inspect the current .img fixture contents; do not assume they contain decodable images or merely rename their extensions.
2. Generate a fresh synthetic workbook using the production writer.
3. Inspect the saved workbook’s embedded media, drawing relationships and anchors to verify image contents, front/back placement and row association.
4. Verify that a copied workbook remains self-contained without access to the original image directory.
5. Run focused regression tests for successful embedding, multiple-cheque rows, and missing/invalid images. Use native file/workbook tools; no screenshots, OCR or browser automation.

Update the existing contract, audit and handoff: CP-D05 is resolved by the user’s decision; mark implementation verified only after the checks pass. Keep unresolved confidence scale and Symcor request mappings separate.

Preserve current changes. Do not commit/push, run live provider calls or change DEV/F5 settings. Return the generated workbook’s absolute path, affected files, actual test results and any remaining limitations. All responses and artifacts must be in English.
