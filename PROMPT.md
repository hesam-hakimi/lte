Finalization only. Do not add new features.

Do not deploy to /opt/td/clue, contact Nexus, HKV/Salt, AutoSys,
Symcor or Tungsten, and do not commit, push or publish anything.

1. Inspect the finalized workspace with:

   git status --short --untracked-files=all
   git diff --check
   git diff --stat

2. Confirm that no temporary harness or file from %TEMP%, WSL /tmp,
   or another scratch directory is included in the repository or bundle.

3. Resolve the provenance inconsistency:
   the current bundle is labelled only with commit a516a21 even though
   modified/untracked deployment inputs exist.

   Any tracked, staged, modified or untracked file used as a bundle input
   must participate in the dirty-state digest. The generator must never
   report a clean source state when untracked files are packaged.

   Do not create a commit. If necessary, fix the generator and rebuild
   with an explicit dirty source identifier.

4. Rebuild exactly one release candidate containing:
   - bin/clue-prepare-host.sh
   - bin/clue-deploy.sh
   - bin/clue-batch-run.sh
   - the application wheel
   - the complete offline wheelhouse
   - CLUE_OPERATIONAL_DEPLOYMENT.md
   - CLUE_DEPLOYMENT_ENGINEERING_REFERENCE.md
   - MANIFEST.json
   - SHA256SUMS
   - requirements.lock.txt

5. Repeat only the non-runtime verification:
   - outer SHA-256
   - all internal SHA256SUMS
   - archive path and member safety
   - bash -n on all packaged shell scripts
   - application-wheel digest against MANIFEST.json
   - no bare "pip install clue"
   - deployment uses --no-index, --find-links and the explicit app wheel
   - zero-network/zero-mutation dry-run tests

6. Do not attempt to fake the Linux CPython 3.12 clean-room test.
   Report these two checks as DEFERRED:
   - clean-room offline installation
   - missing-wheel negative test

7. Create one handoff directory containing:
   - the final deployment archive
   - its SHA-256 sidecar
   - its manifest sidecar
   - CLUE_OPERATIONAL_DEPLOYMENT.md
   - CLUE_DEPLOYMENT_ENGINEERING_REFERENCE.md

8. In the final response show only:
   - absolute paths of those five deliverables
   - final release ID and SHA-256
   - a compact PASS/DEFERRED table
   - the exact operator commands for:
       A. verify and extract
       B. administrator host preparation
       C. dry-run and installation as TCLUE999DEVS
       D. status and rollback
   - confirmation that nothing was deployed, committed, pushed or published
