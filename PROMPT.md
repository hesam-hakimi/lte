Stop expanding the runbook. Preserve the current installer and dry-run test changes, but rewrite the canonical docs/handoff/clue/deploy/CLUE_DEPLOYMENT_RUNBOOK.md as a concise, operator-first deployment procedure.

Do not deploy, publish, build, commit, push, or modify the DEV server. Do not create another deployment document.

Required structure:

1. Purpose, roles and required inputs
2. One-time administrator bootstrap
3. First installation
4. Verification and handoff
5. Rollback
6. Runtime/AutoSys gate
7. Short troubleshooting reference

The happy path must fit in approximately two pages and contain no more than three copy/paste command blocks:

* Administrator bootstrap
* Dry-run plus real release
* Verification/status

Use these DEV values only as a clearly labelled environment example, not as generic hard-coded installer logic:

* CLUE_RUNTIME_USER=TCLUE999DEVS
* CLUE_OWNER_USER=TCLUE999DEVS
* CLUE_OWNER_GROUP=vmc2_clue_dev
* CLUE_APP_ROOT=/opt/td/clue

Correct the current content as follows:

* Record that id TCLUE999DEVS resolves successfully. The exact getent passwd TCLUE999DEVS check remains to be captured because the previous commands were mistyped.
* Do not create a local user or group with useradd, groupadd or usermod. The NPID and group are centrally managed.
* The administrator may create only releases, conf, logs, and work.
* Never recursively chown or chmod /opt/td/clue.
* Explicitly preserve archive, clue_staging, outputs, and rejects.
* The installer must run as the configured non-root owner.
* Installation requires no application secrets.
* Runtime secrets come through clue_with_runtime_secrets.sh using non-interactive Salt pillar retrieval backed by HKV. Do not document permanent Symcor PEM files, local secret copies, .env secrets, or direct Vault calls.
* Remove uploader NPID/Vault details, repository-search history, Maven/PyPI investigations, raw test logs and old execution narratives from the operator path.
* Remove stale a6f3ba4, PROPOSED_NOT_PUBLISHED, and “no CLUE account exists” claims.
* Do not hard-code the test release as the canonical release. Use <artifact-url>, <artifact-sha256> and <release-id>, with at most one clearly labelled current DEV example.
* The operator must not manually repeat artifact inspection already performed by clue-deploy.sh. TLS download, outer SHA-256, archive safety, manifest/internal checksums, extraction, configuration validation, offline installation, validation and atomic activation belong to the deployment script.
* If a minimal bootstrap extraction is unavoidable because clue-deploy.sh is inside the archive, keep only the smallest verified download/checksum/extraction block and explain why.
* Replace manual vi editing with deterministic configuration rendering or explicit variable substitution, followed by checks for remaining __SET_ME__ placeholders and final ownership/mode.
* Keep --dry-run zero-mutation and zero-network.
* Separate INSTALLATION_COMPLETE from AUTOSYS_HKV_RUNTIME_VALIDATED.

Historical validation evidence should be reduced to a small summary table and a reference to the existing execution evidence; do not paste detailed logs into the runbook.

After rewriting:

1. Show the final heading outline.
2. Show the exact three happy-path command blocks.
3. Report the before/after line count.
4. Run git diff --check.
5. Run the relevant deployment and dry-run tests.
6. Confirm that only the three intended repository files remain changed and that temporary harness files are absent.
7. Do not ask to install anything yet.
