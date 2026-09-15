# Agile repair and verification contract

Contract ID: ETL-0909-AGILE-REPAIR-CONTRACT01  
Version: 1.2  
Owner: Hesam Hakimi  
Decision dates: 2026-09-09; reinforced 2026-09-11; documentary clarification 2026-09-14  
Status: OWNER_APPROVED_PROCESS_CONTRACT_WITH_DOCUMENTED_CLARIFICATIONS; NEW_IMPLEMENTATION_PROPOSALS_NOT_ADOPTED  
Reference root: /ETL Copilot Reference v2

The owner requested a revised reference contract so later sessions handle fixes
with fewer unnecessary steps. This document governs how future ETL repair tasks
are scoped, verified and handed off. ChatGPT conversation with Hesam is Persian. ALL Windows development-agent
communication and deliverables are English, including progress, questions and final
responses. This applies to engineering prompts, code, tests and documents too.

The September 14 update records later owner requirements and supplied evidence.
Sections describing earlier tasks remain historical. New customization/test
proposals are not implementation authorization or amendments of the running brief.

## 1. Authority and effective scope

Read the current 01_CURRENT_STATE.json, this contract and the latest applicable
08_DECISIONS_AND_CHANGELOG.md entry before selecting the next task. Read the
complete active brief before acting. Load complete relevant contracts and source
files; reread an unchanged document only when needed to resolve a concrete gap.
A new session still reconstructs the product and safety boundaries from 02 and
05. Archives and complete old report chains are loaded only for needed definitions
or evidence. Record reused source identities rather than re-copying their text.

For future tasks, this contract supersedes blanket process defaults in older
working-model, roadmap, evidence and continuation prose where they would require
full historical rereads, universal qualification checks or expanded evidence
packages for every edit. Current-state pointers supersede old B1/C1 wait pointers.
The impact rules below determine the proportionate future process.

Explicit owner requests and the active task's concrete authority govern execution.
This contract does not grant general permission to run code, launch a Host, install,
publish, release, repair an unexplained baseline or change protected workflows.
Do not ask again for an already-granted action within its stated scope.

Already-issued briefs, expected hashes, reference bytes and original results remain
unchanged. In particular, ETL-0909-R3R4-CORRECTION-TEST03 follows its issued
START_HERE.md and incorporated TEST02 contract until its disposition is returned.
This update does not amend, stop, restart or duplicate a running task. Full B3,
runtime and installed/release acceptance still depend on their outstanding gates.

## 2. Select checks from the actual effect

Choose the highest applicable level from the changed behavior and its consumers,
not from file count, patch size, or whether the change is called a small fix.
Record the choice and affected boundary in a short paragraph in the task brief.

| Level | Change effect | Default verification | Review and acceptance |
| --- | --- | --- | --- |
| DOC | Ordinary prose, navigation or explanatory metadata; no executable, authority, schema or expected-result change | Read the delta; check affected links or JSON structure when relevant | Author verification; no separate code review, compiler, unit, JS build or Host gate solely for this edit |
| LOCAL | Isolated internal behavior with a known testable interface; no public, safety or evidence-trust boundary change | Targeted regression and relevant type/integration check using existing tools | No new standalone independent gate by default; include the delta in the next planned independent review. Honor any already-required review. Label unreviewed work accordingly |
| BOUNDARY | Public/parser result semantics, approval/write/root/process safety, failure classification, evidence identity/counts/persistence, protocol or build provenance | Targeted adverse/positive cases and integration checks that exercise the actual changed decision; static trace of real consumers | Fresh independent review of the changed boundary before relying on its acceptance; actual runtime qualification whenever that runtime behavior is claimed |
| RELEASE | New or rebuilt distributable, normal installed activation or release decision | Traceable source-to-package build, required regression coverage and installed/public-route checks on the actual candidate | Existing candidate/release gates and owner release decision |

Machine-consumed instructions, a glossary definition change, weakened assertions,
or authorization changes are not DOC merely because they are Markdown/JSON.
Classify their operational effect explicitly. Uncertain coupling requires a
bounded inspection first; do not automatically run the full product suite.

R3/R4 outcome classification and TEST03 are BOUNDARY. A green unit fixture is
useful local evidence; it does not establish Host wiring or installed behavior.
An accepted unrelated B1/C1 boundary is reused when the new delta does not affect
its inputs, behavior or consumers. Unchanged files alone do not prove no impact.

## 3. One coherent task, with local feedback inside it

Each newly issued task contains the concrete problem, acceptance behavior, exact
editable surfaces, available inputs, permitted commands/output locations, and
the conditional next gate. Prefer a short delta brief referring to stable files.
Do not embed the whole glossary or all preceding briefs in every new prompt.
Deliver any required exact inputs as physical files with machine identities.

