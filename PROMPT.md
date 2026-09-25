Continue from the current state. Do not deploy, publish, commit, push, or modify the DEV server.

New host evidence:

- `id TCLUE999DEVS` succeeds on the DEV host and resolves to the canonical account `tclue999devs`.
- The earlier passwd checks were mistyped as `getnet password` and `getent password`; therefore `getent passwd TCLUE999DEVS` still needs to be recorded as the exact check.
- The visible `id` output does not prove membership in `vmc2_clue_dev`.
- Membership in `unix_sudo_svc_clue` does not by itself prove narrowly scoped NOPASSWD authorization for the required Salt pillar commands.
- The application retrieves secrets through `sudo -n salt-call pillar.get`; it does not call Vault/HKV directly.

Before asking me to keep the changes:

1. Remove the two temporary harness files from the pending change set. Exactly these three repository files should remain:
   - deploy/clue-deploy.sh
   - docs/handoff/clue/deploy/CLUE_DEPLOYMENT_RUNBOOK.md
   - tests/clue/test_clue_deploy_dry_run.py

2. Show `git status --short`, `git diff --stat`, and `git diff --check`.

3. Review the runbook and ensure its identity checks use exactly:
   - `getent passwd "$CLUE_RUNTIME_USER"`
   - `id "$CLUE_RUNTIME_USER"`
   - `getent group "$CLUE_OWNER_GROUP"`
   - an exact, directory-service-safe group-membership assertion.

4. Make the runbook self-contained starting from the `.tar.gz`.
   If `/opt/clue/clue-0.2.0-test-f676277/bin/clue-deploy.sh` requires prior extraction, document the checksum verification and safe bootstrap extraction explicitly. Do not assume that directory already exists.

5. Verify that the administrator phase creates only:
   - /opt/td/clue/releases
   - /opt/td/clue/conf
   - /opt/td/clue/logs
   - /opt/td/clue/work

   It must not recursively chown/chmod `/opt/td/clue` and must not alter:
   - archive
   - clue_staging
   - outputs
   - rejects

6. Verify the generated configuration has no `__SET_ME__` placeholders and ends with the intended owner, group and mode. Avoid any root-side in-place edit that accidentally changes ownership.

7. Re-run the dry-run tests and the relevant existing deployment tests.

8. Report the final three-file diff and any remaining platform prerequisites. Do not perform installation or runtime secret retrieval.
