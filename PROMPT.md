Extract the pending deployment-bundle tooling into a clean, independently reviewable branch.

Do not modify, stash, reset, clean, switch, commit or otherwise mutate the preserved dirty worktree at:

C:\repos\fcrm_clue

Do not merge or cherry-pick the obsolete local commit:

fc07ec4409a5fb1142c6d1632cd5623779735450

It contributes no required content beyond the clean remote commit and carries unwanted divergent history.

Authoritative base:

origin/feature/clue-durable-core
26a397d3129aaf69b01742e6ddfd8da10b2fca99

1. Preserve the dirty source state

Confirm the existing backup:

C:\temp\clue-git-backup-20260924-105343

Create a second timestamped, private, byte-preserving export outside the repository containing:

- branch and HEAD;
- porcelain status;
- staged and unstaged binary-safe patches;
- untracked-path inventory;
- byte-exact copies and SHA-256 values for only the source files selected below.

Do not copy `.env`, credentials, artifacts, archives, provider responses or secret material.

2. Verify the clean base

Fetch origin and confirm the remote branch still resolves exactly to:

26a397d3129aaf69b01742e6ddfd8da10b2fca99

If it moved, stop and report.

Create a new clean linked worktree and branch from that exact commit.

Suggested branch:

feat/clue-deployment-bundle-tooling

If the branch or proposed worktree path already exists, stop rather than deleting or overwriting it.

3. Reconcile the deployment-tooling group

Using the exact paths from the completed read-only audit, inspect and selectively reproduce only the deployment-tooling group:

- the maintained deployment/install shell script;
- the three sanitized configuration examples;
- the maintained deployment-bundle builder;
- the maintained wheelhouse-fetch script;
- the narrow generated-delivery ignore rules;
- the required dependency lock;
- directly associated focused tests, if present.

Do not copy directories recursively or select files by basename alone.

Before copying each file:

- compare it with the clean base;
- establish its purpose and callers;
- record source and destination SHA-256 values;
- skip files already identical to the clean base;
- stop on ambiguous duplicate implementations.

Do not include:

- deploy.md;
- generated delivery directories;
- tar.gz, checksum or manifest outputs;
- Nexus evidence;
- runtime reports;
- `.env`;
- handoff documents;
- workflows;
- Symcor diagnostic probes;
- application-repository files.

`deploy.md` remains generated, artifact-specific output and must not be committed.

4. Fix the lock-file ownership

Search all tracked and selected pending source for references to:

requirements.lock.txt

Use this canonical tracked location:

deploy/requirements.lock.txt

If the only current source is under `build/`, copy its exact dependency content to the canonical tracked location and update all maintained callers to use the canonical path.

Requirements:

- the canonical lock must not be ignored;
- do not use `git add -f`;
- do not create a `.gitignore` exception for a generated `build/` directory;
- package construction must include the canonical lock;
- a clean checkout must be able to build without an untracked file;
- no caller may continue silently depending on `build/requirements.lock.txt`.

If repository evidence requires a different canonical tracked location, stop and report before implementing it.

5. Apply line-ending policy without rewriting unrelated files

Preserve the existing `.gitattributes` rule for `deploy/clue-bootstrap.sh`.

Add durable rules, if not already effective:

*.sh text eol=lf
*.md text

Do not run repository-wide renormalization and do not modify existing handoff documents in this branch.

All selected shell scripts must:

- contain LF only;
- have no UTF-8 BOM;
- pass `bash -n`;
- use Git mode `100755` when executable.

6. Review `.gitignore` narrowly

Bring over only the verified generated-delivery/output rules required by this tooling.

Do not blanket-ignore:

- deploy/;
- tools/;
- config examples;
- lock files;
- shell scripts;
- YAML/JSON/TXT files;
- documentation.

Verify with `git check-ignore` that:

- representative generated delivery outputs are ignored;
- every maintained script, template and `deploy/requirements.lock.txt` remains visible.

7. Security and release-independence checks

Inspect the selected committed candidates for:

- credentials, tokens, passwords, private keys or certificates;
- unsafe TLS bypasses;
- machine-specific paths;
- hardcoded release URLs, artifact filenames, checksums or commit IDs;
- references to the superseded test artifacts.

Configuration examples must contain placeholders only.

Do not print secret-like values.

8. Validate from the clean worktree

Run:

- `bash -n` for every selected shell script;
- existing focused deployment/bundle tests;
- bundle construction into a temporary directory outside the repository;
- safe archive inspection;
- manifest/member/checksum verification;
- a check proving the canonical lock is included;
- a check proving no untracked source file is required.

Do not access Nexus, providers or external endpoints.

Do not publish or deploy the generated validation bundle.

9. Review the exact proposed commit

The branch must contain only deployment-tooling changes.

Report:

- complete file list and modes;
- diffstat;
- canonical lock references before and after;
- `.gitignore` and `.gitattributes` changes;
- syntax and focused test results;
- temporary bundle validation result;
- any remaining ambiguity.

Commit locally with a focused message only if all checks pass, for example:

feat(deploy): make bundle tooling reproducible from a clean checkout

Do not push or create a PR in this task.

10. Final preservation proof

Confirm the original dirty worktree has:

- identical HEAD;
- identical staged, unstaged and untracked entries;
- no files changed, staged, normalized or removed.

Do not touch workflows, the staged `ci.yml` deletion, documentation branches,
Symcor diagnostics, Nexus, artifacts, PR #6 or W001CLUEinitialRepo.
