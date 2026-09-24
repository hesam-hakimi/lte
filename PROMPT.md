I choose Option 1: commit an intentionally LF-normalized canonical copy of
deploy/clue-bootstrap.sh, with durable Git line-ending enforcement.

This decision supersedes the earlier exact-CRLF-byte-copy requirement.

Rationale:
- the raw CRLF file fails `bash -n`;
- the generator already normalizes CRLF to LF before embedding the script;
- the previously generated and exercised deploy.md contained the LF-normalized body;
- therefore the LF representation is the operationally authoritative script.

Do not modify the original dirty worktree. Perform all changes only in the existing isolated worktree.

1. Reconfirm state before modifying anything

Verify:

- original worktree HEAD and file-status entries remain unchanged;
- isolated branch is:
  publish/clue-generator-isolated-20260924
- isolated branch is still exactly one commit above:
  origin/feature/clue-durable-core
- the remote destination still resolves to:
  2a2603fe34fc0ba4c5342e636bbcccaa1332d251

If any state differs, stop.

2. Create the canonical LF file in the isolated worktree

Read only the original untracked:

deploy/clue-bootstrap.sh

Create its LF-normalized equivalent at the same relative path in the isolated worktree.

The transformation must do exactly this:

- replace every CRLF pair with one LF;
- make no other byte or content change;
- preserve UTF-8 without adding a BOM;
- retain a final newline if the source has one.

Do not change the original file.

Prove that only line endings changed:

- report raw CRLF SHA-256 and normalized LF SHA-256;
- report raw and normalized byte sizes;
- report CRLF/LF counts;
- convert the normalized bytes back to CRLF in memory or a temporary file and confirm that the reconstructed SHA-256 equals the original raw SHA-256.

Do not print the complete script.

3. Enforce LF durably through Git

Inspect existing attributes using:

git check-attr text eol -- deploy/clue-bootstrap.sh

If an existing tracked rule already enforces LF, reuse it without changing `.gitattributes`.

Otherwise add the narrowest possible tracked rule:

deploy/clue-bootstrap.sh text eol=lf

Prefer this path-specific rule. Do not introduce a repository-wide wildcard rule unless existing repository conventions clearly require it.

Do not alter any unrelated `.gitattributes` entry.

4. Validate the normalized script before staging

Require:

- no CR bytes;
- LF line endings only;
- no UTF BOM;
- `bash -n deploy/clue-bootstrap.sh` passes;
- the earlier secret/release/TLS safety audit remains clean.

Also confirm the LF-normalized SHA-256 matches the bootstrap body digest produced by the generator for deploy.md. If it differs, stop and report both digests.

5. Run the focused tests before committing

Run:

python -m pytest tests/clue/test_generate_deploy_md.py -q -o addopts=""

Require exactly:

10 passed, 0 failed

If any test fails, stop without amending or pushing.

6. Amend the existing unpushed isolated commit

Stage only:

- deploy/clue-bootstrap.sh
- `.gitattributes`, only if the LF rule had to be added or updated

Stage the shell script with executable Git mode `100755`.

Inspect the staged diff and file modes before amending. No other file may be staged.

Amend the existing isolated commit with the message:

Track generic deployment guide generator and bootstrap source

This amend is allowed only because the isolated commit is local and has never been pushed.

7. Verify the amended commit

The amended commit must:

- have parent exactly:
  2a2603fe34fc0ba4c5342e636bbcccaa1332d251
- contain the following functional files:

  deploy/clue-bootstrap.sh
  tools/generate_deploy_md.py
  tests/clue/test_generate_deploy_md.py

- contain `.gitattributes` only if required for the path-specific LF rule;
- contain no other file;
- store `deploy/clue-bootstrap.sh` with mode `100755`;
- preserve the exact generator and test blobs from:
  fc07ec4409a5fb1142c6d1632cd5623779735450
- leave the isolated worktree clean.

Report the new commit SHA and full diffstat.

8. Prove clean-checkout behavior

Create a new disposable clean linked worktree at the amended commit.

In that clean checkout, verify:

- `git check-attr text eol -- deploy/clue-bootstrap.sh` reports LF enforcement;
- the script contains LF only and no CR;
- its SHA-256 equals the canonical normalized SHA-256;
- its Git mode is `100755`;
- `bash -n deploy/clue-bootstrap.sh` passes;
- the focused test command again reports 10 passed.

This clean-checkout validation is mandatory because the earlier false pass was caused by an untracked working-tree dependency.

Do not remove the main isolated worktree. A newly created disposable verification worktree may be removed only after confirming it is clean and recording all evidence.

9. Re-run committed-content safety checks

Scan the committed generator and bootstrap blobs for:

- embedded credentials or private material;
- release-specific URLs, filenames, commits or checksums;
- unsafe TLS bypasses;
- user-specific paths.

Do not print secret-like content.

10. Prove and publish the isolated range

The range:

2a2603fe34fc0ba4c5342e636bbcccaa1332d251..HEAD

must contain exactly one amended commit.

Immediately before pushing, confirm with `git ls-remote` that the remote branch still points to the recorded old tip.

Then perform only a normal fast-forward push:

git push origin HEAD:refs/heads/feature/clue-durable-core

Do not use force or force-with-lease.

Verify that the remote branch resolves exactly to the new amended commit SHA.

11. Final preservation checks

Confirm:

- original worktree HEAD is unchanged;
- its modified/deleted/untracked file entries are unchanged;
- nothing in it was staged, normalized, restored, cleaned or committed;
- no deploy.md, artifact, `.env`, handoff or unrelated file was added;
- no Nexus, provider, application PR #6 or deployment action occurred.

Return:

- raw CRLF and canonical LF metadata and SHA-256 values;
- round-trip CRLF reconstruction proof;
- effective `.gitattributes` rule;
- shell syntax results;
- focused tests before amend and from the clean checkout;
- amended commit SHA, parent, file list, modes and diffstat;
- one-commit push-range evidence;
- push result and final remote SHA;
- confirmation that the original worktree remained untouched.