The implementer owns the full authorized loop: inspect, make the smallest coherent
change, execute relevant checks, correct task-caused defects within scope, and
return a reviewable result. A failed assertion, typo or helper error does not by
itself require a new task, new architecture or another owner approval. Retain
each attempt and its outcome; do not rewrite an earlier failure as success.

Future briefs should explicitly permit continuation of an interrupted, unaccepted
task in a new exclusively created attempt directory when the same scope, current
source correspondence and no-concurrent-writer condition are established. Preserve
the earlier attempt. Use a new task ID for a changed scope/authority/baseline
decision, or when the existing brief requires a new execution after termination.
This default cannot override TEST02/TEST03's already-issued disposition rules.

A failed independent review returns concrete findings with changed source and
evidence locations. Correct the in-scope findings and re-review their delta and
affected interfaces. There is no promise of exactly one review or one test run;
unresolved material findings require correction. Avoid repeating the entire
historical audit at every return.

## 4. Reuse checks and build outputs only where their evidence applies

For every proposed check, identify which changed behavior, dependent consumer or
remaining required gate it covers. Reuse valid evidence whose relevant source,
configuration, tools and inputs still match. If those dependencies changed,
repeat the affected check and explain why. Do not rerun to improve presentation
or to reproduce an unchanged accepted result for another report.

For TypeScript edits, use the relevant existing type/integration check and unit
entrypoint. Reuse a matching prior baseline check where valid; otherwise establish
the baseline before interpreting new diagnostics. No blanket requirement for
several identical pre/post checks on a documentation edit.

JavaScript is generated by the compiler. Select the minimum build/output needed
for the authorized check. Do not hand-edit generated JS or require a full product
build for a pure policy test. The source-to-executed-JS relationship must remain
traceable. Existing out/ files cannot qualify newly changed source merely because
an earlier Host run passed.

Plan runtime qualification around the accepted, dependency-coherent set of fixes.
Batch cases that genuinely share the same candidate and prerequisites. Specify
the required positive/negative scenarios and invocation budget in that task;
one qualification campaign may require more than one run. Never replace a
mandatory fault case or installed test with an unrelated happy-path result.

Seek behavioral pre-fix evidence when feasible and useful. Use an existing
authenticated failure if it already proves the defect. Do not reconstruct a fake
old policy or rerun unsafe/unauthorized paths solely to obtain a red screenshot.
Record missing pre-fix comparability; compiler/import failure is not behavioral red.

## 5. Minimal evidence, collected with reusable tools

For future ordinary repairs, the default handoff is:

- report.md: a concise owner summary with result, changed behavior/files, measured
  checks, remaining issues, evidence location and next gate.
- result.json: machine records for source baseline/post-state, exact command and
  tool/input identity, actual exit/test outcomes, review status and evidence links.
- task.diff for source edits, plus the relevant original logs and recoverable
  pre-edit bytes or an authenticated immutable reference to those bytes.

These may consolidate equivalent records. Do not create many separate JSON files
solely because earlier tasks did. Retain additional records only where the active
task or risk boundary requires them, such as write journals or build provenance.
An owner summary must not omit a material finding to fit an arbitrary page limit.

Capture identities, diffs, commands and exits automatically with inspected tools
already available and authorized for the task. Reference existing immutable
evidence instead of cloning the same bundle repeatedly. A supplied manifest may
index reused records, but a manifest alone is not proof their current bytes match.
Record inventories and self-exclusion rules clearly enough to avoid count disputes.

Do not build a general evidence platform, add product dependencies or introduce
large helper frameworks merely to implement this process. Reuse a suitable
existing collector. If a small missing capability warrants automation, define
its own bounded change and meaningful verification; automation development must
not become an invented prerequisite for the current product repair.

For recovery-worktree source changes, preserve the established live identity,
dirty state, pre-copy and unexplained-drift stop rules. Apply preservation checks
to the actual read/write risk and required protected set. A whole-output inventory
is required when the task governs that output boundary or the issued brief says so;
it is not a universal prerequisite for every prose edit.

## 6. Evidence intake and reference delivery

Report photographs are an accepted owner handoff. Read the supplied images in
order. Ask only for a specific missing or unreadable portion when it prevents a
decision; do not repeatedly demand raw files the owner cannot provide.

The local executor/reviewer reads original machine records for hashes, baselines,
diffs and test results. A next-task prompt can require that authentication locally;
it need not contain hashes transcribed from pictures. Distinguish reported results,
independently reviewed scope, live verification and runtime qualification.

Provide required exact reference bytes through a stable physical-file package or
an authenticated repository commit, with integrity and Windows EOL preservation.
Verify the package before handing it off. A chat-rendered appendix or sandbox URL
does not establish a Windows file path. A delivery repository is not automatically
the ETL source baseline. Do not substitute an older local glossary or change a pin
to make delivery pass. Use the already-authorized exact-file provisioning path.

