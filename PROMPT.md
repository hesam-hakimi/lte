Continue the CLUE DEV test-only task. Use the existing inline-image retrieval option to test whether the supplied cases can progress to Tungsten and final output. Do not modify application code, dependencies, deployment, or credentials.

All responses and artifacts must be in English.

1. Preserve the diagnosis.
    The saved evidence shows a getDocs request/XSD mismatch. The earlier successful run retrieved images inline through search with docsFetchLimit=10; it did not validate getDocs.

Keep the previous 17-row results and the two pending_technical cases unchanged.

2. Start with a bounded comparison.
    Reuse the existing converted CSVs and select:

* The Debit row that previously returned one document.
* One Credit row that previously returned nine child documents.

Use fresh, private run-specific input/workspace/state/output/capture directories. Reuse the established DEV application and secure configuration, with TLS verification enabled.

Run through the normal application entry point, changing only:
–symcor-docs-fetch-limit 10
plus paths needed for isolation.

Do not change search criteria, identifiers, dates, routing, or segment-order assumptions. Record the exact commands and effective configuration.

3. Inspect the actual retrieval behavior.
    For each case, establish:

* Whether search/searchTransaction returns image MIME parts.
* How many documents and images are returned and correctly associated.
* Whether the application still attempts getDocs.
* Whether Tungsten is called and completes.
* Whether final outputs faithfully reflect provider results.

If the known malformed getDocs path is reached again, preserve the evidence and avoid repeating it across the entire dataset. Do not patch or bypass application logic.

4. Continue only where the comparison supports it.
    If inline retrieval works, test the remaining source rows using the same supported configuration, without repeating completed cases.

Before running Credit cases with more than 10 documents, inspect the documented docsFetchLimit semantics and supported maximum. Use a larger value only if existing documentation and CLI support establish that it is valid for the observed scope; record this additional configuration change explicitly.

Do not silently truncate retrieval, invent pagination, or describe a partial image subset as full end-to-end success. If complete retrieval is not achievable using supported configuration, report partial coverage and the exact remaining blocker.

If the initial comparison fails in both directions, stop broad repetition and report the observed first failing stages.

5. Report evidence without overclaiming.
    Provide per-source-row results and separate totals for:

* Source rows attempted.
* Documents discovered.
* Documents with images retrieved.
* Tungsten jobs completed.
* Final outputs verified.
* Failed, blocked, partial, and not-run cases.

Distinguish technical completion, complete retrieval, case/image association, and OCR accuracy. OCR accuracy remains NOT EVALUATED unless independently established expected values are available.

Successful inline retrieval does not repair or validate getDocs. Failure to retrieve inline images does not by itself prove retention or a provider outage.

Return exact commands, evidence paths, the comparison with the previous run, and the next evidence-supported action. No code fixes, commits, deployments, or messages to other teams.
