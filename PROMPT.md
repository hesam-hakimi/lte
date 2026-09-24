Independently verify and, only if every gate passes, publish the isolated deployment-tooling branch.

This is verification and remote durability only. Do not edit, amend, rebase, merge, reset, restore, clean or stash any file or commit.

Expected isolated branch:
feat/clue-deployment-bundle-tooling

Expected isolated commit:
8c4b5ad1dcf3e0d75c075b4d8076126ec53c287e

Expected parent/base:
26a397d3129aaf69b01742e6ddfd8da10b2fca99

Preserved dirty worktree:
C:\repos\fcrm_clue

Original dirty-worktree HEAD:
fc07ec4409a5fb1142c6d1632cd5623779735450

Existing backup:
C:\temp\clue-git-backup-20260924-105343

1. Verify identities

In read-only mode, report:

* all linked worktrees;
* isolated worktree path, branch and HEAD;
* isolated git status --porcelain=v2 --branch -uall;
* original worktree branch, HEAD and status;
* origin URL.

The isolated worktree must be clean and at the exact expected commit. If not, stop.

2. Verify ancestry and remote base

Fetch origin without changing either worktree.

Confirm:

* the isolated commit has exactly one parent;
* its parent is exactly the expected base;
* the range 26a397d3129aaf69b01742e6ddfd8da10b2fca99..HEAD contains exactly one commit;
* origin/feature/clue-durable-core still resolves to the expected base.

If the remote base moved, stop and report. Do not rebase.

3. Audit the commit directly

Use Git to report the complete changed-path list, statuses, modes and diffstat.

The commit may contain only the intended deployment-tooling group:

* maintained deployment/install shell scripts;
* sanitized configuration examples;
* deploy/requirements.lock.txt;
* deployment-bundle builder;
* wheelhouse-fetch script;
* narrow .gitignore changes;
* narrow .gitattributes changes.

It must not contain:

* .env or any credential file;
* workflows or the staged ci.yml deletion;
* deploy.md;
* generated bundles, archives, manifests or checksums;
* handoff documents;
* provider responses or diagnostic evidence;
* application-repository files;
* unrelated source or test changes.

The earlier task requested three sanitized configuration examples, while the summary visibly listed only two. Determine whether the remaining required configuration content was already tracked in the clean base under env_conf or another canonical path.

If a required configuration example is missing, supplied only by an untracked file, or ambiguously duplicated, stop without pushing.

4. Verify lock ownership and repository rules

Confirm from committed content that:

* maintained callers use deploy/requirements.lock.txt;
* no maintained caller silently depends on build/requirements.lock.txt;
* the canonical lock is tracked and not ignored;
* no git add -f dependency exists;
* generated delivery outputs are ignored narrowly;
* maintained scripts, configuration examples and the canonical lock remain visible to Git;
* shell scripts are LF-only, BOM-free and executable where appropriate;
* .gitattributes contains only justified line-ending rules and no unintended repository-wide renormalization.

5. Validate from a fresh clean checkout

Create a disposable detached worktree at the exact isolated commit. Do not copy any untracked file into it.

In that clean checkout:

* confirm the Git status is clean;
* run bash -n for every maintained shell script;
* identify and rerun the exact test command that produced the reported 10 passed;
* run any existing focused deployment/bundle tests;
* build the bundle into a temporary directory outside the repository;
* safely inspect the archive;
* verify the manifest and all checksums;
* confirm the expected 30-member result, or explain any evidence-backed difference;
* confirm deploy/requirements.lock.txt is included;
* confirm obsolete build/requirements.lock.txt is absent;
* prove that no untracked or ignored source file is required;
* confirm the validation leaves the clean checkout unchanged.

If any validation fails, stop without pushing.

6. Re-run committed-content safety checks

Inspect committed blobs for:

* credentials, tokens, passwords, keys or certificates;
* unsafe TLS bypasses;
* machine-specific paths;
* release-specific artifact URLs, filenames, IDs, commits or checksums;
* superseded test-artifact references.

Do not print secret-like values.

7. Reconfirm preservation of the original worktree

Using the existing export and backup evidence, verify read-only that the original worktree still has:

* the same HEAD;
* the same staged and unstaged patches;
* the same untracked inventory;
* matching hashes for the three scripts that were temporarily normalized;
* no new staged, restored, normalized or removed file.

If the final byte-preservation claim cannot be reproduced, stop.

8. Publish only the isolated branch

Check whether this remote branch already exists:

refs/heads/feat/clue-deployment-bundle-tooling

* If it does not exist and every gate passed, perform a normal push:
    git push -u origin feat/clue-deployment-bundle-tooling
* If it already resolves exactly to the expected isolated commit, report it as already durable.
* If it exists at any different SHA, stop.

Do not force-push.

After a successful push, verify with git ls-remote that the remote branch resolves exactly to:

8c4b5ad1dcf3e0d75c075b4d8076126ec53c287e

Do not create or merge a PR.

Return:

* worktree and repository identities;
* commit parent, complete file list, modes and diffstat;
* configuration-example reconciliation;
* lock-file and Git-rule verification;
* exact test commands and results;
* clean-checkout bundle evidence;
* original-worktree preservation evidence;
* push result and final remote SHA.