If a required input is missing, first resolve the exact named physical source and
the already-authorized delivery mechanism. Do not conduct a broad history/drive
scan. Stop only the dependent action and identify the smallest unresolved input
or decision. Complete other useful work within scope while it is blocked.

## 7. Decisions, reporting and follow-through

Routine in-scope implementation choices and fixes to this task's own mistakes
belong to the Agent. A new permission/scope requirement, unexplained source drift,
conflicting authoritative reference or protected workflow remains a real stop.
Name the exact cause and the minimum decision needed; do not ask a general
permission question or request the same already-recorded exception again.

Always check actual task disposition before starting. Running means wait;
completed means inspect the returned evidence and select its next gate; missing
report means execution is unknown. Do not launch another writer as an intake aid.

Local completion is not independent acceptance. When independent review is not
yet required or performed, label the work LOCAL_CHECKED_AWAITING_PLANNED_REVIEW,
or use the precise status in its brief. Keep failed tests, unresolved findings
and unexecuted gates visible. Owner release acceptance is a separate event.

After an approved reference update, change the single state record and changelog
and add/update only the governing document needed. Preserve evidence provenance
and original issued briefs. Make the new contract discoverable from current
state so future sessions do not revive obsolete task pointers or workflows.

This decision adopts a process; it does not claim that an evidence collector or
automated build/test workflow has been implemented. It does not accept R3/R4,
renew quarantine, waive earlier deviations or launch TEST03. Measure improvement
from actual later tasks; no time-saving percentage is asserted in advance.

## 8. Historical application at adoption — 2026-09-09

The following paragraph records the adoption-time checkpoint, not today's task.
Use 01_CURRENT_STATE.json and the current checkpoint for continuation.

TEST02 is reported BLOCKED_GLOSSARY_APPENDIX_BYTES_UNAVAILABLE with no source
mutation or compiler/test execution. Exact inputs for TEST03 have been delivered
in tasks/ETL_0909_R3R4_TEST03_INPUTS.zip and published at the recorded hugan commit.
TEST03's execution result has not been received; actual local execution is unknown.
Await its disposition and independently review its actual result when returned.
Do not introduce process-automation implementation as another blocker to that gate.

For its next independent review, use the actual new source/evidence identities
and the issued requirements. For later newly scoped repairs, use this contract's
impact matrix, short briefs, reusable evidence and delta-focused review defaults.

## 9. Owner requirements reinforced on 2026-09-11

The owner is moving to a new session and expressly requires English responses
from the development agent and faster defect resolution with dependable quality.
This is a clarification of the process, not evidence that new automation already
exists. It does not amend immutable issued briefs or restart completed work.

### Language and unavailable vision

- ChatGPT speaks Persian with Hesam. The Windows development agent uses English
  for every progress update, question, explanation, final answer and deliverable.
  Do not append a Persian summary to its responses.
- The Windows agent must not take screenshots, record video, inspect images,
  run OCR or invoke vision services. The owner reports that vision is unavailable.
  Disable capture hooks in reused drivers. Use existing DOM/accessibility text,
  structured tool results, logs and filesystem measurements.
- Previously supplied report photographs remain valid ChatGPT intake; this does
  not authorize Windows image processing. Mark properties requiring unavailable
  visual evidence as unverified; do not replace them with invented PASS claims.

### Fast correction with sufficient quality evidence

- Name the concrete defect, unresolved risk or required acceptance gate before
  adding work. Select checks from that effect and stop optional expansion once
  the defined behavior is sufficiently verified. Keep unresolved findings visible.
- Reuse the final working caller, fixture, helpers, installed candidate and
  compiled outputs. Reuse requires matching relevant source (including dirty
  changes), tests, fixture, dependencies, settings, toolchain and executed outputs.
  Same HEAD or extension version alone is insufficient. Check relevant identities
  once per coherent task; expand only for measured drift or an affected boundary.
- Rerun for changed relevant inputs, invalid or failing evidence, a concrete
  remaining risk, or a mandatory gate. A new task ID, report-format improvement or
  desire to repeat an already accepted narrative is not a rerun reason.
- Add meaningful permanent regression coverage with the relevant authorized
  product repair. Reuse existing repository entrypoints; avoid one script per
  assertion and avoid tests that merely copy implementation logic. Consolidate
  reusable helpers during a relevant authorized code change, not as a new
  prerequisite or during a read-only/smoke-only task.
- An independent reviewer can inspect and reuse common helpers while evaluating
  raw evidence and expectations independently. Independence does not require a
  new catalog extractor, a new runner or a second implementation of the same
  reporting machinery. An incompletely reconstructed oracle is a checker limit,
  not automatically a product defect.
- Keep one concise report and structured result with only necessary source logs,
  identity checks and operation records. Record the final entrypoint, parameters
  and helper paths for the next task. Do not generate a large evidence framework.
