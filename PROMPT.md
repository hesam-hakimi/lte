Continue CLUE-OPS-ENV-LIFECYCLE in W001CLUEinitialRepo on the reported branch feature/clue-env-lifecycle-20260924. This instruction is self-contained: do not depend on locating the missing overnight prompt.

Resolve and record the actual repository, full HEAD and local changes. Preserve existing work and keep the unrelated fcrm_clue history separate.

Your report establishes reported implementation of environment YAML, claim/move, recovery and verified ZIP completion, with 722 tests passed and 4 skipped. It also says the complete original acceptance criteria were unavailable. Continue from the existing implementation; do not recreate completed components or mark full acceptance complete yet.

The owner already authorized local investigation, gap implementation and offline verification. Continue through fixes and verification without stopping at a plan or requesting routine permission. All engineering output must be English. Account zero-prefix fallback remains deferred.

First produce:
Requirement | Existing function/test | Evidence | Remaining gap

Inspect existing tests before adding work. Missing evidence in the previous report does not prove missing implementation.

Complete these acceptance checks:

1. Configuration
Prove that two selected environment YAML files use isolated input, processing, output and completed paths through the actual entry point. Document defaults/YAML/environment/CLI precedence, relative-path resolution and secret references. Reject missing required settings, missing inbox, environment/profile mismatch and overlapping/aliased lifecycle paths before claiming input.

Do not overwrite operator configuration or silently create a mistyped inbox. Document the supported YAML subset and explicitly reject unsupported syntax.

2. Excel workflow
Run the YAML-driven inbox workflow on an actual multi-sheet XLSX fixture. Verify original tabs/order/visibility, source A:W values, exactly one appended result sheet, the existing 41-column layout, and multi-document associations/provenance.

Show the output workbook and verified archive containing the byte-identical original XLSX. The displayed CSV archive member does not establish workbook preservation. Keep outputs available in output.

3. Readiness and ownership
Verify still-copying files and temporary/lock files are not consumed. Test same-name arrivals, established delivery/redelivery semantics and two independent worker processes competing for one delivery.

Threads alone do not establish process-level behavior. Recovery must not release a live worker's claim or adopt its input. Preserve source identity/hash and avoid overwrites.

4. Restart and cross-filesystem movement
Use fresh processes reopening persisted state after interruption around claim/move, processing, output commit and archive finalization. Count fixture-provider calls and prove committed stages are not repeated.

Exercise EXDEV through deterministic fault injection, including interrupted copy and verification failure. Clearly distinguish simulated checks from an actual cross-filesystem Linux/NAS test. Preserve existing handling of unknown remote completion.

5. Outcomes and archive failures
Test invalid input, output failure, finalized PARTIAL and archive permission/disk failure. Preserve distinct statuses and exit codes. Compression must not convert PARTIAL into success.

After committed output and an archive failure, restart only completion/archiving with no additional provider work. Verify original input bytes and a manifest linking delivery/run, input hash, output identity and outcome before retiring the processing copy.

Repeated completion must create no duplicate output/archive. Do not introduce retention deletion.

6. Installed package
Verify templates, configuration resolution and the existing launcher outside the source checkout using the current package mechanism. Preserve direct-input/export-only compatibility.

A new review package must identify its actual revision and checksum. The earlier a6f3ba4 bundle does not prove this later feature is packaged. Reuse the installer; do not create another one. Report source, installed-package, Windows and Linux checks separately.

7. Documentation and delivery
Update the existing README/operator guide and handoff/backlog. Include actual validation/processing commands, folder transitions, readiness, restart, failure and PARTIAL behavior.

Deliver one acceptance table, focused test results, input/output/archive paths and hashes, and focused local commits. Run broader tests only for a concrete regression risk or required repository gate.

Finish with IMPLEMENTED_AND_VERIFIED_IN_STATED_SCOPE only for evidenced scope; otherwise PARTIAL_WITH_EXPLICIT_REMAINING_GAPS. External infrastructure blockers must not stop independent local work.

No live provider calls or historical batch rerun are needed. Preserve live guards, retrieval/matching, source ISN/date semantics and the historical 16-source/354-row baseline. No push, merge, Nexus publication or operational deployment is requested.
