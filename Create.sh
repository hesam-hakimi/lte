Update the existing CLUE deployment implementation and its canonical deployment documentation to support a complete administrator-led installation.

Important:
- Work in the source repository, not in /opt/clue/pr19-c70b121f or another extracted server copy.
- Find and update the existing canonical deployment Markdown file. Do not create a duplicate deploy.md/deployment.md file.
- Inspect the existing bin/clue-deploy.sh, packaging generator, and deployment tests before editing.
- Prefer extending the existing deployment script. Do not create another installer unless the existing design makes that unavoidable.
- Do not commit, push, publish, or deploy in this task.

Confirmed deployment model:
- An administrator with root/sudo access performs installation.
- DEV runtime account: TCLUE999DEVS.
- Target root: /opt/td/clue.
- AutoSys later executes the application under the runtime account.
- HKV/Salt secrets are retrieved only at runtime, never during installation.
- Runtime group is not yet confirmed and must remain an explicit validated input.

Update the canonical deployment documentation with these ordered phases:

1. Prerequisites
   - Administrator/root access.
   - Python and OS dependencies.
   - Deployment artifact and authoritative SHA-256.
   - Runtime account and group confirmation.
   - Required disk space.
   - No runtime secrets required.

2. Administrator preflight
   - Confirm the current identity and sudo/root capability.
   - Validate the exact target path.
   - Verify that the runtime user and group exist.
   - Reject an empty, root-level, relative, or unexpected installation path.
   - Verify artifact checksum and archive safety before extraction.

3. Initial filesystem bootstrap
   Create the layout idempotently using explicit owner and mode settings:

   /opt/td/clue/
   /opt/td/clue/releases/
   /opt/td/clue/conf/
   /opt/td/clue/logs/
   /opt/td/clue/work/

   Baseline ownership model:
   - installation root and releases: root:<runtime-group>
   - conf: root:<runtime-group>, runtime read-only
   - logs and work: TCLUE999DEVS:<runtime-group>, runtime writable
   - release contents: administrator-owned and runtime read/execute
   - current activation link: administrator-managed

   Use secure explicit modes. Never use chmod 777.
   Do not run broad recursive chmod/chown outside the validated CLUE root.

4. Release installation
   - Install into a unique versioned release directory.
   - Use the packaged application wheel and offline wheelhouse.
   - Create the release virtual environment.
   - Run pip check and non-secret installation smoke checks.
   - Keep release contents immutable to the runtime account.
   - Never overwrite an existing release directory.

5. Configuration
   - Copy example configuration only when the destination does not exist.
   - Never overwrite an existing environment configuration automatically.
   - Do not put passwords, private keys, certificates, or HKV values in conf,
     .env files, command arguments, reports, or logs.

6. Atomic activation
   - Activate the new release only after all installation checks pass.
   - Use the existing supported activation mechanism or an atomic current
     symlink if that is already the intended design.
   - Preserve the previous release for rollback.

7. Post-install verification
   - Verify ownership and modes.
   - Verify the installed wheel and console entry points.
   - Run help/import/pip-check smoke tests without provider calls.
   - Do not invoke AutoSys, Salt, HKV, Symcor, or Tungsten.
   - Clearly report that runtime validation remains pending.

8. AutoSys handoff
   - Document that AutoSys must run under TCLUE999DEVS in DEV.
   - Document the wrapper command without secret values.
   - State that non-interactive Salt/HKV access must be validated separately
     under the actual AutoSys identity.

9. Rollback
   - Restore the previous activated release atomically.
   - Do not delete the failed release automatically.
   - Include verification after rollback.

Installer requirements:
- Add a genuinely non-mutating --dry-run mode to the existing installer.
- Dry-run must perform no writes, directory creation, extraction, network
  access, secret retrieval, provider calls, or AutoSys invocation.
- Initial installation and repeated execution must be idempotent.
- Fail closed on ownership, permissions, checksum, archive safety, missing
  runtime identity, or target-path problems.
- Never print secret values.
- Preserve existing configuration and releases.

Testing:
- Add/update tests for:
  - first-time bootstrap;
  - repeated idempotent execution;
  - dry-run causing zero filesystem changes;
  - unsafe target rejection;
  - missing runtime user/group;
  - existing configuration preservation;
  - release collision;
  - failed installation without activation;
  - activation and rollback;
  - expected ownership and permission plan.
- Run the focused deployment tests and relevant regression tests.

Packaging:
- Ensure the updated canonical documentation, installer, configuration
  examples, application wheel, offline wheelhouse, and manifest are included
  in the generated deployment artifact.

Return:
- files changed;
- concise design decisions;
- exact documented administrator command sequence;
- test commands and results;
- remaining platform inputs, especially the runtime group;
- confirmation that no server installation, publishing, commit, or push occurred.
