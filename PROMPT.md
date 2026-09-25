Resume the existing manual DEV deployment rehearsal.

This is a MANUAL TEST ONLY. The goal is to test whether `unix_sudo_clue`
can technically be used as the CLUE filesystem owner group. This test
does not mean that the group is approved for production.

Important:
- Use the existing package already uploaded to DEV.
- Do not rebuild or upload anything.
- Do not use or modify `/opt/td/clue`.
- Use the isolated root:
  `/opt/td/clue-rehearsal/0.2.0-a516a21.dirty.917b244b`
- Do not invoke CI/CD, Nexus, Salt/HKV, AutoSys, Symcor, or Tungsten.
- Do not read `.env` or retrieve any secrets.
- Do not clean up the evidence automatically.

Steps:

1. Verify read-only:
   - hostname
   - `id tclue999devs`
   - `id -nG tclue999devs`
   - `getent group unix_sudo_clue`
   Confirm that `tclue999devs` is an exact member of `unix_sudo_clue`.
   Do not guess or use a similarly named group.

2. Locate the existing uploaded and extracted MANUAL-TEST-ONLY package.
   Verify its SHA-256 against its existing sidecar before using it.

3. Run `clue-prepare-host.sh --dry-run` with:
   - NP ID: `TCLUE999DEVS`
   - group: `unix_sudo_clue`
   - app root:
     `/opt/td/clue-rehearsal/0.2.0-a516a21.dirty.917b244b`
   - the packaged configuration template

4. If the dry-run fails, stop and report the exact failed stage and exit
   code. Do not make any changes.

5. If the dry-run passes, show me the exact privileged preparation
   command and ask for my confirmation before executing it.

   Interactive sudo is allowed for this manual test. Let me type the
   password directly into the terminal. Never request, read, print,
   capture, store, pipe, or log my password. Do not use `sudo -S`.

6. After the privileged preparation succeeds:
   - verify owner, group, modes, and directories under the isolated root;
   - run deployment `release --dry-run` as `tclue999devs`;
   - if that passes, run the real release only inside the isolated root;
   - use the existing local artifact and perform an offline installation;
   - do not execute the runtime-secret wrapper.

7. Verify:
   - offline dependency installation;
   - `pip check`;
   - application entry-point `--help` checks;
   - release status and `current` symlink;
   - second-run idempotency;
   - post-install dry-run;
   - `/opt/td/clue` remains byte-for-byte and metadata unchanged.

8. Report one of:
   - UNIX_SUDO_CLUE_REHEARSAL_PASS
   - UNIX_SUDO_CLUE_REHEARSAL_FAILED
   - UNIX_SUDO_CLUE_REHEARSAL_BLOCKED

Include exact command, exit code, failing stage, and before/after
filesystem evidence. Clearly state that this proves only technical
compatibility; Platform still needs to confirm whether
`unix_sudo_clue` is the approved production owner group.
