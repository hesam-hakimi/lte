Manual CLUE package build and DEV deployment rehearsal — no CI/CD

This task supersedes the previous commit/push/PR task.

Objective

Build exactly one test-only CLUE deployment package from the current
intended deployment implementation, upload it directly to the DEV
server, and rehearse the complete installation process without using
GitHub CI/CD or publishing anything to Nexus.

Known DEV information

DEV_HOST=crcluesbdzwnk0.dev.vmc2.td.com
SSH_USER=tag5916
RUNTIME_USER=TCLUE999DEVS
OWNER_GROUP=vmc2_clue_dev
PRODUCTION_APP_ROOT=/opt/td/clue

Critical safety rules

- Do not commit, push, tag, open a PR, or trigger CI/CD.
- Do not publish anything to Nexus or GitHub Releases.
- Do not read or use the GitHub token from .env.
- Do not modify the original repository index or another session’s work.
- Do not install into /opt/td/clue.
- Do not call Salt/HKV, AutoSys, Symcor, Tungsten, or any provider.
- Do not retrieve runtime secrets.
- Never put a password or token in a command, script, log, or file.
- Do not automatically delete the rehearsal installation after testing.
- Clearly label the resulting artifact MANUAL-TEST-ONLY.
- A .dirty provenance suffix is acceptable for this unpublished
  rehearsal, but it must be reported and must never be treated as an
  official release.

Use an isolated working tree or isolated copy for this rehearsal.
Leave the original worktree and staged index unchanged.

Phase 1 — Identify the supported build procedure

Inspect the current versions of:

- pom.xml
- pyproject.toml
- tools/build_deployment_bundle.py
- deploy/clue-deploy.sh
- deploy/clue-prepare-host.sh
- deploy/clue_with_runtime_secrets.sh
- CLUE_OPERATIONAL_DEPLOYMENT.md
- existing package-generation tests

Do not invent build flags. Use the build command currently supported by
the repository.

Determine the existing manual-test version convention. Update pom.xml
and any required duplicate version source only inside the isolated
rehearsal workspace.

Use a test version derived from the current short commit SHA, following
the existing repository convention.

Report the resolved values for:

- Maven version
- Python package version
- deployment release ID
- archive filename

Phase 2 — Build one package

Run the applicable local tests first:

- deployment dry-run tests;
- runtime-secret-wrapper tests;
- shell syntax checks;
- package-generator tests;
- archive and checksum tests.

Build exactly one deployment bundle using the repository’s supported
bundle-generation command.

Dependency requirements:

- the bundle must contain the application wheel;
- the bundle must contain the complete offline dependency wheelhouse;
- Linux CPython 3.12 x86_64-compatible wheels must be present;
- dependency resolution may use the already configured corporate
  repository only if the normal build requires it;
- never use public PyPI;
- the target server installation must use --no-index and --find-links;
- every wheel and packaged file must be covered by the manifest or
  internal checksum inventory.

Expected output:

- deployment .tar.gz;
- .tar.gz.sha256;
- manifest JSON;
- CLUE_OPERATIONAL_DEPLOYMENT.md;
- CLUE_DEPLOYMENT_ENGINEERING_REFERENCE.md.

Verify locally:

- outer SHA-256;
- internal SHA256SUMS;
- archive path safety;
- exactly one archive root;
- required scripts and executable modes;
- application-wheel digest;
- dependency-wheel inventory.

Stop immediately if any verification fails.

Phase 3 — Upload directly to DEV

First verify SSH connectivity without sudo and report:

hostname -f
id
python3.12 --version

Create a new, release-specific upload directory under the SSH user’s
home, for example:

~/clue-manual-rehearsal/<release-id>/

Upload only the five handoff files from Phase 2.

Do not overwrite or delete an existing artifact.

After upload, calculate SHA-256 independently on DEV and compare it with
the local value and sidecar. Stop if any value differs.

Inspect the archive safely before extraction. Reject:

- absolute paths;
- .. traversal;
- symlinks or hardlinks;
- device or special files;
- unexpected setuid/setgid bits;
- multiple top-level roots.

