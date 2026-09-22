Continue the active CLUE checkout. The user authorizes completing the remaining changes, pushing them, and merging the feature PR when repository requirements are satisfied. All responses and artifacts must be in English.

1. Read the repository instructions and latest handoff. Confirm the actual repository, branch, remote, working-tree changes, and existing PR. Reuse the current feature branch and PR. Preserve unrelated work.

2. Review and commit the relevant completed CLUE changes, including deployment scripts, the DEV Tungsten CA-bundle configuration, configuration examples, and CADP handoff. Stage explicit files. Exclude credentials, real .env files, private keys, keystores, live provider captures, cheque images, and generated outputs.

3. Preserve the verified behavior:
   - TLS and hostname verification remain enabled.
   - DEV can use /etc/pki/tls/certs/ca-bundle.crt for Tungsten, with the documented override and readability check.
   - Keep the declared Python >=3.10 requirement. The successful Python 3.9 execution does not establish general support.
   - Describe the successful live test accurately: one-row Symcor search, two images, Tungsten processing, and CSV/JSON/XLSX output.
   - Keep positive OCR accuracy, provider-confirmed image-side ordering, and full live Credit-path validation explicitly unverified.

4. Verify the final candidate commit using the repository’s required gates and relevant focused checks. Investigate the previously reported flaky TLS test if it affects the gate; do not disable, skip, or weaken it to obtain a pass. Include any genuinely required test dependency in the appropriate dependency declaration. Do not make new live provider calls solely for this merge.

5. Push normally and verify the remote SHA. Create or update the PR against the repository’s established target branch. Describe the changes, validation, and remaining limitations clearly. Do not invent the target branch or claim production readiness.

6. Inspect required CI checks, review approvals, unresolved review threads, and mergeability for the latest PR commit. Resolve routine conflicts while preserving intended behavior, then rerun affected checks. Do not bypass branch protection, dismiss required reviews, self-approve, force-push, or use administrator overrides.

7. When all requirements are satisfied, merge using the repository’s permitted merge method. The user has already authorized this action; do not ask again. If required approval or a failing check prevents merging, complete all available preparation and report the exact blocker. Do not report a queued or pending merge as completed.

8. Return a concise receipt:
   - PR URL and target branch
   - Final source commit
   - Checks and approval status
   - Merged / blocked status
   - Merge commit SHA, if merged
   - Remaining validation and deployment work

Do not deploy, activate scheduled jobs, or change shared infrastructure as part of this merge.
