Complete the isolated deployment-guide generator commit by making its required bootstrap source durable.

Important correction:
The earlier 10-test pass occurred in the original dirty worktree and depended on the untracked file:

deploy/clue-bootstrap.sh

The clean isolated worktree correctly exposed this missing tracked dependency:
7 tests passed and 3 failed with FileNotFoundError.

The isolated branch and worktree already exist locally and have not been pushed.
Reuse them. Do not create another branch or worktree unless the recorded ones are missing or inconsistent.

Safety rules:

- Do not modify the original dirty worktree.
- Do not read, print, copy, stage or expose `.env` or any credential file.
- Do not add the entire `deploy/` directory.
- Do not add `deploy.md`.
- Do not stage unrelated files.
- Do not reset, rebase, clean or stash the original worktree.
- Do not push until every gate below passes.
- Do not use force-push.

1. Reconfirm the current state

Original worktree:
- HEAD must still be:
  fc07ec4409a5fb1142c6d1632cd5623779735450
- capture `git status --porcelain=v1` without modifying anything.

Isolated worktree:
- expected worktree name/path includes:
  fcrm_clue-publish-isolated
- expected branch:
  publish/clue-generator-isolated-20260924
- it must contain exactly one local commit above:
  origin/feature/clue-durable-core
- it must currently be clean.

Fetch origin and confirm the remote destination branch still resolves to:

2a2603fe34fc0ba4c5342e636bbcccaa1332d251

If any identity or ancestry differs, stop and report.

2. Confirm the dependency contract

Inspect, without editing:

- tools/generate_deploy_md.py
- tests/clue/test_generate_deploy_md.py

Confirm that `deploy/clue-bootstrap.sh` is an intentional runtime/source dependency and that the tests require its maintained content to remain byte-consistent with the bootstrap heredoc.

Also run:

git log --all --oneline -- deploy/clue-bootstrap.sh
git check-ignore -v deploy/clue-bootstrap.sh

Confirm whether it has ever been tracked and whether any ignore rule applies.

3. Audit the original untracked bootstrap file

Inspect only this exact source file from the original worktree:

deploy/clue-bootstrap.sh

Do not inspect or copy other untracked files from `deploy/`.

Report only safe metadata:

- regular file versus symlink;
- byte size;
- line count;
- SHA-256;
- line-ending type;
- whether a UTF BOM is present;
- shell syntax result from `bash -n`.

Review it for:

- embedded credentials, tokens, passwords, certificates or private keys;
- release-specific URLs, filenames, commit IDs or SHA-256 values;
- `f676277`;
- `a516a21`;
- `a6f3ba4`;
- `rp.td.com`;
- `1138cb0e`;
- `8c083149`;
- `10e6134e`;
- user-specific Windows paths;
- unsafe TLS bypasses such as `-k`, `--insecure` or disabled certificate validation;
- unexpected logging of secrets;
- commands unrelated to the bounded bootstrap/install flow.

Do not print secret-like values or the complete file content.

If any secret, release-specific identity, unsafe TLS bypass, unexplained local path or unrelated operation is found, stop without copying or committing the file.

4. Add only the audited bootstrap source

If the audit passes, copy the exact bytes of:

deploy/clue-bootstrap.sh

from the original worktree into the same relative path in the isolated worktree.

Do not copy the directory recursively.

Because this is an executable deployment script, inspect repository shell-script mode conventions and stage it as executable mode `100755`, unless tracked repository evidence explicitly requires another mode.

Before committing, confirm:

- the source and destination SHA-256 values are identical;
- no CRLF conversion or BOM was introduced;
- `bash -n deploy/clue-bootstrap.sh` passes;
- `git status --short` in the isolated worktree shows only the expected new bootstrap file.

5. Re-run the focused tests before amending

Run in the isolated worktree:

python -m pytest tests/clue/test_generate_deploy_md.py -q -o addopts=""

Require exactly 10 passed and zero failures.

If any test still fails, stop and report the complete failure summary without amending or pushing.

6. Amend the unpushed isolated commit

The isolated commit is local-only, so amend it into one coherent commit containing the bootstrap source, generator and tests.

Stage only:

deploy/clue-bootstrap.sh

Inspect the cached diff before amending. It must contain only that file.

Amend the existing isolated commit with a clear message such as:

Track generic deployment guide generator and bootstrap source

Do not amend or rewrite the original dirty branch.

7. Verify the final amended commit

The final isolated commit must:

- have parent exactly:
  2a2603fe34fc0ba4c5342e636bbcccaa1332d251
- contain exactly these three added files:

  deploy/clue-bootstrap.sh
  tools/generate_deploy_md.py
  tests/clue/test_generate_deploy_md.py

- contain no other file;
- store `deploy/clue-bootstrap.sh` with mode `100755`;
- preserve the exact generator and test blobs from:
  fc07ec4409a5fb1142c6d1632cd5623779735450
- preserve bootstrap content identical to the audited source file;
- leave the isolated worktree clean.

Re-run after the amend:

bash -n deploy/clue-bootstrap.sh
python -m pytest tests/clue/test_generate_deploy_md.py -q -o addopts=""

Require 10 passed again.

Repeat the release-specific and unsafe-TLS scans against the committed blobs, not merely the working-tree files.

8. Prove the proposed push is isolated

The range:

2a2603fe34fc0ba4c5342e636bbcccaa1332d251..HEAD

must contain exactly one commit.

Report its new SHA, parent, complete file list, modes and diffstat.

Immediately before pushing, verify with `git ls-remote` that the remote destination branch still points to:

2a2603fe34fc0ba4c5342e636bbcccaa1332d251

If it moved, stop.

9. Publish normally

Only if every gate passes:

git push origin HEAD:refs/heads/feature/clue-durable-core

Do not use `--force` or `--force-with-lease`.

Verify with `git ls-remote` that the remote branch now resolves exactly to the new amended isolated commit SHA.

10. Preserve both local worktrees

Do not delete the isolated worktree or either local branch in this task.

Verify that the original worktree:

- retains its original HEAD;
- has the same modified/deleted/untracked file entries;
- has no newly staged files;
- was not reset, restored, cleaned, stashed or committed.

Its ahead/behind relationship may change after the clean remote push. Do not reconcile it here.

Do not build or upload artifacts, modify Nexus, generate or commit deploy.md, call providers, create or merge a PR, or touch application PR #6.

Return:

- dependency-contract conclusion;
- bootstrap provenance and safe audit summary;
- original and copied bootstrap SHA-256 values;
- shell syntax result;
- focused tests before and after amend;
- final isolated commit SHA, parent, files, modes and diffstat;
- one-commit push-range proof;
- push result and final remote SHA;
- proof that the original worktree remained untouched.
