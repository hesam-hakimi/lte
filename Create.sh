Continue from the packaged-artifact preflight findings.

Do not change anything on the DEV server. Work only in the source repository.
Do not commit, push, publish, or deploy.

First:
1. List the three currently changed files.
2. Explain why each file changed during the previous read-only task.
3. Show a concise diff summary and remove any unrelated or accidental change.

Then update the existing canonical deployment documentation and existing
installer implementation for an administrator-led, two-phase installation.

Confirmed facts:
- Target root: /opt/td/clue
- /opt/td/clue already exists as root:root mode 0755.
- Existing directories archive/, clue_staging/, outputs/, and rejects/ must not
  be removed, recursively chowned, or otherwise modified.
- Required new directories are releases/, conf/, logs/, and work/.
- DEV runtime NPID: TCLUE999DEVS.
- Expected group: vmc2_clue_dev, but validate it explicitly.
- The deployer intentionally refuses to run as root.
- The administrator performs the complete procedure but must execute the
  non-privileged deployment phase as the configured deployment owner.
- Installation retrieves no Salt/HKV secrets and contacts no providers.

Account validation:
- Use direct account resolution:
  getent passwd "$CLUE_RUNTIME_USER"
  id "$CLUE_RUNTIME_USER"
- Do not infer account absence from `getent passwd | grep`.
- Validate the configured group with direct getent group lookup.

Document these exact phases in the existing canonical deployment Markdown file:

Phase A — Administrator bootstrap
- Log in using an approved administrator account.
- Validate the exact target path and runtime identity.
- Create only the missing required subdirectories using install -d.
- Apply explicit ownership and secure setgid modes.
- Do not recursively modify the existing /opt/td/clue tree.
- Create conf as runtime-readable and administrator-controlled.
- Create releases, logs, and work with the ownership required by the existing
  installer.
- Populate clue-deploy.conf from the packaged example without any secrets.
- Set the DEV values:
    CLUE_RUNTIME_USER=TCLUE999DEVS
    CLUE_OWNER_USER=TCLUE999DEVS
    CLUE_OWNER_GROUP=vmc2_clue_dev
    CLUE_APP_ROOT=/opt/td/clue
  Keep these configurable; do not hardcode them in generic installer logic.

Phase B — Drop privileges and install
- The administrator must invoke preflight and release as the configured owner,
  for example through approved `sudo -u`, rather than executing the deployer
  as root.
- Document the exact preflight command.
- Document the exact offline release command using --artifact-file,
  --artifact-sha256, and an empty --artifact-url.
- Do not retrieve secrets or call AutoSys, Salt, HKV, Symcor, or Tungsten.

Phase C — Verify and hand off
- Verify release layout, wheel installation, pip check, entry points,
  ownership, permissions, and activation.
- Record installation success separately from runtime validation.
- State that AutoSys/HKV validation remains pending under TCLUE999DEVS.

Correct the installer dry-run contract:
- --dry-run must create no directories, temp artifact copies, virtual
  environments, logs, activation links, or other files.
- --dry-run must perform no network access.
- Ensure fetch and validate also honor dry-run.
- Add regression tests proving the filesystem is byte-for-byte unchanged.

Preserve:
- atomic activation and rollback;
- idempotency;
- existing configuration;
- existing unrelated /opt/td/clue directories;
- fail-closed checksum, archive, identity, ownership, and permission checks.

Return:
- changed files and diff summary;
- exact administrator commands added to the documentation;
- tests executed and results;
- confirmation that no DEV-server mutation occurred;
- any unresolved platform input.
