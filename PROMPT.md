Continue the CLUE DEV investigation. Diagnose the failed getDocs calls using saved evidence and the actual Symcor contract. This remains a diagnosis-only task: do not modify application code, dependencies, deployment, credentials, or runtime state. All responses and artifacts must be in English.

Reported baseline—verify from saved artifacts:

* All 17 source rows were attempted: 5 Debit and 12 Credit.
* Four Debit searches returned no matches.
* One Debit case and the Credit cases reached getDocs, with repeated INTERNAL_ERROR SOAP faults.
* No images were retrieved and Tungsten was not called.
* Two Credit cases remain pending_technical.
* The earlier successful one-row DEV run retrieved two images, but its exact retrieval operation must be established.

1. Select representative evidence.
    Locate the previous run under:
    /home/tag5916/clue_private/e2e_tdb_20260922/

Reuse the local evidence copy if available. Select:

* The Debit case that found a document but failed at getDocs.
* One Credit case that returned items but failed at getDocs.
* The earlier successful one-row execution.

Read original request/response captures and logs programmatically. Do not use screenshots, OCR, or reconstructed XML. Preserve originals and record evidence paths, UTC timestamps, correlation IDs, and source revisions.

2. Establish how the earlier successful run retrieved images.
    Determine whether images arrived inline in search, through getDocs, or through another operation. Compare effective retrieval mode, docsFetchLimit, folder, endpoint, request structure, and identifier mapping.

Do not describe the earlier run as proof that getDocs works unless a successful getDocs request/response exists.

3. Validate the two failed getDocs requests against the contract.
    Read the relevant current local Symcor specifications, WSDL/XSD files, approved examples, and existing notes about the previously reported schema mismatch. Record document versions and exact section/schema references.

Check:

* SOAP version, action, namespaces, operation wrapper, element order, required fields, and types.
* Client/folder/context fields.
* How document, transaction, item, image, and segment identifiers are derived.
* Whether identifiers retain their exact source values, leading zeros, and parent-child associations.
* Whether the request uses identifiers of the correct kind from the immediately preceding response.
* Whether omitted or empty fields differ from the documented contract.

Use existing offline schema-validation tooling where available. Schema validity alone does not prove semantic correctness. If the authoritative contract or imported schemas are missing, identify the precise missing evidence instead of declaring compliance.

Produce a field-level comparison with:
contract requirement | actual request | source response field | verdict | evidence reference.

4. Reconcile the Credit flow.
    Trace one Credit case through the actual code and captures:
    searchTransaction → inline items or getTransactionItems → getDocs.

The report says getTransactionItems was skipped because items arrived inline. Verify:

* What was actually returned.
* Whether the contract supports retrieving documents directly from those inline items.
* Whether transactionContext or another required value was lost.
* Whether the returned items represent the intended scope for that source row.

Do not infer that skipping getTransactionItems is correct merely because the application does it.

5. Separate other unresolved issues.
    For the four zero-hit Debit rows, verify the saved Account/ProcessingDate criteria against the original workbook and the documented search-field meanings. Do not change identifiers or dates to manufacture a match.

Check the documented retention rules and their applicability to this PAT environment. Successful metadata search does not establish image retention or availability.

Absence of truncation indicators alone does not prove complete retrieval; assess the documented limit behavior.

Review the Debit COMPLETE/exit-0 outcome against the application’s documented status contract. Report any mismatch separately from the retrieval failure; do not fix it.

6. Correct the causal conclusion.
    The evidence establishes that Symcor returned an error during getDocs. It does not, by itself, establish that CLUE is defect-free.

Classify findings as:

* Confirmed request/contract mismatch.
* Confirmed provider response.
* Supported hypothesis.
* Unresolved because specific evidence is missing.

If you identify a code defect, report its file/function and the required conceptual correction without editing it.

7. Prepare the next actionable handoff.
    Return:

* A concise explanation of what failed and what remains unknown.
* The failed-versus-successful retrieval comparison.
* The request/contract validation table.
* Whether the Credit inline-item path is documented.
* A minimal Symcor support draft with operation, environment, UTC timestamps, correlation IDs, fault, and focused questions.

Prepare sanitized request/response examples for the draft. Keep original account data, identifiers, captures, and secrets private and outside Git. Do not send anything to another person.

Do not repeat the 17-row run or issue new live service calls during this investigation. If a live comparison is necessary after the offline review, propose one narrowly scoped test and explain what uncertainty it would resolve.

Finish with the single recommended next action, supported by the evidence. Preserve the existing pending_technical cases and all prior run results.
