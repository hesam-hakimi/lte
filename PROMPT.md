Continue from the completed field-alias correction. Prepare and execute the next meaningful CLUE validation using the existing tools.

Constraint: You have no vision capability. Do not visually interpret cheque images or infer their contents from filenames, requested field names, or Tungsten classifications.

1. Prepare a small, machine-readable expected-results file for a positive test case. It must record:

* Exact Symcor search criteria and case identity.
* Human-confirmed front/back labels, with their source.
* Human-reviewed expected values for the eight business fields.
* A distinction between “reviewed and absent” and “not yet reviewed.”

Do not populate expected values from Tungsten’s response; the comparison must use independent evidence.

2. Reuse the existing end-to-end runner and verification helpers. Ensure the test can compare:

* Human-reviewed expectations against the actual Tungsten results.
* Raw Tungsten results against normalized fields and Excel cells.
* Input-row identity, document ID, image hashes, and Tungsten job IDs across the run.

Preserve leading zeros, numeric zero confidence, missing confidence, and field-status distinctions. Keep confidence values unscaled.

3. Extend the existing capture mechanism as needed to retain the Symcor responses and retrieved image parts from the same run, alongside the Tungsten exchanges. Keep credentials out of captured logs. Preserve the current workbook contract.
4. If an already supplied, authorized PAT case with reviewed nonempty target fields is available, run that case through live Symcor, real Tungsten, and Excel generation using the existing configuration and bounded timeouts.

Do not broaden archive searches or invent another transaction. If the positive case or its human-reviewed expectations are missing, complete the local preparation and identify precisely what is needed. Do not repeat the existing blank-field case as evidence of positive extraction.

5. Report separately:

* Pipeline execution.
* Provider-to-Excel fidelity.
* Matches and mismatches against independently reviewed values.
* Fields not evaluated.
* Front/back labels confirmed for this case versus labels based only on configured order.

Use focused checks for any changes. Preserve unrelated work. No deployment, commit, or push. All responses and artifacts must be in English.
