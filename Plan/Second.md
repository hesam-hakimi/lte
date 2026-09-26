CLUE Implementation Phases and Acceptance

Document ID: CLUE-IMPLEMENTATION-PHASES-2026-09-26-R1
Status: Controlling execution plan
Goal: Produce a high-quality, simple, official Maven build that can be
published by the existing pipeline and downloaded from Nexus, without changing
EDP-owned build configuration except for the explicitly authorized install-root
change in CD.yml.

1. Required inputs and reading order

GitHub Copilot must read these files completely before acting:

1. CLUE_Implementation_Reference_2026-09-26.md
  • This is the clean controlling baseline.
2. CLUE_Implementation_Phases_and_Acceptance_2026-09-26.md
  • Defines sequencing, scope, gates, and acceptance.
3. CLUE_Implementation_Journal_2026-09-26.md
  • Must be updated at the end of every phase.
4. CLUE_GitHub_Copilot_Implementation_Prompt_2026-09-26.txt
  • Contains the execution instructions for the agent.

The historical investigation report may be retained as an evidence appendix,
but it is not a required Copilot input and its superseded conclusions must not
control implementation.

The repository is also an evidence source. Copilot must inspect the current
tracked files and Git graph rather than treating a historical SHA or report as
live state.

2. Frozen decisions

|Area                             |Controlling decision                                                           |
|---------------------------------|-------------------------------------------------------------------------------|
|Install root                     |`/app/clue`                                                                    |
|Host owner/runtime identity      |Exact environment NPID verified on the host                                    |
|Root usage                       |One-time, narrowly scoped host preparation only                                |
|Host download/extract/run        |NPID                                                                           |
|Build producer                   |Existing Maven Assembly path                                                   |
|Publication                      |Existing EDP/XLR pipeline to Nexus                                             |
|Manual rehearsal bundler         |Prohibited                                                                     |
|`CI.yml`                         |No edits                                                                       |
|Root and assembly `pom.xml` files|No edits                                                                       |
|`CD.yml`                         |Only `/opt/clue` to `/app/clue` in the active install-root/`basename` field    |
|Other EDP contract values        |Inherit current `origin/main` unchanged                                        |
|Application/tree work            |Preserve verified integration-branch changes and complete `Deliverables/` input|
|Primary principles               |Quality first; simplest implementation that satisfies the evidence             |

3. Global execution rules

• Work in a new isolated clean worktree and release-candidate branch. Do not
edit the user’s existing dirty worktree.
• Never use destructive Git operations, force-push, or broad recursive
ownership changes.
• Do not modify CI.yml or any pom.xml.
• Do not make any CD.yml change except the one authorized path replacement.
• Do not hardcode a timestamped Snapshot URL.
• Do not read, print, log, commit, or package credentials or secrets.
• Use repository evidence and executable tests; do not claim success from a
plan or from an unexecuted command.
• Record every command, exit code, result summary, changed file, decision, and
unresolved item in the implementation journal.
• Stop immediately on an unexpected protected-file diff, test failure,
unplanned dependency change, missing required artifact member, secret hit,
or ambiguous remote state.

4. Phase sequence

Phase 0 — Live baseline and isolation

Actions:

1. Locate the correct repository and confirm its sanitized remote.
2. Fetch without merging or pruning.
3. Record current local branch, HEAD, origin/main, integration-branch tip,
merge base, ahead/behind counts, worktree state, and relevant open merge or
rebase state.
4. Confirm the exact integration branch name; do not normalize its historical
spelling.
5. Create an isolated clean worktree and local release-candidate branch.
6. Read repository guidance such as AGENTS.md if present.

Exit condition:

• Clean isolated worktree established.
• No repository content changed.
• Baseline evidence recorded in the journal.
• Any remote movement relative to the recorded SHAs is explicitly reconciled.

Phase 1 — Controlled integration

Preferred simple method:

1. Bring the latest origin/main forward into the integration line inside the
isolated release candidate.
2. Preserve all application commits and the corrected Deliverables/ tree.
3. Resolve only genuine merge conflicts and document each resolution.
4. Do not create the merge commit yet.

Mandatory protected-file result:

• CI.yml, all pom.xml files, assembly.xml, and .gitignore must equal
current origin/main byte-for-byte.
• Before the authorized path change, CD.yml must equal current origin/main
byte-for-byte.

Exit condition:

• Integration result contains both the current main deployment contract and
the intended application changes.
• Protected-file comparison passes.
• No application file required by the assembly remains outside the approved
packaged tree.

Phase 2 — Minimal authorized implementation

Actions:

1. Change exactly the active CD.yml install-root/basename value from
/opt/clue to /app/clue.
2. Search the repository for both /opt/clue and /app/clue.
3. Classify every hit as active implementation, active test, current operator
documentation, or historical evidence.
4. Update an additional active reference only when it would otherwise make
the /app/clue implementation incorrect. Record the file, reason, and test.
Do not bulk-rewrite historical evidence.
5. Preserve the complete Deliverables/ tree, its environment configuration,
lifecycle checks, runtime-secret boundary, and layout regression guard.

Exit condition:

• CD.yml has exactly one authorized semantic change.
• CI.yml and every pom.xml have zero changes.
• Every active install-root reference is internally consistent or explicitly
documented as externally supplied.
• No unrelated cleanup is included.

