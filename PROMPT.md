Proceed with the real isolated DEV deployment rehearsal using the
already verified staged candidate.

This is MANUAL TEST ONLY.

Verified values:

RID='0.2.0-a516a21.dirty.917b244b'
STAGE='/opt/clue/manual-rehearsal/0.2.0-a516a21.dirty.917b244b'
BUNDLE="$STAGE/clue-0.2.0-a516a21.dirty.917b244b"
ARCHIVE="$STAGE/clue-0.2.0-a516a21.dirty.917b244b-deploy.tar.gz"
TEST_ROOT='/opt/td/clue-rehearsal/0.2.0-a516a21.dirty.917b244b'
GROUP='unix_sudo_svc_clue'
NPID='TCLUE999DEVS'
SHA256='27c6b7e23054c33f1d624bcaf4c06779466d416362429dc9a847a7e6541c879b'

Requirements:

1. Take a read-only before-snapshot of:
   - `/opt/td/clue`
   - `$TEST_ROOT`
   - staged bundle and archive

2. Run the real `clue-prepare-host.sh` as root for `$TEST_ROOT`, using:
   - NP ID `TCLUE999DEVS`
   - group `unix_sudo_svc_clue`
   - the packaged config template

   Interactive sudo is allowed. Let me enter the password directly in
   the terminal. Never capture, print, pipe, log, or store the password.

3. Verify the resulting directories, ownership, modes, and rendered
   config. Confirm that `tclue999devs` can traverse and write only where
   required.

4. As `tclue999devs`, run in this order:
   - preflight
   - release --dry-run
   - real release using the existing local archive and exact SHA-256

5. The installation must be fully offline:
   - no package index
   - no HTTP download
   - use only the packaged wheelhouse
   - do not call Nexus

6. Verify:
   - `pip check`
   - application entry-point `--help` checks
   - release status
   - `current` symlink
   - installed release metadata
   - second-run idempotency
   - post-install dry-run with zero mutation

7. Do not execute:
   - `clue_with_runtime_secrets.sh`
   - Salt/HKV
   - AutoSys
   - Symcor
   - Tungsten
   - CI/CD or Nexus publication

8. Compare `/opt/td/clue` before and after. It must remain unchanged.
   Do not clean up the staging or rehearsal installation yet.

Report either:

- PRIVILEGED_RUNTIME_REHEARSAL_PASS
- PRIVILEGED_RUNTIME_REHEARSAL_FAILED

Include every command, exit code, installed path, ownership/modes,
offline-install evidence, idempotency evidence, and the `/opt/td/clue`
before/after comparison.
