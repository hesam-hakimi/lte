15. Ordered closure plan — one gate at a time

Gate 0 — select the repository baseline

Before asking an agent to edit anything, the CLUE owner and EDP owner must decide whether the authoritative source is:

1. the merged origin/main / PR #24 model;
2. the current integration branch model; or
3. a documented third model.

The answer must cover Maven layout, release version, deployableArtifact.type, CD.yml owner block, batch_url, and .gitignore behavior as one coherent contract. Individual values must not be cherry-picked independently.

Paste-ready question:

Subject: CLUE deployment baseline decision required before packaging changes

Read-only comparison found that integration/edponboard-main-20260924 is
9 commits ahead of and 6 commits behind origin/main (which contains merged
PR #24). The two lines define incompatible deployment contracts:

- main: multi-module Maven, clue-code 1.1.0-SNAPSHOT,
  deployableArtifact.type=pom, active java_batch owner
  TCLUE999DEVS:users, batch_url for 1.1.0-SNAPSHOT, target/ ignored;
- integration branch: single-module Maven, clue-code 1.0.5-SNAPSHOT,
  deployableArtifact.type=tar.gz, owner block commented, batch_url for
  1.0.5-SNAPSHOT, target/ no longer ignored.

Please identify the authoritative baseline for CLUE and approve one coherent
set of values for Maven layout, Maven version, deployableArtifact.type,
java_batch owner, batch_url, and target/ ignore behavior. Until this is
recorded, we will not edit, build, package, or run CI.

Gate 1 — obtain EDP/XLR producer evidence

After Gate 0, obtain the exact Maven invocation, tests, artifact-discovery glob, upload/promotion behavior, publish endpoint, checksum/provenance behavior, EDPProjectKey status, accepted deployableArtifact.type, and immutable workflow/parent pins.

Gate 2 — obtain Platform/Salt consumer evidence

Obtain the exact accepted archive format/root, extraction layout, default semantics, ownership/modes, Python runtime and dependency policy, AutoSys entry point, status/convergence behavior, and rollback mechanism.

Gate 3 — obtain Identity/Unix evidence

Verify canonical DEV/PAT/PROD accounts and memberships, the approved application-owner group, and the exact narrow sudoers rule. Do not grant NOPASSWD: ALL, and do not use a sudo-capability group as the filesystem owner unless Identity explicitly approves that design.

Gate 4 — close D01–D14, then authorize Step 3

Only after the answers are captured in the canonical register may Step 3 propose repository changes. Step 3 must begin with a file-by-file change plan and tests; it must not start by generating another deployment archive.
