Commit and push the CLUE code changes completed in this workspace. This instruction authorizes the commit and push; proceed without another routine confirmation.

1. Read the repository instructions and current local handoff. Inspect the repository root, Git status, current branch, configured remotes, and diff. Use the existing project repository and established remote; do not guess or create a new repository.
2. Include the completed implementation changes, relevant tests, and sanitized project documentation. Review both tracked and untracked files, and stage specific files deliberately. Preserve unrelated or unfinished work.
3. Do not commit credentials, .env files, JKS/keystores, private keys, certificate bundles, authentication tokens, real input workbooks, cheque images, provider request/response captures, OCR outputs, or logs containing customer information. Check the staged diff and any existing unpushed commits for these materials without printing sensitive values. Keep safe configuration examples with placeholders.
4. Preserve the current live-execution guard and accepted input/output contract. Do not change matching rules, call Symcor or Tungsten, retrieve images, run OCR, rerun the batch, or regenerate delivered outputs as part of this task.
5. Run the relevant lightweight offline validation and any mandatory repository checks. Reuse existing test evidence where applicable and clearly distinguish previous results from checks run now. Avoid an unnecessary full test-suite rerun.
6. Commit the reviewed changes with a clear message describing the actual work. Use the current feature branch. If the checkout is on main/master, a protected branch, or detached HEAD, create a descriptive feature branch first.
7. Fetch the remote state and push normally, setting the upstream if needed. Do not force-push, rewrite published history, merge into main, or discard local work. If remote divergence or authentication prevents a safe push, preserve the work and report the exact blocker without exposing credentials.
8. Verify that the remote branch points to the pushed local HEAD.

Return:

* Repository and branch.
* Commit SHA and brief change summary.
* Validation actually performed and results.
* Push result and remote verification.
* Files intentionally left uncommitted and why, without sensitive contents.

Do the work, not just provide Git commands. Report success only after the push and remote verification complete.
