Continue the existing CLUE session. We have an imminent meeting with Symcor. Produce an actual, presentation-ready English Word document (.docx) showing two concrete cases: what our input contained, exactly what we sent, what Symcor returned, what CLUE wrote to the output, and the specific point requiring validation. Include copyable curl commands and the corresponding request/response evidence.

This refines the previous two-case extraction task. Reuse any case package already prepared; do not start a duplicate investigation. Complete the document and open it for the owner. Do not stop at a plan, Markdown-only report, or instructions for the owner to generate Word.

Evidence and scope
Use the saved 16-source MON_INSTRUMENTS acquisition, run-20260923T002748516082Z-ac3021a6, reported revision d34e07e. Verify the actual run/source identity against the existing handoff and native artifacts. The reported DEV workspace is /home/tag5916/clue_private/newinput_20260922/mon_instruments/ws. Use the hash-verified original input and latest verified result-sheet re-export. Do not use the older 17-source dataset or a subsequently resaved source as if it were the admitted input.

This is offline evidence preparation. Do not call Symcor or Tungsten, run curl/TLS preflights against the endpoint, rerun the batch, send getTransactionItems probes, or change matching/account formatting. Preserve the live guard and do not interfere with ongoing push/merge work. The previously authorized fresh end-to-end run is separate from this document task.

1. Select and verify the cases

C01 â Credit:
- MON_INSTRUMENTS Excel row 7; account 6450420; processing date 2025-05-05; Credit; source amount 15567.00; source CIF_Number and Transaction_Event_Identifier both 3740000709.
- Retrieve the actual saved searchTransaction request/response and all nine child document records, with the parent kept separate. Report the exact provider UTI, universalDocID/siteSpecificDocID pairs, source association keys and actual output-sheet row locations.
- Prior reports describe ALL1, POD, Account EQ 6450420, ProcessingDate BW 20250505..20250505, DebitCreditIndicator EQ C, applyFilter=false and hitListFetchLimit=100. Verify these against the capture rather than silently copying the summary.
- Within this exact captured transaction, use the child with archive ItemSequenceNumber 3740000709 and Amount 15567.00 as the image-display candidate. Label it OBSERVED CANDIDATE, not a validated business match. Embed its saved image pair. Include a compact table of all nine children and their archive amounts; child total 267021.75 and parent amount 12000.00 remain separate.
- Explain that source amount repeats across association rows and is not the archive amount of every returned cheque. Keep archive indexes separate from OCR values.

D01 â Debit:
- MON_INSTRUMENTS Excel row 2; account 5224077; Processing_Transaction_Date 2026-07-17; historical submitted date 20260717; no_matching_document.
- Retrieve the actual saved awsSearchRequest and zero-hit response. List every transmitted criterion/operator and explicitly establish whether DebitCreditIndicator was included. Do not infer a transmitted D from the source direction.
- This case has no returned DocID/image. Show NONE_RETURNED and retain the source row; do not substitute another cheque.
- Add Excel row 3/account 5224069 as a clearly labelled CONTROL: same date, one returned document, historical extraction_fields_blank; reported archive ISN 4850040008 and archive amount 5000.91. Include its real DocID pair, existing image pair and actual output values without regenerating OCR.

Keep Yasim's later example separate: Account 05224077, searchTransaction/POD, date BW 20260717..20260717, D, ALL1, applyFilter=false, hit-list limit 10. He reported a response; the conversation did not supply its body. Include any actual received response only if locally available and traceable. Otherwise label COLLEAGUE-REPORTED / RESPONSE_NOT_AVAILABLE. Both the account and operation changed, so adding zero alone is not a demonstrated fix. Do not derive ISN from a suffix of Transaction_Details/UTI.

2. Make the curl evidence accurate and usable

For C01 and D01, include:
- The original captured SOAP request, actual operation/headers and relevant response excerpt, linked to the complete files in the package.
- A copyable curl invocation for the actual supported environment, with the account/date parameters clearly identified and the exact execution directory stated.
- A table mapping each editable parameter to the actual XML criterion, operator and value. Show original source value and submitted value separately.

The historical application may have sent the request through Python rather than curl. Label the command TRANSPORT-EQUIVALENT CURL â PREPARED, NOT EXECUTED HERE. Never call the saved historical response the result of a newly executed curl command.

Reuse the existing manual-search tooling from reported commit 2648f14, the shipped serializer and the established connection settings. Add only the minimal report/command helper needed for the Credit case if no existing utility covers it. Do not hand-invent a SOAP envelope, unsupported criteria or a UTI input for searchTransaction.

Keep the original request bytes unchanged as historical evidence. If the manual command generates a fresh timestamp/correlation field, save its generated request separately and show that its business criteria match the original. Document exactly which non-business fields differ. Do not imply that curl substitutes parameters inside an XML file; include the existing helper/template when needed. Do not execute the network step.

The received environment report describes Linux DEV curl 7.76.1/OpenSSL with PEM certificate/key/CA files and an encrypted key, not Windows Schannel. Verify the actual environment and reuse the established secure setup. Keep passwords/tokens/private-key material out of Word, command arguments, history and shared files; retain the existing protected credential mechanism. Do not introduce an insecure TLS switch. Confirm SOAPAction from the native implementation/capture; it was reported as an empty quoted value.

3. Build the Word document for the meeting

Name it CLUE_Symcor_Meeting_Two_Cases_2026-09-23.docx. Aim for a concise 4-6-page main document, with appendices only where useful:
- First page: purpose, evidence status, and a two-case overview.
- One case section each: source input -> actual request parameters -> returned documents/status -> output rows/images -> precise Symcor question.
- Copyable curl blocks, short actual SOAP request/response excerpts, and filenames for the complete XML/captures.
- Clearly labelled image pairs with case, source row and DocID; preserve aspect ratio and disclose any unconfirmed front/back attribution. Images must be embedded, not linked only to local paths.
- A closing validation table: account/date representation; operation/filter scope; expected DocIDs; source-to-document linkage; image identity/sides; agreed decision and evidence. Leave pending decisions explicitly unconfirmed.

Focus the questions on the actual cases: why nine Credit children were returned and which belong to the source row; the supported client filters/key; whether Debit account formatting or operation should differ; and which archive record is expected for 5224077. Symcor validates archive semantics; upstream source-field mapping and general OCR acceptance may require the CLUE/business/Tungsten owners separately.

Distinguish a genuine zero hit, SOAP fault, HTTP/transport failure, truncated results, missing image and blank OCR. HTTP 200 or a positive count alone is not a validated match. Never fabricate missing XML, DocIDs, images, OCR values, logs or a new successful run.

4. Deliver and verify

Create a new review folder containing the .docx, copyable curl/helper files, original request/response copies, selected original images, a compact case/document CSV and an evidence manifest with run/source identity and file hashes. Preserve original artifacts and keep secrets outside this folder. Include a PDF companion only if readily available; Word is the required deliverable.

Render/open and visually check the Word document: readable tables/code, full identifiers without clipping, correct images/captions, sensible page breaks and no missing embeds. Verify each displayed output row/image against its saved source/document association. Do not run a broad application test suite for document preparation.

Open the final Word document and output folder on the owner's workstation. Return exact accessible paths and a short English readiness table: file/case | ready or missing | evidence/limitation. Explicitly report zero new provider calls during preparation. If native evidence is unavailable, finish the rest of the document with the exact gap clearly marked rather than presenting reconstructed data as an observed result.
