Clean up the Git changes in the CLUE repository currently open in VS Code. Execute the reversible cleanup; do not stop at a plan. Use English for all output, comments, and documentation. Work from Git and filesystem evidence, without screenshots or OCR.

The screenshots showed one staged deletion, .github/workflows/ci.yml, and approximately 110 unstaged changes, many marked Untracked. They included new workflows, packaging files, deployment scripts, handoff documents, delivery evidence, and built release archives. Recheck the current state; these counts are not authoritative.

1. Confirm the workspace and preserve work.

* Identify the actual VS Code repository using git rev-parse –show-toplevel and confirm the current branch. Do not confuse it with an isolated C:\temp\clue-src-* build checkout.
* Read applicable AGENTS.md instructions and the latest relevant local CLUE handoff/deployment notes. Check whether a merge, rebase, cherry-pick, unresolved conflict, or another process writing to this checkout is active. Do not alter its index or files; finish the current operation through its existing workflow first, or report the exact blocker.
* Before mutations, save the branch, HEAD, status, and separate binary-safe staged and unstaged patches to a private local folder outside the repository. Preserve copies and hashes of any untracked files you will change or move. Do not print patch contents that may contain secrets. Use Git’s –output option or binary-safe APIs for patch capture.
* Preserve partial staging and pre-existing user edits. Do not run Discard All Changes, git reset –hard, destructive git clean, blanket checkout/restore, git rm -r –cached ., or recursive deletion.

2. Inspect and classify the actual files.

Use git status –porcelain=v1 -uall, git diff –name-status, git diff –cached –name-status, and git ls-files –others –exclude-standard. Read relevant diffs and references locally.

Classify each changed path as:

* Intentional source/configuration/test/CI/documentation change to keep visible.
* Generated build output, runtime evidence, cache, or release package to exclude from source control.
* Machine-specific configuration or credentials to keep private locally.
* Uncertain: preserve and report for review.

Untracked does not mean disposable. Do not classify by extension alone.

3. Apply a minimal cleanup.

* Inspect delivery/clue-dev-deployment-2026-09-23 and the actual delivery upload/package directories. Compare scripts and documentation there with deploy/, tools/, and docs/handoff/clue/. Use content comparisons and references, not filenames alone.
* Keep canonical deployment/build scripts, required configuration templates, tests, packaging files, and handoff documents. Preserve any unique edits in delivery copies. Do not delete duplicates or redesign the deployment process in this task.
* Keep generated logs, evidence, archives, checksums, and generated package manifests on disk. Ignore only verified output paths after confirming they contain no unique source or required evidence intended for version control. Do not move anything still referenced by scripts or runbooks.
* Update the existing .gitignore minimally for shared generated outputs. Use the repository-local Git exclude file for personal scratch files. Preserve existing rules and edits.
* Do not blanket-ignore delivery/, deploy/, tools/, .github/, documentation folders, or extensions such as *.txt, *.json, *.yml, *.yaml, *.sh, and *.conf. Preserve sanitized .env.example and configuration templates.
* If generated files were accidentally staged, unstage only those explicit paths with git restore –staged – , without –worktree. This changes the index while preserving working files.
* .gitignore does not stop tracking files already committed. Report such cases separately; do not remove them from version control merely to reduce the change count.
* Keep real .env files, credentials, and private key material out of staging. Do not display their values, upload them, modify working credentials, or rewrite Git history.

4. Review the CI deletion explicitly.

Inspect .github/workflows/ci.yml and the new workflows together. If local evidence establishes an intentional replacement, preserve that decision. If deletion intent is unclear, unstage only that deletion while leaving the working-tree state unchanged, and flag it for review. Do not silently restore the old workflow, discard new workflows, or activate duplicate pipelines.

5. Verify and report.

* Check the ignore rules against both representative output paths and required source/template paths using git check-ignore, with –no-index where necessary for rule testing.
* Verify preserved files against the baseline and confirm that unstaging did not overwrite working content.
* Review the final staged and unstaged diffs, run git diff –check and git diff –cached –check, and report actual outcomes. For ignore-only cleanup, do not rerun the full test suite. If required source changes occur, use only relevant existing checks.
* Do not commit, push, merge, rebase, publish to Nexus, or stage all files.
* Report before/after staged, unstaged, and untracked counts separately, noting possible overlap; list the ignore rules changed, preserved source groups, any paths unstaged or moved, the CI decision, unresolved items, and the backup location with recovery instructions.
* Put the report in this chat; do not generate another report file inside the repository.

The goal is to remove generated-file noise while preserving all meaningful work. Legitimate uncommitted changes should remain visible. Do not force an empty Source Control view.
