Continue the existing CLUE session from the received result of prompt 72954.

The objective is to reconcile CP-D06 and CP-D08 against existing evidence and prepare a usable, versioned DEV provider profile wherever the documented contract permits it. Complete supported implementation work offline.

1. Reconcile the baseline

Preserve the enforcement fix reported at commit 7cc20ae and its reported 654 passed / 5 skipped / 0 failed result. Do not repeat that work.

Record that prompts 40872, 57291, 61843 and 72954 have received results. References still marking them pending are stale.

Preserve the completed MON_INSTRUMENTS run: 16 source rows, 354 output rows, 350 associations, 88 unique documents, 684 embedded images, zero reported A:W comparison mismatches, and PARTIAL status. Do not rerun or regenerate it.

2. Resolve requirements from the actual sources

Read the current code, native provider documentation, available WSDL/XSD, supplementary specifications, Tungsten setup/Postman material and saved request/response evidence.

Build a concise evidence matrix covering:

* CP-D06: effective Symcor operations, required criteria, document identities, child enumeration, getDocs request/response handling, limits and image-side attribution.
* CP-D08: Tungsten request schema and encoding, process/configuration selection, response fields, confidence semantics, submission/status/error behavior and recovery after an unknown submission outcome.

For each requirement, identify its exact source, implementation location, evidence status and effect on DEV eligibility.

Distinguish documented behavior, observed behavior, inference and an actual approval requirement. Do not describe a missing implementation as missing provider documentation. Do not infer contract approval from HTTP success or populated OCR fields.

Reuse the already established getDocs evidence, including imageFormat 0 = JPEG. Do not reopen settled questions or request examples already present in the native documents.

3. Prepare the supported profile implementation

Inspect load_native_profiles() and the existing provider contracts. Identify which failures represent missing code and which represent genuinely unresolved requirements.

Where current evidence and policy satisfy the prerequisites, implement the smallest versioned provider-profile configuration and loader wiring. Keep input-schema selection, provider-contract readiness and output-profile selection separate.

Keep assert_live_allowed() enforced. Do not enable execution merely by clearing synthetic markers, adding an unconditional approved flag or introducing a generic bypass.

For unsupported requirements, leave the affected capability explicitly unresolved and blocked. Implement the supported portions and identify the exact remaining fact or decision needed to activate the profile.

CP-D03, source-to-document business linkage and unresolved identifier meanings must remain explicit. A profile change must not silently approve the current source-date mapping, reinterpret CIF/W/Q, pad accounts or widen search dates. Any existing documented approved-search-case mechanism must retain its actual limited scope.

4. Validate offline

Use the actual profile loader and normal application entry point with saved-response replay or mocked transports.

Verify that supported profile configuration reaches the intended adapter with documented request construction, while unresolved configurations remain blocked before network activity.

Do not rely solely on a fabricated approved ProfileSet. If a real supported profile is introduced, update the test that currently assumes every shipped profile is blocked to assert the correct per-profile policy.

Run focused tests for changed behavior and any mandatory repository gate. Do not repeat unrelated acceptance batches or completed guard tests without a concrete reason.

5. Deliver a concrete handoff

Update the local current-state document, handoff and prompt ledger. Report their exact paths.

Deliver:

* The evidence matrix and implemented profile/configuration changes.
* Actual test commands and results.
* Whether a real DEV profile is now eligible, and the precise basis or remaining blockers.
* A documented command template for later execution, if supportable; do not execute it.
* A short draft containing only questions still unanswered after reviewing existing sources. Identify the appropriate source/provider owner for each question, but send nothing.

Keep all previous fixes, source-value preservation and the 41-column business workbook contract intact. Keep the Python mismatch, OCR accuracy, image-side attribution, unavailable images and NO_MATCH concerns separately tracked.

Make no live provider calls, including smoke probes. Do not weaken TLS, modify delivered evidence, merge, push, deploy or perform archive/lifecycle work.
