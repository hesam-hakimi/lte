Continue the current CLUE session. Finish the existing DEV acceptance run, download the output workbooks to my Windows laptop for visual review, and then address the separate run-status classification defect.

Keep all responses, code, tests and reports in English. Archive lifecycle investigation remains deferred.

1. Check the existing run

Inspect the current process, durable queue, logs and output artifacts under:

/home/tag5916/clue_private/e2e_fixed_20260922/

The last report showed the remaining Credit extraction still running, with 58 of 341 extraction items completed. Treat that as a historical snapshot and establish the current status.

Preserve the active process and its workspace. Do not start a duplicate batch. If it has stopped unexpectedly, diagnose the cause and use the application’s supported recovery mechanism without repeating completed provider work.

2. Download available workbooks now

Locate the completed XLSX outputs for pilot_debit, pilot_credit and remaining_debit. Copy them from DEV to a new folder on my Windows laptop, outside Git, such as:

%USERPROFILE%\Downloads\CLUE_DEV_Review_\

Use the existing authorized connection and transfer method. Resolve the actual Windows user path.

Preserve the original workbook contents and use separate subfolders to distinguish runs. Keep the DEV originals in place. Verify file sizes and SHA-256 hashes on both sides.

Check programmatically that the XLSX files are readable and contain the reported worksheets, rows and embedded images. I will inspect their contents visually in Excel.

Give me the exact local paths as soon as these downloads are ready, without waiting for the remaining Credit extraction.

3. Complete the remaining acceptance evidence

Continue monitoring the existing remaining_credit run. When it finishes, verify that its output files are finalized, then download its XLSX and accompanying CSV/JSON results into the same review folder.

Reconcile all 17 original source rows: 5 Debit and 12 Credit. Report source-row outcomes, document associations, unique documents, retrieval/cache reuse, unavailable images, completed extraction, unresolved work and output counts separately.

Account explicitly for the four Debit NO_MATCH cases and the previously reported eight provider-unavailable Credit associations. Verify the final counts from evidence rather than carrying forward interim totals.

Do not infer success from exit code 0 alone. Distinguish technical completion, retrieval completeness, populated OCR fields and independently validated OCR accuracy.

4. Correct run-status classification separately

After capturing the current run’s final evidence, implement a focused correction to classify_run and its necessary callers/reporting.

Review the existing status and exit-code contract first. Ensure required-image failures or unresolved work cannot disappear behind completed item states and produce an unqualified COMPLETE result.

Keep legitimate NO_MATCH outcomes, provider-confirmed image unavailability and technical failures distinguishable.

Add focused regression coverage for successful processing, NO_MATCH, all images unavailable, mixed successful/unavailable outcomes, pending technical work and unfinished extraction. Validate this change locally without repeating the full live provider batch merely to test reporting.

Preserve the original DEV results. Record any corrected interpretation separately.

5. Deliver the review package and final report

Include a short manifest mapping each downloaded workbook to its source run, source-sheet rows, counts and checksum. Open the local review folder in Windows Explorer and list the exact workbook paths for me.

Report the tested revision, final run status, remaining defects and classification-test results. Retain the Python 3.9.25 versus declared Python >=3.10 limitation.

Preserve the getDocs correction and prior evidence. Keep shared deployments, credentials, TLS settings, dependencies and scheduled jobs unchanged. Do not merge these changes.
