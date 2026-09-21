Continue the existing CLUE project. Check in the latest completed CLUE work, then transfer it to the destination repository and publish a reviewable pull request.

Destination repository:
https://github.com/TD-Universe/W001CLUEinitialRepo

This instruction authorizes the scoped source commits, destination branch creation and push, and PR creation. It supersedes earlier documentation-only or “no commit/push” restrictions for this task. Complete the work rather than stopping at a plan or repeatedly requesting routine confirmation.

All responses, code comments, documentation and PR text must be in English. Use native filesystem, Git and authenticated repository tools; no screenshots, OCR or browser automation.

1. Inspect the actual source and destination

The previously used source repository is C:\repos\fcrm_clue. Verify its actual location, current branch, HEAD, remotes and staged/unstaged/untracked changes.

Read applicable AGENTS.md instructions, the latest local CLUE handoff and current task register. Reconcile newer evidence forward. Do not reset to a historical checkpoint.

Identify completed CLUE changes, unfinished work and changes owned by another active session. Preserve unrelated staging, including the previously reported .github/workflows/ci.yml deletion unless its ownership and inclusion are explicitly established.

Verify access to the exact destination repository, its default branch, existing files, repository instructions and required checks. Do not assume it is empty or that access mentioned in a chat is effective write access.

2. Prepare and commit the latest CLUE work

Review the actual changes and include the completed application code, tests, required configuration templates, reusable tools and current handoff documentation.

Use explicit staging or an isolated index so unrelated staged changes cannot enter the commit. Preserve all unrelated working-tree and index state. Do not use a blanket git add, destructive cleanup, stash or reset.

Inspect the content to be committed and transferred for secrets and sensitive data. Exclude:

* .env files and real credential values.
* JKS/P12/PFX stores, private keys and exported runtime identity material.
* Raw customer data, cheque images and sensitive provider captures.
* Virtual environments, caches, local runtime outputs and unrelated generated files.

Retain safe placeholder configuration examples and synthetic test fixtures. Preserve excluded runtime files locally. Do not rewrite repository history or expose secret values in reports.

Commit the reviewed CLUE changes in the source repository. Record the resulting source commit SHA and the exact scope. Existing unresolved PAT connectivity does not prevent committing the current development state; document that limitation accurately.

3. Import into a separate destination checkout

Use a separate checkout of the destination repository. Reuse an existing checkout only after confirming its remote and preserving any local work.

Create a descriptive import branch from the current destination default branch, such as feature/clue-import-YYYYMMDD. Use the actual date and avoid taking over another person’s branch.

Import a reviewed snapshot of the recorded source commit. Preserve destination history and required destination files. Do not push the source repository’s entire history, use –mirror, force-push, or copy .git directories.

Inspect overlapping paths before changing them. Reconcile application files with the destination’s layout and instructions. Preserve required workflows and repository configuration; make only adaptations necessary for the import.

Record the source repository, branch and commit as import provenance. List intentional adaptations and exclusions. Keep existing source remotes intact and publish this transfer only to the specified destination.

4. Verify the transferred result

Compare the destination content with the intended source snapshot and confirm that all required application files, tests, dependencies and safe configuration templates are present.

Use the existing documented validation commands and run the focused checks necessary for the import, plus required repository checks. Reuse valid prior evidence where applicable and identify its scope and revision.

Do not rerun unrelated acceptance suites, rebuild simulators or make live provider calls merely to publish this code. Do not disable hooks, required checks or repository protections.

Preserve the current qualified status:

* Client-certificate transmission was demonstrated locally.
* Successful TLS/HTTP/SOAP access to PenHub PAT remains unverified.
* PenHub receiving the configured certificate remains unconfirmed.
* TDBBASIC exists in prior documentation; its PAT applicability requires confirmation.
* componentName is caller-chosen under the reviewed contract, subject to any documented PAT-specific rules.

Do not describe the imported code as production-ready or live integration as complete.

5. Commit, push and open the PR

Commit the destination import, verify the push target, and push the new branch using existing authorized credentials.

Open a draft PR against the destination’s actual default branch. If this task already has a matching branch or PR, update it safely instead of creating duplicates. Do not merge the PR.

The PR description must explain:

* Why the CLUE implementation is being imported.
* The source commit and included functionality.
* Any destination-specific adaptations.
* What validation actually ran and its results.
* Remaining integration and environment limitations.

Use a structured PR body or a UTF-8 body file to preserve formatting.

If authentication, permissions or a repository rule blocks publication, complete the safe local preparation and report the exact blocking operation and error. Do not bypass the control or claim publication succeeded.

6. Finish with a concrete handoff

Record the migration outcome in the existing handoff structure without inventing future commit hashes or creating competing “latest” documents.

Return:

* Source repository, branch and committed SHA.
* Destination checkout, branch and final commit SHA.
* Push outcome and PR URL.
* Validation performed and results.
* Any excluded or still-uncommitted work and its reason.
* Remaining access, ownership or integration blockers.

Confirm success only from actual Git and repository responses. Preserve the original working copy and all unrelated work.
