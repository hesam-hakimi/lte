Finalize, commit, push and open the CLUE deployment Pull Request.

Authorization:
- The GitHub token is stored locally in the repository .env file.
- Use it only for this push and PR operation.
- Never print, echo, log, display or include the token in a command-line URL.
- Never commit the .env file.
- Do not persist the token in Git configuration or a remote URL.
- Disable command tracing before reading it.
- Unset the token from the process environment when finished.

Do not deploy, publish to Nexus, call Salt/HKV, AutoSys, Symcor or Tungsten.
Do not push directly to main/master and do not force-push.

1. Repository and remote safety

Run:

git status --short --untracked-files=all
git diff --name-status
git diff --check
git branch --show-current
git remote get-url origin
git remote show origin

Confirm that origin is a GitHub or GitHub Enterprise remote before using
the GitHub token. If it is Bitbucket or another provider, stop and report
the remote host; do not try the GitHub token against it.

Identify the repository's established PR target branch from the remote
default branch and existing conventions. Do not guess if it is ambiguous.

2. Protect the .env file

Preserve all existing .gitignore content and ensure these rules exist:

.env
.env.*
!.env.example

Then verify:

git check-ignore -v .env
git ls-files --error-unmatch .env
git log --all -- .env

Expected:
- git check-ignore confirms .env is ignored.
- .env is not tracked.
- .env has never been committed.

If .env is merely staged but has never been committed, remove it from the
index while preserving the local file, then verify it is ignored.

If .env or its token was committed in any Git history, STOP:
- do not push;
- do not expose the token;
- report that the token must be revoked/rotated before proceeding.

Do not add .env.example if it contains a real credential.

3. Validate the intended PR scope

The PR should contain only the intended CLUE deployment source,
documentation and tests, including as applicable:

- .gitignore
- deploy/clue-deploy.sh
- deploy/clue-prepare-host.sh
- deploy/clue_with_runtime_secrets.sh
- tools/build_deployment_bundle.py
- tests/clue/test_clue_deploy_dry_run.py
- tests/clue/test_runtime_secrets_wrapper.py
- docs/handoff/clue/deploy/CLUE_OPERATIONAL_DEPLOYMENT.md
- docs/handoff/clue/deploy/CLUE_DEPLOYMENT_ENGINEERING_REFERENCE.md
- the intentional removal, rename or short redirect of
  CLUE_DEPLOYMENT_RUNBOOK.md

Do not include:

- .env or other local environment files
- PEM, key, P12, JKS or credential files
- deployment archives, SHA sidecars or handoff directories
- test captures, scratch files or temporary harnesses
- unrelated files belonging to another session

If unrelated changes cannot be isolated safely, stop and report them.

4. Re-run final verification

Run the relevant repository commands for:

- bash -n on all four deployment shell scripts
- tests/clue/test_runtime_secrets_wrapper.py
- tests/clue/test_clue_deploy_dry_run.py
- deployment-document generation tests, if present
- git diff --check

Confirm that the established results remain:

- runtime-wrapper tests: 14/14 on POSIX;
- deployment dry-run tests: 26/26;
- AutoSys/Salt runtime contract: PASS;
- no secret values or credential files are included.

Do not perform a real Salt/HKV call.

5. Prepare the feature branch

If the current branch is main or master, create:

feature/clue-operational-deployment

If already on an appropriate feature branch, keep that branch.

If the requested branch already exists with different work, stop rather
than overwriting it.

Fetch remote state without merging, rebasing or changing files:

git fetch origin

If the branch has unexpected divergence or conflicts with its intended
PR base, stop and report the exact divergence. Do not rebase, merge or
force-push automatically.

6. Stage and inspect

Stage only the intended files by explicit path. Do not use:

git add .
git add -A

After staging, run:

git diff --cached --name-status
git diff --cached --check

Perform a staged-content secret scan without printing matching secret
values. Report only filenames and rule names if anything suspicious is
found.

Verify again that .env and all build artifacts are absent from the index.

7. Commit

Create one commit with:

feat(clue): add operational deployment and Salt runtime wrapper

Record the resulting commit SHA and confirm the source worktree is clean,
excluding ignored local files.

8. Build a clean release candidate

Rebuild the deployment bundle from the new commit.

Requirements:

- the Release ID must be based on the new commit;
- it must not contain a ".dirty." suffix;
- generated archives and handoff files must remain outside Git;
- rerun outer/internal checksums, archive safety, shell syntax,
  runtime-wrapper tests and deployment dry-run tests;
- do not pretend to run unavailable Linux CPython 3.12 tests.

Report these as DEFERRED:

- clean-room offline installation on Linux CPython 3.12;
- missing-wheel negative test;
- real TCLUE999DEVS AutoSys/Salt entitlement validation.

If rebuilding changes a tracked source file, stop and report it instead
of creating another automatic commit.

9. Authenticate safely

Read only GH_TOKEN or GITHUB_TOKEN from .env without printing its value.

If both exist and differ, stop and report only the variable names.

Determine the GitHub hostname from origin. Use the token as an ephemeral
process environment variable for the GitHub CLI. Do not:

- place it in the remote URL;
- save it in plaintext credentials;
- run commands with tracing enabled;
- print the environment;
- display the .env file.

Verify authentication using the appropriate GitHub/GitHub Enterprise
hostname without exposing the token.

10. Push

Push the feature branch normally:

git push -u origin <feature-branch>

Never use --force or --force-with-lease.

11. Create the Pull Request

Use the repository's established PR base branch.

PR title:

CLUE: operational deployment and AutoSys/Salt runtime secrets

PR description:

## Summary

- Adds the administrator host-preparation script.
- Adds the offline deployment bundle and dependency wheelhouse.
- Adds the concise Operational Deployment guide.
- Adds the separate Deployment Engineering Reference.
- Packages the AutoSys runtime wrapper for TCLUE999DEVS.
- Retrieves the four approved secrets using narrowly scoped
  `sudo -n salt-call pillar.get`.
- Adds provenance handling for all bundle inputs.

## Verified

- AutoSys/Salt runtime contract: PASS.
- Runtime-wrapper tests: 14/14 on POSIX.
- Deployment dry-run tests: 26/26.
- Bundle checksums and archive/member safety: PASS.
- No secret values, .env files or credential material are packaged.

## Deferred environment validation

- Clean-room offline installation on Linux CPython 3.12.
- Missing-wheel negative test.
- Real TCLUE999DEVS AutoSys/Salt entitlement validation.

## External prerequisites

- Narrowly scoped NOPASSWD authorization for the four approved
  Salt pillar names.
- Placement of the non-secret runtime configuration.
- AutoSys job definition and execution under TCLUE999DEVS.

Do not attach the old dirty archive to the PR.

12. Final report

Return:

- branch name;
- commit SHA;
- clean Release ID and SHA-256;
- exact committed file list;
- pushed remote branch;
- PR URL;
- tests passed and deferred;
- confirmation that .env is ignored and untracked;
- confirmation that the token was never printed, committed or stored in
  the remote URL;
- confirmation that no deployment or provider call occurred.

Finally remove GH_TOKEN/GITHUB_TOKEN from the current process environment.
