Correction: the previous audit inspected the source-snapshot installation at
/opt/clue/pr19-c70b121f. That is not the packaged deployment we intend to install.

Perform a read-only preflight of the actual deployment artifact:

/opt/clue/clue-0.2.0-test-f676277-deploy.tar.gz

Expected SHA-256:
1138cb0ec31d565af2a68050929b9c20ea348151b76b35fc0a7c3dfd0658a922

Rules:
- Do not modify /opt/clue/pr19-c70b121f.
- Do not execute bin/clue-deploy.sh yet.
- Do not use sudo or create /opt/td/clue directories.
- Do not retrieve secrets or contact AutoSys, Salt, HKV, Nexus, Symcor, or Tungsten.
- Do not edit or extract over an existing directory.

Actions:
1. Verify the artifact SHA-256.
2. Validate archive paths for traversal, absolute paths, links, and special files.
3. Inspect directly from the archive:
   - MANIFEST.json
   - bin/clue-deploy.sh
   - deployment documentation
   - config example files
   - packaged CLUE wheel
4. Determine:
   - the exact supported deployment command;
   - required user/group ownership;
   - required target directories;
   - whether /opt/td/clue already exists;
   - whether the script supports a safe dry-run;
   - rollback and idempotency behavior.
5. Do not install anything.

Return one status:
READY_FOR_PLATFORM_INSTALL
BLOCKED_BY_TARGET_OWNERSHIP
ARTIFACT_INVALID
