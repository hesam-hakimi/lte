Document ID: CLUE-IMPLEMENTATION-JOURNAL-2026-09-26-R1
Status: PLANNED
Rule: Append evidence at the end of each phase. Never overwrite an earlier
failed or withdrawn observation; add a superseding entry.

Run identity

|Field                   |Value    |
|------------------------|---------|
|Start time with timezone|`NOT_RUN`|
|Operator/agent          |`NOT_RUN`|
|Repository              |`NOT_RUN`|
|Sanitized remote        |`NOT_RUN`|
|Original branch         |`NOT_RUN`|
|Isolated worktree       |`NOT_RUN`|
|Release-candidate branch|`NOT_RUN`|
|Original HEAD           |`NOT_RUN`|
|`origin/main`           |`NOT_RUN`|
|Integration tip         |`NOT_RUN`|
|Merge base              |`NOT_RUN`|

Phase register

|Phase                       |Status   |Start|End|Evidence section|Exit condition|
|----------------------------|---------|-----|---|----------------|--------------|
|0 — Baseline and isolation  |`NOT_RUN`|—    |—  |§P0             |Not evaluated |
|1 — Controlled integration  |`NOT_RUN`|—    |—  |§P1             |Not evaluated |
|2 — Minimal implementation  |`NOT_RUN`|—    |—  |§P2             |Not evaluated |
|3 — Source/policy validation|`NOT_RUN`|—    |—  |§P3             |Not evaluated |
|4 — Full tests              |`NOT_RUN`|—    |—  |§P4             |Not evaluated |
|5 — Official local build    |`NOT_RUN`|—    |—  |§P5             |Not evaluated |
|6 — Evidence review         |`NOT_RUN`|—    |—  |§P6             |Not evaluated |
|7 — CI and Nexus publication|`NOT_RUN`|—    |—  |§P7             |Not evaluated |
|8 — Nexus/NPID validation   |`NOT_RUN`|—    |—  |§P8             |Not evaluated |
|9 — Final handoff           |`NOT_RUN`|—    |—  |§P9             |Not evaluated |

Evidence-entry template

Use this complete template for every phase.

### P<phase>-<sequence> — <short title>

Status: PLANNED | IN_PROGRESS | PASS | FAIL | BLOCKED_EXTERNAL_EVIDENCE | NOT_RUN | WITHDRAWN
Started: <ISO timestamp with timezone>
Ended: <ISO timestamp with timezone>
Repository/branch/HEAD: <values>

Objective:
<one precise objective>

Preconditions:
- <condition and evidence>

Commands executed:
1. <exact sanitized command>
   Exit code: <integer>
   Result: <concise factual output>

Files changed:
- <path>: <exact reason>

Artifacts/evidence:
- <path, SHA, CI run ID, Nexus coordinate, or retrievable reference>

Assertions:
- DOCUMENTED: <source>
- OBSERVED: <command/output>
- INFERRED: <reasoning, if unavoidable>
- UNRESOLVED: <missing evidence and owner>

Security/secret check:
<result; never include secret values>

Residual risks:
- <risk or "None observed within this phase">

Exit-condition evaluation:
PASS | FAIL | BLOCKED — <reason>

Next permitted action:
<exactly one next action or approval request>

P0 — Baseline and isolation

No entries yet.

P1 — Controlled integration

No entries yet.

P2 — Minimal implementation

No entries yet.

P3 — Source and policy validation

No entries yet.

P4 — Full test qualification

No entries yet.

P5 — Official local build and artifact inspection

No entries yet.

P6 — Evidence review and external-action gate

No entries yet.

P7 — Commit, CI, and Nexus publication

No entries yet.

P8 — Independent Nexus and NPID validation

No entries yet.

P9 — Final documentation and handoff

No entries yet.

Changed-file ledger

|Path|Phase introduced|Authorized reason|Tests/evidence|Final disposition|
|----|----------------|-----------------|--------------|-----------------|
|—   |—               |—                |—             |—                |

Decision and exception ledger

|ID     |Decision or exception                                           |Authority/evidence           |Status|Supersedes                    |
|-------|----------------------------------------------------------------|-----------------------------|------|------------------------------|
|IMP-001|Install root is `/app/clue`                                     |Owner instruction, 2026-09-26|`PASS`|Earlier `/opt/clue` assumption|
|IMP-002|NPID owns and runs CLUE host content                            |Owner instruction, 2026-09-26|`PASS`|Temporary rehearsal identity  |
|IMP-003|Only authorized protected-file edit is the `CD.yml` install root|Owner instruction, 2026-09-26|`PASS`|Earlier blanket no-edit rule  |

Final delivery record

|Field                           |Value    |
|--------------------------------|---------|
|Final source commit             |`NOT_RUN`|
|CI run                          |`NOT_RUN`|
|Maven coordinates               |`NOT_RUN`|
|Resolved Snapshot/build identity|`NOT_RUN`|
|Nexus artifact                  |`NOT_RUN`|
|Size                            |`NOT_RUN`|
|SHA-256                         |`NOT_RUN`|
|NPID                            |`NOT_RUN`|
|Owner/group under `/app/clue`   |`NOT_RUN`|
|Final classification            |`NOT_RUN`|
|Known limitations               |`NOT_RUN`|
