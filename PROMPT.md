Preserve the current DEV rehearsal exactly as it is. Do not rebuild,
reinstall, retry, clean up, or modify any source or installed script.

The core deployment succeeded. Reconcile only the two remaining
acceptance findings using read-only evidence.

1. SECOND_RUN_FILESYSTEM_CHANGED

Produce the exact changed-path manifest that caused this result. For
every changed path include:

- absolute path
- created, removed, or modified
- file type
- owner/group/mode
- size and mtime
- SHA-256 where applicable
- which command created or modified it, based on the execution timeline

Separate the paths into:

- deployment product state
- deployment logs
- validation/fixture-smoke artifacts
- test-harness artifacts

Do not merely state that validation caused the changes; prove it using
the exact path list and timestamps.

2. Controlled idempotency check

After all previous validation commands have finished, take a fresh
baseline snapshot of the complete isolated rehearsal root.

Run the exact same `release` command one additional time as
`tclue999devs`, without running any fixture-smoke or validation command
during the before/after window.

Take an immediate after-snapshot and report separately:

- release/current/config/venv changes
- log changes
- work or fixture changes
- any other changes

Do not exclude paths silently. If only expected logging changes, state
that explicitly and cite the documented contract.

3. Status exit-code contract

Run `status` once and capture exact stdout, stderr, and exit code.

Read the packaged `clue-deploy.sh` implementation and both packaged
deployment guides to determine whether an active healthy first release
with no previous rollback target is documented to return exit 0 or
exit 1.

Do not patch it on DEV.

4. Final reconciliation

Report one of:

- PRIVILEGED_RUNTIME_REHEARSAL_PASS
- PASS_WITH_STATUS_CONTRACT_ISSUE
- FAILED

The verdict must distinguish an actual deployment mutation from a test
harness artifact. Preserve all evidence and perform no cleanup.
