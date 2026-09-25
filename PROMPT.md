Prepare the CLUE deployment changes for commit, push and Pull Request.

Safety rules:
- Do not push directly to main/master.
- Do not force-push.
- Do not deploy, publish to Nexus, call Salt/HKV, AutoSys, Symcor or Tungsten.
- Do not commit archives, handoff folders, .env files, PEM/key files,
  credentials, temporary files or generated test output.
- Stage files explicitly; do not use "git add .".
- Preserve unrelated changes from other sessions.

1. Accept and inspect the current changes:

   git status --short --untracked-files=all
   git diff --name-status
   git diff --check

2. Verify that the intended PR contains only the CLUE deployment work:

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

   If any unrelated tracked or untracked file would be included, stop and
   report it instead of staging it.

3. Re-run the focused verification:

   - bash -n on every deployment shell script
   - runtime-wrapper tests
   - deployment dry-run tests
   - deployment-document generation tests, if present
   - git diff --check

4. Confirm that no secret value, .env file, certificate, private key,
   deployment archive or handoff directory is staged.

5. Confirm the current branch is a feature branch. If currently on main or
   master, create a new feature branch named:

   feature/clue-operational-deployment

   If that name already exists, report the existing branch and do not
   overwrite it.

6. Stage only the intended source, test and documentation files explicitly.

7. Create one commit:

   feat(clue): add operational deployment and Salt runtime wrapper

8. Confirm the worktree state and record the new commit SHA.

9. Rebuild the deployment bundle from that committed source so the new
   release ID is clean and does not contain a ".dirty." suffix.

   Keep the generated archive and handoff files outside Git.
   Re-run the checksum, archive-safety, wrapper and dry-run validations.
   Do not run the two deferred Linux CPython 3.12 tests.

10. Fetch the remote without merging or rebasing:

    git fetch origin

    Report whether the feature branch has unexpected divergence from its
    intended PR base. Do not guess the PR base if repository configuration
    and existing PR conventions do not identify it.

11. Push the feature branch normally:

    git push -u origin <feature-branch>

12. Create a Pull Request using the repository's established target branch
    and PR mechanism. If automatic PR creation is unavailable, provide the
    exact branch names and URL/instructions needed to open it manually.

PR title:

CLUE: operational deployment and AutoSys/Salt runtime secrets

PR description must include:

Summary
- Adds the administrator host-preparation script.
- Adds the offline deployment bundle and dependency-wheel mechanism.
- Adds the operator guide and separate engineering reference.
- Packages the AutoSys runtime wrapper for TCLUE999DEVS.
- Retrieves the four approved secrets through narrowly scoped
  sudo -n salt-call pillar.get.
- Adds provenance handling for modified and untracked bundle inputs.

Verified
- Runtime-wrapper tests: 14/14 on POSIX.
- Deployment dry-run tests: 26/26.
- Internal checksums: 34/34.
- Archive/member safety and shell syntax passed.
- No secrets or secret files are packaged.

Deferred
- Clean-room offline installation on Linux CPython 3.12.
- Missing-wheel negative test.
- Real TCLUE999DEVS AutoSys/Salt entitlement validation.

External prerequisites
- Narrowly scoped NOPASSWD authorization for the four approved pillar names.
- Non-secret clue.env placement.
- AutoSys job definition and execution under TCLUE999DEVS.

Finally report:
- branch name;
- commit SHA;
- clean release ID and SHA-256;
- pushed remote branch;
- PR URL or manual PR creation link;
- exact files committed;
- tests passed and deferred.
