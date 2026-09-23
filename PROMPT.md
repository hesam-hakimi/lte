Continue the existing CLUE project in the current corporate checkout. Implement and execute a repeatable DEV deployment, then deliver the scripts and runbook that the application deployment team can use in higher environments. Complete the executable work; do not stop at a plan. Use English for code, comments, logs and documentation.

Scope and evidence
- This task authorizes the DEV deployment using existing access and permitted procedures. Prepare higher-environment instructions; do not deploy to PAT or Production servers.
- Read AGENTS.md, CLUE_HANDOFF.md, the current deployment scripts, pyproject.toml, requirements/lock files, CI/CD configuration and recent execution reports. Reuse existing working tools. Preserve unrelated changes and completed run evidence.
- The latest supplied reference is CLUE-REF-2026-09-23-R5. Reconcile it with newer native evidence. Earlier "deployment deferred" notes describe previous tasks; this request opens the DEV deployment work.
- The meeting requested a versioned artifact, download/extraction steps, installation under an agreed /opt location, Python/dependency setup, validation and an operations handoff. Running successfully under the developer's home directory does not establish deployment under the intended operational account.
- Screenshots show example FCCM hosts, including a Production session. Do not select a CLUE target from those pictures. A historical CLUE DEV locator is crcluesbdzwnk0.dev.vmc2.td.com; verify it against the current SSH/deployment configuration before writing.
- Downloading https://rp.td.com/ returned HTTP 200 with text/html, saved as file.tar.gz. This is not evidence of a downloaded application archive. Find the exact versioned Nexus artifact URL.

1. Establish the concrete deployment inputs
Inspect the existing repository and authorized DEV connection. Record the release revision/source digest, verified DEV host, login account, deployment owner/group, runtime account, exact application directory under /opt, configuration location, data/log/workspace paths, Python executable and Nexus coordinates. Keep credentials out of reports.

Use current configuration and documented decisions to resolve these inputs. Do not invent a service account, artifact URL, secret reference or installation path. If a required value remains missing, finish every independent packaging/script task and report that specific unresolved input.

The application has declared Python >=3.10; DEV was previously reported as 3.9.25. Python 3.12 was requested in the meeting, but installation was not demonstrated. Check the actual host. Use an approved compatible interpreter, preferably the requested 3.12 when available and validated. Do not replace /usr/bin/python, lower requires-python, or claim a Python 3.9 run satisfies the declared requirement.

The meeting gave conflicting descriptions of who installs OS software. Follow the actual approved DEV administration/change procedure. Use existing permitted elevation for necessary installation or directory setup; root availability alone does not resolve the process. If the interpreter is unavailable and its installation cannot be performed through that procedure, provide the exact prerequisite action and continue the remaining work.

2. Produce one identifiable release artifact
Reuse and minimally complete the current build/deployment mechanism. Package the intended application snapshot and record its revision, source digest and any included uncommitted changes. Preserve other working-tree changes.

Create a versioned archive containing the application wheel or supported source layout, deployment/launch scripts, pinned dependency inputs, manifest, and any required offline wheelhouse. Derive the dependency list from the repository, including transitive dependencies; do not hard-code the meeting's estimate of five libraries.

Verify wheels against the target Linux architecture, Python version and ABI. Do not ship the Windows virtual environment, assume an old Python 3.9 wheelhouse works on 3.12, or silently compile missing dependencies on the target.

Exclude secrets, PEM/JKS/private keys, credential-bearing .env files, SSH keys, business workbooks, captures and historical workspaces. Produce a SHA-256 checksum for the archive and identify the expected package contents.

3. Establish the Nexus delivery route
Inspect the existing repository/pipeline configuration for the approved Nexus repository and authentication method. Use a versioned artifact path, not the Nexus homepage. Reuse the established publishing route when available and in scope; never overwrite an existing release version.

Download with HTTP failure handling and certificate verification, using the corporate CA where needed. Validate the expected SHA-256, archive type and member paths before extraction. Reject HTML/login/error responses even when HTTP status is 200. Extract into a new release directory without allowing paths or links to escape it.

Keep dependency installation inside the release virtual environment. Use the verified wheelhouse with --no-index --find-links, or the configured internal Nexus Python index with pinned versions. Avoid an implicit public-PyPI fallback.

If Nexus publication/access is unavailable, still build the upload-ready bundle and exact handoff instructions. Use the existing authorized SSH/SCP path to validate the same checksum-verified artifact on DEV where feasible. Report this as direct-transfer DEV validation, with the Nexus delivery step pending.

