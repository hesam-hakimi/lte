Continue CLUE from the laptop session. Copilot is unavailable inside VDI, so perform DEV preparation and testing through SSH/SCP from this laptop. Do not require Copilot on DEV.

The delivery receipt reports:

* Repository: https://github.com/TD-Universe/W001CLUEinitialRepo.git
* Branch: feature/clue-import-20260921
* Published commit prefix: f7491a8
* Laptop tests: 537 passed, 2 skipped.
* DEV terminal shown as tag5916@crcluesbdzwnk0.

Verify these against the actual checkout and connection configuration. All responses and artifacts must be in English.

1. Establish SSH from THIS laptop using the existing connection settings and authentication method. Confirm the remote hostname and user. A successful connection inside VDI does not prove laptop access. The earlier BatchMode authentication failure does not prove interactive login is unavailable.

If password/MFA interaction is required, let the user complete it in the terminal. Do not store credentials in scripts or assume subsequent connections are authenticated automatically. Reuse an already configured authentication agent/key where available. Preserve host-key verification.

2. Resolve the full published commit SHA. Package that exact committed tree with git archive, using –output rather than a PowerShell binary pipeline. Verify the archive contains the application, dependency definitions, tests, and required synthetic fixtures. Record the commit and archive SHA-256.

Do not recursively copy the laptop working directory, virtual environment, .env, private keys, or outputs directory.

3. Reuse existing deployment/verification helpers. If a remote runner is missing, create a small Bash script with LF line endings and explicit error handling. Transfer the archive and runner using SCP into a user-owned staging location. Verify the transferred archive hash before extraction. Preserve existing deployments and dirty directories.
4. On DEV, inspect the actual Python environment and project requirements. The receipt states Python >=3.10. Prepare an isolated environment using the configured package source and declared dependencies.

Run the documented test command on DEV:
PYTHONPATH=src .venv/bin/python -m pytest tests/clue

Capture the real exit status and a test report. Do not translate PowerShell stderr output alone into failure or success. Report actual results rather than assuming the laptop count will repeat.

5. Continue the already authorized DEV configuration and one-case integration smoke test when prerequisites are available. Read current repository configuration and handoff instructions first.

Important details from the delivery receipt:

* Real input files were excluded from Git. Transfer only the existing authorized one-row test input separately if needed.
* Reuse provisioned DEV certificate/secret locations and keep HTTPS verification enabled.
* Preserve the working laptop’s positive –symcor-docs-fetch-limit setting. The receipt states the default getDocs path remains incompatible with live PAT; do not accidentally switch back to it.
* Preserve the explicit –symcor-segment-order setting, while retaining its configured-order evidence status.
* Check effective settings: the receipt says –env-file values override process environment values.

Use the normal application pipeline and real providers. No fixture fallback. Record the Symcor and Tungsten exchanges from this DEV run, correlate document/image/job identities, and validate the generated workbook against the raw responses.

6. Retrieve the test report and appropriate output artifacts to the laptop. Report the deployed source SHA, remote host/user, environment paths, test exit status, integration results, and remaining blockers. Positive OCR accuracy remains NOT EVALUATED for the existing blank-field case.

If direct laptop SSH is unavailable, identify whether the failure is name resolution, network access, or authentication. Use an existing documented jump host only if available; do not assume the VDI is an SSH jump host. Otherwise prepare the same runner for manual execution through the working VDI terminal.

No production changes, shared infrastructure changes, or scheduled-job activation.
