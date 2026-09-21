Continue the existing CLUE project. Verify whether the current input mapping, Symcor/Tungsten enrichment, and actual generated Excel test outputs match the supplied business workbook column by column. Complete the focused audit and local verification; do not stop at a plan or rely on earlier test counts.

All responses, reports and test artifacts must be in English. Use native filesystem, Git and workbook-reading tools; no screenshots, OCR or browser automation.

1. Establish the current code and workbook

Start with C:\repos\W001CLUEinitialRepo. Verify the repository, branch, HEAD and uncommitted state. Read applicable AGENTS.md and docs\handoff\clue\START_NEW_SESSION.txt, then its referenced current handoff and input/output mapping decisions. Reconcile newer evidence forward. Preserve other sessions’ work and existing staging.

Locate and read the actual supplied .xlsx workbook, shown in the screenshots as All Transactions_ip_op_template.xlsx. Confirm its absolute path, relevant worksheet, header row, version/provenance and SHA-256. Do not silently select an older or ambiguous copy. Read cells and styles programmatically, using an existing workbook library such as openpyxl.

The user-defined target is:

* A:W, positions 1-23: 23 yellow input/base transaction columns.
* X:Y, positions 24-25: 2 purple Symcor front/back cheque-image output columns.
* Z:AQ, positions 26-43: 18 Tungsten OCR output columns, including the confidence columns defined in the workbook.
* The transaction table must contain exactly these 43 columns in this order.

Use the workbook for exact headers, positions and presentation. Screenshots are context only: several headers are clipped and AP/AQ cannot be established from them. Never invent missing headers or provider mappings. If the workbook conflicts with the user’s ranges, report the discrepancy explicitly.

If the .xlsx is unavailable, complete whatever code/output inspection is possible, identify the missing evidence and request the actual workbook. Do not claim full conformity or reconstruct an authoritative template from screenshots.

2. Trace the real data path

Inspect the configured input reader, normalization, Symcor request/response mapping and cheque association, Tungsten response mapping, and final Excel writer. Record the relevant code/configuration locations without exposing credentials.

Distinguish the established upstream DAT input contract from the Excel business/enrichment template. Do not assume this workbook replaces DAT ingestion. Explain how each A:W value reaches the final report through the current pipeline, including upstream-supplied fields and missing mappings.

Verify:

* A:W retain the corresponding source-row values and intended representation. Check leading-zero identifiers, dates/times, amounts, blanks and row order. Identify approved transformations and unintended changes separately.
* X:Y contain the correct front/back result for the correct transaction and cheque. Establish the required representation from the accepted contract: image, file reference/hyperlink, encoded content, or another defined representation. Column labels alone do not settle this.
* Z:AQ map each OCR value and its confidence to the exact intended position. Preserve repeated header labels such as “Confidence level”; use column position and associated field to disambiguate them. Do not silently deduplicate, rename, shift or overwrite these columns.
* Confidence scale, numeric/text representation, missing values, and zero confidence follow the documented provider/business contract. Flag unresolved rules rather than inventing them.
* Multiple matches, missing image sides, OCR failures and non-cheque rows follow the existing accepted behavior. Prove row/cheque association; account plus date alone must not be assumed unique. Do not invent a new row-expansion policy.

Treat unresolved provider field meanings and image representation as explicit business-contract gaps, even when the workbook layout is clear.

3. Build an independent column mapping

Create a 43-row comparison table, one row for each column A through AQ, containing:

Column letter/index | Exact workbook header | Input/Symcor/Tungsten | Expected source and type/format | Actual code mapping | Actual generated output | PASS/FAIL/BLOCKED | Evidence or precise gap.

Derive expected headers and order directly from the supplied workbook, independently of the application’s output constants. Cite repository-relative files, relevant symbols/lines and generated workbook cells. Do not use the implementation itself as the only source of expected results.

Compare worksheet/header placement, header group fills, relevant cell formats and other material template formatting. Identify which sample, legend and SLA cells are explanatory, and keep them out of the transaction data. Do not convert an annotation into a new performance requirement.

Check that no status, error, debug or index columns are silently inserted into A:AQ or appended to the business table. Report any conflict with an existing approved output contract instead of deleting fields automatically.

4. Verify actual generated output locally

Inspect existing output artifacts and their generating command/revision. Where that evidence is insufficient, run a focused offline check through the real configured application mapping and Excel writer. Reuse existing offline adapters, sanitized provider fixtures and test helpers; do not build another simulator or use a test-only writer.

Use synthetic input and distinctive field/confidence values so swapped fields and wrong-row associations are detectable. Cover a successful enriched result and the relevant existing cases for repeated account/date transactions, missing images and partial/missing OCR. Reuse existing coverage where it already proves the contract; do not repeat the entire suite.

Save a fresh synthetic output .xlsx through the application, then reopen it and compare its actual headers, positions, values, types and required formatting against the independent expectation. Verify all 43 columns, including AP and AQ. A workbook opening successfully or an old suite passing is not evidence of full conformity.

Record exact commands, exit results, test counts, code revision and output paths. If verification is blocked by an unresolved mapping or missing fixture, explain exactly what was not tested. Offline conformity does not establish live Symcor/Tungsten connectivity or integration success.

5. Scope and deliverables

This task authorizes inspection, focused offline verification, and creation of a reusable verification script/test, audit report and synthetic sample output where needed. Leave application behavior and configuration unchanged; list minimal proposed fixes for mismatches. Do not change the original workbook, credentials, CI/CD or .github content, commit/push, run live provider calls, or alter the separate DEV/F5 connectivity work.

Keep raw customer data and populated business workbooks out of Git and reports. Store only safe schema evidence and synthetic artifacts in appropriate existing project locations. Update the current handoff/task register with demonstrated findings without creating competing “latest” documents.

Return:

1. A clear overall verdict: MATCH, MISMATCH, or INCOMPLETE, with separate status for A:W, X:Y, Z:AQ and workbook layout.
2. The complete 43-column mapping, exact mismatches and any unresolved business decisions.
3. Absolute paths to the audit report, verification script/test and actual generated synthetic .xlsx, where produced.
4. The verification commands/results and the smallest recommended fixes, with code locations.

Claim MATCH only when the actual workbook and generated output support every required column and representation. If evidence is missing, name it precisely.