- Distinguish product, fixture, caller, infrastructure and reporting failures.
  Twelve passing verification groups are not twelve new permanent tests.
- If reporting fails after an operation, repair reporting from retained results.
  If write outcome is uncertain, inspect the actual result and affected files
  before retrying. Never repeat a product write solely to regenerate a report.
- Reuse the final repeatable job/env caller, which handles both the VS Code host
  tool-confirmation gate and the product's trusted approval gate. The predecessor's
  obsolete one-shot caller consumed its approval slot during rehearsal; do not
  reconstruct that failure. Preserve the recorded no-write rehearsal as history.
- Finish a coherent scenario and retain evidence for one consolidated independent
  review of related write cases. Re-review actual findings and affected interfaces
  if needed; avoid separate reconciliation/review loops for every small output.
  Do not weaken required approval, containment, negative-case or release checks.

### Task continuity

The owner did not send a previous active-run efficiency addendum because the
single-root job/env task had already finished. Record that addendum as unsent;
do not claim it governed the completed run. Apply these requirements prospectively.
The multi-root/overwrite prompt has been issued, but no result has been received
at this checkpoint. Check its disposition before issuing any replacement task.
Missing results are UNKNOWN execution state, not permission to launch a duplicate.

## 10. September 14 clarification: coverage and local reuse

The owner has no CI/CD process or access and wants less repeated setup, earlier
defect detection, and reuse of existing helpers and valid outputs. All development
work remains in English; ChatGPT conversation remains Persian. Updating these
reference documents does not execute any proposed repo customization.

### Match verification to the failure mechanism

A real composed test must retain the component under investigation. The audit
found approval/binding suites with no-op validation pipelines. Preserve their
isolated value, and cover the actual transformation validator when replaying the
SQL/include failure. Historical accepted bytes are useful input fixtures but are
not automatically a valid success oracle: the .155 path-in-sql write now has a
reported Framework-contract defect. Ground expected results in the producer and
consumer contract and the active repair's final reviewed disposition.

Source replay begins after model generation. It cannot establish that the
installed Orchestrator chooses the right suffix or representation on its own.
Reuse the active task's authorized installed qualification for that separate
boundary. Do not repeat package/install/model work just to prove a tests-only
runner change that has no shipped dependency, after checking the actual boundary.

### Reuse the existing execution surface

Reuse authenticated b1-lane.js, t1-run-suites.js, focus selectors, collector,
fixture and command interfaces. A result is reusable only for the relevant
source, tests, shipped assets, configuration, dependencies, toolchain and compiled
output identities. HEAD or the display version alone does not establish this.
Classify evidence as measured now, reused with matching inputs, or unexecuted.

Inspect command side effects before use. The audited normal compile/test:unit
path deletes shared out; compile:test writes out and tracked .tsbuildinfo.test.
A skills command list does not authorize changing protected recovery outputs.
Use the existing isolated lane. Avoid regenerating helpers, entire fixture trees
or baseline reports when the necessary identity and result already exist.

The five missing headless registrations, two real-validator replays, and small
runner timing/result additions are proposals documented in note 14. They are
not completed tests. writeFlow's nine failures require classification before
adding that suite or making a green-run claim. No-new-regressions is distinct
from all tests passing; do not extend an expired quarantine or silently waive an
unexplained failure.

### Keep active work and approvals coherent

ETL-0914-JOB-JSON-SQL-INCLUDE-QUALIFY01 is running per the owner. Its final review
and installed outcome are not received. Its existing bounded delivery authority
persists and its product-write budget stays zero, ending at genuine Cancel.
Do not launch a duplicate, edit its owned files concurrently, or treat an audit
suggestion as a reason to ask again for the same routine authorization. A later
real write needs its own fresh bounded authorization because the historical
.154/.155 allowances are spent.

The audit can be used at a safe checkpoint by the implementation owner. Otherwise
wait for ownership release and apply only the remaining scoped follow-up.
A changed candidate must have its own identity and applicable qualification;
whether maintainer rules should track this as a new attempt within the same goal
is a proposed workflow improvement, not a retroactive rule change.

### Measure and report the actual cost

The audit's compiler durations were seconds, while the overall .156 task took
57m42s. Several intervals overlap; helper-authoring and review durations remain
unknown after bulk mtime changes. Do not invent a speed-up estimate or blame all
time on compile. Add small start/end/duration fields to existing result output
when that change is undertaken, and preserve actual failures and exit codes.

One concise report and structured result are normally sufficient for a bounded
follow-up. Reviewer output must retain its authorship: parent persistence of a
read-only review is not an independently authored reviewer file. The maintainer
agent-routing, instruction-scoping and own-report-output proposals remain pending
and must not interfere with the active product repair.
