Continue from your latest “§2 Adjudication Against Step 1 Repository
Evidence” report.

That report is accepted only as a Step 1 addendum. Step 1 is now complete.
Do not repeat or rewrite Step 1, and do not remain at the Step 1 gate.

Execute CLUE Step 2 now: resolve the producer/consumer artifact contract.

This remains read-only:
- no repository edits;
- no generated files;
- no build or package;
- no CI execution;
- no server access or deployment;
- no commit, push, or PR action;
- do not read or print credentials.

Required work:

1. Using existing authorized read-only access, inspect:
   TD-Universe/edp-xl-actions/.github/workflows/edp-xl-workflow.yml@main

   Report the immutable commit and exact:
   - Maven command, goals, profiles, and properties;
   - test commands;
   - artifact-discovery pattern;
   - Nexus upload implementation;
   - checksum/signing/provenance generation;
   - resolution of env.nexus_url.

2. Locate authorized source or documentation for the Salt java_batch formula
   referenced by CD.yml. Determine:
   - download and extraction destinations;
   - expected archive root shape;
   - direct versus versioned extraction;
   - ownership and permissions;
   - venv/dependency handling;
   - invoked application entry point;
   - activation, status, idempotency, and rollback behavior.

3. Keep these classifications separate:
   - external source repository/workflow;
   - Maven dependency retrieved from Nexus;
   - deploy-time Platform Salt formula.
   Do not call all three “a second repository.”

4. Incorporate these corrected facts:
   - four divergent version values exist;
   - /opt/clue is the tracked install root;
   - ${CLUE_DEV_ROOT} is a separate scheduler-provided lifecycle-data root;
   - work/ and output/ may change during a valid run;
   - the repository implements narrow sudo only for salt-call secret retrieval;
   - absence of rehearsal scripts proves CI cannot reproduce that bundle, but
     does not independently prove the contents of a server-side artifact.

5. Produce decision register D01-D14 with columns:
   ID | Decision | Evidence-backed options | Recommended option |
   Required owner/approver | Approval evidence | Status

6. Produce:
   - Model A member map: preserve current Maven/Salt model;
   - Model B member map: adopt rehearsal release-manager model;
   - end-to-end deployment sequence for each viable model;
   - paste-ready questions for EDP, Platform/Salt, Identity/Unix, and CLUE owners.

If external evidence is unavailable, do not guess. Mark the affected rows
BLOCKED_EXTERNAL_EVIDENCE and continue all other tasks.

End with exactly one marker:

STEP_2_ARTIFACT_CONTRACT_APPROVED

only if D01-D14 are all explicitly approved with evidence; otherwise:

STEP_2_ARTIFACT_CONTRACT_BLOCKED

Return the complete text report, not screenshots alone. Do not propose or
execute Step 3 changes.
