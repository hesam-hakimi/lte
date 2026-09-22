Configure CLUE on DEV using the attached delivery receipt. The user has successfully connected VS Code to DEV and authorizes application setup and bounded verification. All responses and artifacts must be in English.

1. Confirm that commands execute on DEV: hostname, user, OS, working directory, Python, and permissions. Read the latest repository instructions and deployment references. Use this working remote session; do not treat the earlier laptop BatchMode SSH failure as a current access failure.
2. Retrieve the exact published commit from the delivery receipt through the established DEV workflow. Verify its SHA. Preserve existing deployments and dirty working trees; record the prior state for rollback. Do not guess a revision if the receipt is missing.
3. Prepare the project’s declared Python/dependency environment. Configure the application’s input, processing, output, log, and capture directories. Verify read/write access using the actual execution account. Resolve Windows-specific paths and laptop-only localhost settings.
4. Configure Symcor and Tungsten using the current code and environment references. Reuse provisioned credentials, client certificates/keys or keystore references, and the trusted CA bundle. Verify their readability without exposing secrets. Keep TLS and hostname verification enabled for HTTPS.

DEV is the source machine; PAT has been the verified nonproduction Symcor destination at penhubpat.td.com. Use the documented DEV-to-PAT route. Do not require a separate Symcor DEV hostname solely because execution is on DEV. Do not substitute another endpoint or production configuration without supporting evidence.

5. Verify from DEV itself: configuration loading, DNS/TCP, verified TLS/client-certificate use, and a real Symcor operation through the normal application client. Reuse existing helpers and bounded timeouts.
6. When configuration and connectivity permit, run one real end-to-end smoke test using the existing user-authorized case:

* documentFolder: ALL1
* ProcessingDate: “20260717”
* ItemSequenceNumber: “4850040005”
* Account: “05224026”
* DebitCreditIndicator: “D”
* Equality operator 1 for the four search criteria.

Reuse the existing one-row input and case-specific date mapping. Preserve leading zeros. Do not broaden the search or substitute fixtures/replayed responses.

7. Execute normal ingestion → live Symcor retrieval → real Tungsten → Excel. Enable captures and verify that Symcor responses/image parts and Tungsten responses were actually saved for this run. Correlate document IDs, image hashes, and job IDs.

Verify A:W preservation, the 41-column A:AO layout, embedded X/Y images, and all eight value/confidence pairs against this run’s raw responses. Do not force zeros to match the previous run.

The existing case is suitable for DEV integration verification. Positive OCR accuracy remains NOT EVALUATED; missing human-reviewed positive data must not block this smoke test. Keep front/back identification marked as configured order unless independently confirmed.

8. Report the actual deployed SHA, host/user, environment and non-secret configuration paths, stage-by-stage outcomes, capture completeness, output paths, and a reproducible invocation without secrets. Update the DEV handoff.

Complete independent checks if one stage is blocked. Distinguish manual execution under the current account from future service-account/AutoSys/TIBCO readiness. Do not enable scheduled jobs, modify shared infrastructure, or change production. Publish any necessary source fixes through the same feature-branch workflow and record the final deployed SHA.