Phase 3 — Source and policy validation

Run and document:

• protected-file diff checks;
• changed-file allowlist review;
• repository layout tests;
• shell syntax checks for packaged scripts;
• line-ending and executable-mode checks;
• focused tests for every affected behavior;
• secret and sensitive-file scans over changed files and the future package
input;
• source hygiene checks proving generated target/ output is not staged.

Exit condition:

• All targeted validation passes.
• No unexplained file or behavior change remains.
• No secret or prohibited artifact input is found.

Phase 4 — Full test qualification

Actions:

1. Discover the repository’s authoritative test commands from tracked
documentation and configuration.
2. Run the complete applicable Python and Maven test suites in the clean
worktree.
3. Record exact commands, versions, counts, skips, duration, and exit codes.
4. Investigate failures; never relabel a failure as an environmental skip
without evidence.

Exit condition:

• All required suites pass.
• Every skip is expected and explained.
• Worktree changes caused by tests are identified and excluded from source.

Phase 5 — Official local build and artifact inspection

Actions:

1. Use the repository’s Maven wrapper and official assembly path. Do not use
the manual rehearsal bundler.
2. Record tool versions, exact build command, exit code, output artifact path,
size, and SHA-256.
3. Inspect the archive without unsafe extraction.
4. Prove that required application, environment, lifecycle, and deployment
members are present.
5. Prove deploy/*.sh has the required executable mode.
6. Prove no path traversal, unsafe link, device file, secret, .env, private
key, credential, cache, Maven site output, or unrelated build output is
present.
7. Extract only into a fresh temporary directory and run packaged-content smoke
checks there.

Exit condition:

• Maven reports BUILD SUCCESS.
• Tests and artifact checks pass.
• Artifact is traceable to the recorded source state.
• Result is classified LOCAL_OFFICIAL_BUILD_VERIFIED.

Phase 6 — Local evidence review and external-action gate

Produce one review packet containing:

• baseline SHAs and branch relationship;
• complete changed-file list and diffstat;
• protected-file proof;
• test evidence;
• build and archive evidence;
• unresolved risks;
• exact proposed commit, push, PR, CI, and Nexus actions.

Stop and request explicit approval before performing any external write or
trigger.

Exit condition:

• User approves or rejects the proposed external actions based on the evidence
packet.

Phase 7 — Commit, push, existing CI, and Nexus publication

This phase begins only after Phase 6 approval.

Actions:

1. Commit only the reviewed files with the reviewed message.
2. Push normally; never force-push.
3. Create or update the intended PR only when authorized.
4. Use the existing CI/XLR route without editing its configuration.
5. Record run identifiers, source commit, test/build results, published Maven
coordinates, resolved Snapshot identity, Nexus location, size, and any
published integrity metadata.
6. Do not claim publication until Nexus evidence is retrievable.

Exit condition:

• Existing CI succeeds.
• The exact artifact is present in Nexus and tied to the reviewed commit.

Phase 8 — Independent Nexus download and NPID-owned validation

This phase begins only when server access and the exact NPID are confirmed.

Root-only bootstrap:

1. Verify the exact NPID and its group memberships.
2. Create /app/clue if needed.
3. Assign only /app/clue and the approved CLUE runtime-data directories to
the verified NPID/group. Never recursively change /app or another broad
parent.
4. End the root phase.

NPID phase:

1. Prove the NPID identity and access.
2. Download the exact published artifact from Nexus without using a hardcoded
timestamped Snapshot URL.
3. Record HTTP result, resolved identity, byte count, and SHA-256; compare with
CI/Nexus integrity evidence when available.
4. Perform safe listing, extraction, ownership, permission, and smoke checks as
the NPID.
5. Prove all CLUE application content beneath /app/clue is owned by the NPID
and that required scripts are executable by it.

Exit condition:

• The published bytes are independently downloadable and valid.
• The NPID can read, write where required, and execute the approved CLUE entry
points.
• Result is classified NEXUS_DOWNLOADABLE_BUILD_VERIFIED.

This phase does not by itself prove full Salt, AutoSys, PAT, or PROD readiness.

Phase 9 — Final documentation and handoff

Actions:

1. Complete every journal section.
2. Update the authoritative reference with verified final facts only.
3. Record the exact delivered artifact identity, commit, Nexus coordinates,
checksum, validation outcome, known limitations, and next owner/action.
4. Separate current facts from future deployment work.

Exit condition:

• A reviewer can reproduce the build and Nexus verification from the recorded
evidence without relying on chat history or screenshots.

5. Required evidence vocabulary

Use only:

• PLANNED
• IN_PROGRESS
• PASS
• FAIL
• BLOCKED_EXTERNAL_EVIDENCE
• NOT_RUN
• WITHDRAWN

Never use done, works, approved, or verified without the command,
artifact, or decision record supporting the claim.

6. Definition of the tomorrow delivery

The intended delivery is:

NEXUS_DOWNLOADABLE_BUILD_VERIFIED

It requires a successful official build, Nexus publication through the
existing process, independent download, safe artifact validation, and NPID
ownership/execution evidence under /app/clue.

It does not claim production deployment readiness, completed AutoSys
onboarding, or proven PAT/PROD behavior.
