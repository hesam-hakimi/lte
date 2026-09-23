Continue the existing CLUE session. Implement the narrowly scoped live-execution enforcement fix identified in your final report for prompt 61843.

Prompts 57291 and 61843 have received completion reports. Preserve the delivered MON_INSTRUMENTS outputs and their PARTIAL status. Do not repeat that run.

All responses, code, tests and documentation must be in English.

1. Establish the applicable policy

Read the current local handoff and actual code for:

* assert_live_allowed()
* Profile resolution and synthetic/provider-contract markers.
* build_providers and the application entry points used by normal execution and resume.

Your latest report states that assert_live_allowed() is called only by a test, while production merely reports synthetic_execution. Verify this against the current checkout and identify the earliest shared boundary that can enforce the existing rule before any provider network activity.

Distinguish input-schema support from provider-contract readiness. A workbook matching the Rahona schema does not itself establish approved search mappings.

2. Implement the smallest effective correction

Enforce the existing live-execution policy on every applicable path that can initiate real Symcor or Tungsten activity, including resume.

For disallowed configurations, fail before provider authentication, network activity or job submission. Return a clear diagnostic explaining the blocking profile/contract condition, without exposing credentials.

An explicit provider mode, endpoint or credential file must not silently satisfy a separate contract restriction.

Preserve legitimate local fixture/simulator execution and offline export of completed workspaces. Export-only operations must not acquire a new dependency on live authorization.

Use the existing guard and documented policy. Do not add a generic bypass, clear synthetic markers, or automatically infer approval from previous runs. If an allowed DEV exception is not defined by the existing contract, enforce the restrictive rule and identify that missing policy decision separately.

The owner’s authorization for the completed new-input run must not become a permanent or global bypass. This task authorizes implementation and offline verification, not additional live calls.

3. Prove enforcement through the real application path

Add focused regression coverage that would have caught the original defect. Calling assert_live_allowed() directly is insufficient.

Exercise the actual application/provider setup path with offline doubles and verify:

* A disallowed live configuration is blocked with zero provider network/authentication calls, even when endpoint and credential settings are otherwise present.
* Applicable resume paths enforce the same rule before new provider work.
* Local fixture/simulator execution remains functional.
* An allowed configuration, if one is defined by the existing policy, reaches the mocked provider path.
* Offline re-export remains available and preserves business values, outcomes and layout.

Keep all verification offline. Do not use real provider calls to demonstrate that the guard works.

Run the relevant focused tests. Run a broader suite only if an applicable repository gate or a concrete remaining risk requires it.

4. Preserve project boundaries

Do not change CP-D03, date or identifier mappings, account representation, source-to-document associations, the DAT_CSV Q correction, or Rahona source-value pass-through.

Preserve getDocs, classification, output-profile, diagnostic-metadata, cache-path and search-provenance fixes.

Keep the business workbook at 41 columns A:AO, sheet in, images X/Y and eight field/confidence pairs Z:AO. Do not regenerate or modify delivered workbooks or historical evidence.

The Python-version mismatch, OCR accuracy, image-side attribution, unavailable images, NO_MATCH and business-semantic questions remain separate.

5. Deliver the implemented result

Update the local handoff and prompt ledger with:

* The confirmed enforcement gap and its scope.
* The implemented enforcement boundary and behavior.
* Exact changed files and revision or diff identity.
* Test commands and actual results.
* Evidence that blocked cases made zero network calls.
* Any policy question that remains unresolved.

Provide a concise final implementation report. Do not merge, push, deploy, send external messages or perform archive/lifecycle work.