4. Implement and run the deployment scripts
Prefer extending existing scripts. Provide a parameterized Bash entry point that supports preflight, deployment, validation and rollback, either directly or through existing companion scripts.

Use explicit arguments/configuration for the host/environment, artifact/checksum, Python executable, application root, runtime identity and configuration path. Reject unresolved required values before mutation. Use clear error handling, quoted paths, safe temporary files, readable logs and actual exit codes. Do not echo secret values or enable shell tracing around credentials.

Keep code in versioned release directories and mutable data/configuration outside those directories. Create the virtual environment at its final release path on the target; do not create it elsewhere and move it. Install the application and dependencies through that environment's Python.

Use the intended runtime identity for validation. Limit elevated steps to those that need them; do not run the application or pip as root. Preserve the developer's existing installation, completed outputs and workspaces. Do not change unrelated directories or ownership.

Record the previous active release. Validate the new release before switching the active pointer; make activation atomic where the existing layout supports it. Make repeating the same deployment safe, and retain a concrete rollback command. Coordinate with any actual running job before activation. Do not introduce Docker, a daemon or a new scheduler as part of this batch deployment.

5. Wire the existing runtime configuration and TLS
Use the current application's supported configuration loader and verify precedence. Avoid silently picking up a developer .env or importing from a developer checkout.

The latest deployment handoff uses PEM, with no additional Base64 wrapping and no JKS in the deployment package. The tested setup used one combined PEM for CLUE_SYMCOR_CLIENT_CERT and CLUE_SYMCOR_CLIENT_KEY, a separate CLUE_SYMCOR_CA_BUNDLE, no key password for that specific unencrypted identity, and TLS/hostname verification enabled.

Reuse the existing approved secret files or established HashiCorp Vault/EDP injection mechanism. Keep private material outside the artifact and readable only by the intended identity. Do not invent Vault paths, add an SDK, or claim injection is implemented unless verified. Preserve independent Tungsten configuration and authentication.

The recorded Symcor test endpoint is https://penhubpat.td.com/aws/services/AwsService. This provider endpoint is separate from the DEV deployment host. Do not infer Production settings from the successful PAT control. Verify actual settings through the current transport without exposing secrets.

6. Validate the deployed artifact
Perform focused checks on the target using the intended runtime identity:
- Python version/executable, virtual environment, application module location and dependency consistency (including pip check).
- Required configuration/certificate readability and writable data/log paths.
- The actual batch entry point, historically python -m clue.batch; confirm current arguments from code/help.
- One small existing fixture smoke through the deployed application in a fresh isolated workspace. Check the Excel contract: source unchanged, original worksheets preserved, one result sheet with 41 columns and retained A:W source values.
- A repeat preflight/deploy check and rollback-target verification, without disturbing existing runs.

Do not repeat the entire historical business batch or the full test suite just to verify deployment. Preserve live-call guards. If an existing authorization covers a post-deployment PAT control, run that bounded control once through the deployed transport; otherwise record connectivity NOT_RUN. Do not send the prepared Debit/getTransactionItems probes or weaken the Tungsten guard.

Installation, fixture smoke, live connectivity and business acceptance are separate results. Preserve real application exit codes, including PARTIAL; never turn a failed or partial run into success.

7. Deliver the operations handoff
Deliver the release archive/checksum, executable scripts, a concise deployment runbook and an execution report. Use existing filenames where practical.

The runbook must give the exact ordered commands for prerequisites, artifact download/verification, extraction, venv/package installation, permissions/configuration, validation, activation, batch invocation and rollback. Identify the responsible role for OS Python, artifact publishing, application deployment and runtime secrets. Include the scheduler-ready command and exit-code handling without registering a new schedule.

The report must state the actual host/account, release/version/hash, Python version, installed paths, checks performed and observed exit codes. Mark each stage EXECUTED_PASS, EXECUTED_FAIL, BLOCKED or NOT_RUN. Distinguish developer-account validation from service-account validation and a direct transfer from a verified Nexus route.

Update CLUE_HANDOFF.md with the evidence and remaining blockers. Keep existing business/open-item status intact. Put the reviewable handoff files in a clearly named local delivery folder and return absolute paths.

Proceed autonomously with the authorized DEV work. Do not repeatedly request permission for routine steps. If a specific access control or missing prerequisite blocks a step, retain that boundary, complete independent work and give the smallest concrete action needed. Do not report deployment completed until the target installation and validation actually ran.

