Proceed with the implementation and publication task below. This is the complete task, not another context-reconstruction request. All responses and engineering artifacts must be in English.

Your repository audit is complete. Reuse those findings and inspect only what is needed to perform this work. Do not inspect chat/session logs or unrelated repositories.

Workspace:
C:\repos\clue-edponboard-runtime-env

Expected origin:
https://github.com/TD-Universe/W001CLUEinitialRepo.git

Existing runtime-secrets commit: 07c096c — resolve its full SHA locally.
Target remote branch: feature/edponbaord

Objective: integrate the existing runtime-secrets implementation with Muhammad’s latest branch, fix executable permissions in the deployment archive, validate, commit, and perform a normal push.

Runtime contract already supplied by Muhammad:

* Retrieve secrets using sudo -n salt-call pillar.get “secrets:” –out=json.
* secrets:tungsten_primarykey → CLUE_TUNGSTEN_PRIMARY_KEY, as a value.
* secrets:tungsten_secondarykey → CLUE_TUNGSTEN_SECONDARY_KEY, as a value.
* secrets:symcor_certpublickey → CLUE_SYMCOR_CLIENT_CERT, as a temporary certificate-file path.
* secrets:symcor_cert_privatekey → CLUE_SYMCOR_CLIENT_KEY, as a temporary private-key-file path.

The existing wrapper implements this retrieval route. Uncertainty about automatic CD.yml environment injection does not block this task. Preserve the existing implementation rather than recreating it.

Execute:

1. Confirm repository identity and fetch the target branch. Record its latest full SHA and inspect changes since the existing implementation’s parent.
2. Preserve the original worktree, its commit, and its untracked target/ directory. Create or safely resume an isolated publication worktree at the latest target tip. Apply only the existing wrapper and test changes, preserving Muhammad’s changes. Do not touch fcrm_clue or overwrite an existing worktree.
3. Update assembly.xml so deployment shell scripts appear exactly once in the tar.gz with mode 0755. Use non-overlapping fileSets: exclude the selected shell scripts from the general fileSet and include them in a dedicated executable fileSet. Preserve archive paths and non-shell file permissions. Keep this change narrowly scoped.
4. Run Bash syntax checks, the runtime-secrets tests using the available Linux/WSL environment, the existing regression suite once, and the Maven package build. Windows-skipped POSIX tests do not count as passed. Use synthetic secrets and mocked Salt commands; do not retrieve live secrets.
5. Inspect the generated archive for executable shell permissions, LF line endings, matching wrapper content, and duplicate paths. Confirm no real secrets, local .env, wheels, or nested build outputs were introduced.
6. Commit only the intended wrapper, tests, and packaging changes. Stage explicit paths; do not stage target/ or unrelated files. Review the complete publication diff.
7. After validation passes, recheck the target remote SHA and perform a normal push to feature/edponbaord. If the remote advanced, incorporate its changes and rerun affected validation first. Verify the final remote SHA. Never force-push. Do not create, reopen, or merge a PR.

If a security control blocks an operation, report it without attempting a bypass. If a genuine code conflict or required validation failure prevents publication, preserve completed work and report the specific issue.

Return the base/final SHAs, changed files, actual test/build results, archive permission evidence, and push verification. Separately report AutoSys invocation and live server verification as pending where still unproven; do not invent the production command or treat clue_dev_run.sh’s pytest harness as that command.