Extract it only inside the release-specific upload directory.

Phase 4 — Zero-mutation dry-run

Define a dedicated rehearsal target such as:

/opt/td/clue-rehearsal/<release-id>

Do not use /opt/td/clue.

Before running anything, capture a filesystem snapshot of:

- the upload directory;
- the rehearsal root, if it already exists;
- /opt/td/clue.

Use the packaged scripts and their actual supported arguments.

Run the host-preparation script in --dry-run mode for:

- runtime user TCLUE999DEVS;
- owner group vmc2_clue_dev;
- the dedicated rehearsal root.

Then run deployment preflight and release --dry-run with:

- the uploaded local artifact;
- its verified SHA-256;
- an empty artifact URL;
- no network access;
- the dedicated rehearsal root/configuration.

Run the deployment command under the intended runtime identity wherever
the documented contract requires it.

Verify that dry-run:

- returns exit 0;
- reports every planned stage;
- creates no directories, logs, temp files, venvs, symlinks, or config;
- performs no network or secret retrieval;
- leaves all three filesystem snapshots unchanged.

If dry-run fails, STOP. Report the exact stage and error. Do not continue
to real installation.

Phase 5 — Real isolated installation rehearsal

Proceed only after Phase 4 passes.

If sudo requires an interactive password, pause and present exactly one
administrator command for me to run manually. Never request or store the
password.

Use the packaged host-preparation script to create only the dedicated
rehearsal root and its required directories.

Do not manually reproduce those directory commands if the packaged
script supports them.

Then execute the packaged deployment release command as the documented
runtime/owner account, using:

- the dedicated rehearsal configuration;
- the uploaded local artifact;
- the verified SHA-256;
- an empty artifact URL.

The installation must remain offline:

- pip must use --no-index;
- pip must use the packaged wheelhouse;
- the application wheel must be installed by explicit file path;
- no dependency may be downloaded during server installation.

Validate after installation:

- deployment status;
- current symlink target;
- RELEASE metadata;
- .deploy_complete marker;
- venv Python version;
- pip check;
- installed dependency versions;
- application package provenance;
- clue-batch entry point;
- clue-tungsten entry point;
- packaged shell-script modes;
- configuration ownership and permissions.

For the runtime-secret wrapper, execute only:

clue_with_runtime_secrets.sh --help

Do not execute its real child command and do not invoke salt-call.

Phase 6 — Repeatability and post-install dry-run

Run the same release command a second time against the isolated root.

Expected result:

- exit 0;
- already installed / nothing to do;
- no replacement or duplicate release directory;
- no dependency reinstall;
- no new filesystem mutation.

Then run release --dry-run again after installation and confirm it
correctly reports the already-installed state without changing anything.

Run status again.

Rollback cannot be fully tested with only one installed release.
Run rollback only in --dry-run mode and report the expected
“no previous release” condition. Do not claim rollback PASS unless a
second distinct release actually exists.

Phase 7 — Preserve evidence

Do not delete:

- the uploaded package;
- the isolated installation;
- logs that contain no secrets;
- the verification report.

Provide cleanup commands but do not execute them.

Final report

Return one concise report containing:

1. Local isolated workspace path.
2. Source commit SHA and dirty/clean state.
3. pom.xml version before and during rehearsal.
4. Python/application version.
5. Release ID.
6. Local artifact path and size.
7. Local and remote SHA-256.
8. DEV upload path.
9. Isolated installation root.
10. Tests passed, failed, skipped, and deferred.
11. Dry-run result before installation.
12. Actual isolated installation result.
13. Offline dependency-install evidence.
14. pip check result.
15. Entry-point results.
16. Second-run/idempotency result.
17. Post-install dry-run result.
18. Confirmation that /opt/td/clue was unchanged.
19. Confirmation that no CI/CD, Git push, Nexus publication, Salt/HKV,
    AutoSys, Symcor, or Tungsten operation occurred.
20. Exact cleanup commands, not executed.

Final status must be exactly one of:

MANUAL_REHEARSAL_PASS
MANUAL_REHEARSAL_FAILED
MANUAL_REHEARSAL_BLOCKED
