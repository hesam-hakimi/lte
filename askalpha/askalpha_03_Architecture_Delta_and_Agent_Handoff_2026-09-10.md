# askalpha - Leadership architecture delta and engineering handoff

**Prepared:** 10 September 2026 | **Version:** 0.1 | **Status:** Review-ready planning addendum

This package was prepared directly from the available project documents, the supplied leadership-meeting transcript and the owner's latest edited SpruceX gaps email. No repository checkout, live platform configuration, model endpoint or approval record was audited in this task. The package is ready for document review and engineering impact assessment; it is not a runtime implementation or deployment attestation.

**Repository copy:** Project-facing wording and the three package filenames use `askalpha`. Historical source paths, document identifiers and the quoted email subject are retained for traceability.

## 1. Read and use this package

1. `askalpha_01_Deposits_MVP_Scope_and_Acceptance_2026-09-10.md`: pilot scope, acceptance evidence and owner decisions.
2. `askalpha_02_Authorization_Decision_Record_2026-09-10.md`: MSI/application authorization direction and unresolved enterprise contract.
3. This document: reconciled deltas, phase mapping, LLM inventory requirements and a bounded agent task.

These documents supplement the historical handoff. They do not rewrite verified commits, close existing gaps, impose new runtime approvals already satisfied elsewhere, or infer authorization for unrelated engineering work. Preserve the owner's existing explicit authorizations; do not treat older "not authorized" historical text as a revocation of later permissions.

### Evidence labels

| Label | Meaning |
| --- | --- |
| Documented baseline | Recorded in reviewed project evidence; not live-reverified today. |
| Reported | Claimed in the meeting or newer reporting; supporting runtime/source evidence not inspected here. |
| Working decision | Existing owner direction or a documented architecture choice; enterprise acceptance/activation may still be open. |
| Proposed | Recommended scope, gate or implementation sequence requiring the relevant decision. |
| Open / conditional | Missing evidence or an approval-dependent feature; no completion inferred. |

## 2. Reconcile the baseline before changing code

| Item | Evidence and interpretation |
| --- | --- |
| Accepted foundation | Handoff records through Phase 2E, including PR #17, one governed dataset, one approved recipe and 199 evidenced fields. [S1-S6] |
| Historical `main` | `f283f01b6d615f9fa00debcef959d9c5c86a3224`, verified in the 26 August record. This is not asserted to be today's HEAD. |
| Phase 2F.1 | The August scope document describes preimplementation discovery. The newer September roadmap reports implementation and independent review, with final merge/activation still unverified. Do not restart or declare completion from either document alone. [S6, S9 pp. 4, 16-17] |
| Actual Phase 2F scope | Recipe lifecycle first, then approval/reapproval policy, certified semantics, output templates, evidence-backed relationship impact and deferred hardening. It is not solely an output-template/dynamic-suggestion phase. [S6] |
| Recipe compatibility | Based on the recipe's governed dependency evidence/fingerprint. A global `registry_version` change caused by unrelated entities must not invalidate every recipe. [S3-S4, S6] |
| Existing cache | Bounded metadata/snapshot caching is documented. Early request/result-cache rollout is planned. Do not call all caching either absent or delivered. [S2, S9 p. 16] |
| Pilot inventory | Existing engineering evidence and the older lending/sales PIA inventory do not establish the new Deposits business scope. Mapping and approval remain required. [S7-S8, M] |

## 3. Architecture deltas to carry forward

| ID | Delta / clarification | Action and status | Evidence |
| --- | --- | --- | --- |
| D01 | Deposits-first conversational analytics | Draft the exact question, data, persona and output scope. Keep autonomous business actions and broad what-if analysis outside MVP. Meeting direction; detailed scope proposed. | M06:01-06:48, M85:00-99:04 |
| D02 | Runtime semantics versus enterprise ownership | Keep `MetadataRegistryService` / `RegistrySnapshot` as the single runtime semantic contract. Preserve source IDs, owners, definition versions and publication evidence; do not create a competing enterprise catalog. | S3-S4, S9 p. 13, M24:22-32:34 |
| D03 | Authorization without ACL synchronization | Retain MSI plus application enforcement. Resolve enterprise entitlement authority and provider identity separately; do not infer user-level source enforcement from sign-in or the MSI. | U1-U2, S8, M35:06-39:46, M67:03-68:40 |
| D04 | Governed data route versus compute | Identify Databricks compute/endpoint, UC catalog/schema/views, workspace and physical data separately. UC enablement alone does not close latency, access, freshness or connectivity gaps. | U1, M56:46-60:43 |
| D05 | Clarification before unsupported execution | Define expected behavior when KPI, period, grain, filter or permitted scope is ambiguous. Do not assume every question can produce valid SQL. | M47:12-47:51 |
| D06 | Bounded conversational context | Decide whether same-analysis follow-ups are in the pilot. Preserve filters, period and provenance; revalidate permissions and dependencies on every turn. Do not use history to bypass current scope. | M85:19-88:40; proposed scope boundary |
| D07 | Recipe lifecycle and reuse | Preserve the deterministic lifecycle and dependency-scoped compatibility. Keep `REVIEW_REQUIRED` runtime warn/block behavior with its designated policy owner; do not invent approval evidence. | S3-S4, S6, M46:20-47:12 |
| D08 | Cache before avoidable LLM work | Retain the early authorized lookup design and a separate post-plan result cache. Separate recipe reuse, result reuse and physical data materialization; none proves the others. | U2, S9 p. 7, M14:35-23:14 |
| D09 | Explicit deterministic formatting | Templates reference Registry IDs/versions. Preserve validated values, scope, warnings, sources and dates. Keep AI result formatting conditional and disabled until approved. | U2, S7-S9 |
| D10 | Evaluation as a pilot gate | Bring a bounded business-approved question suite and access/answer-integrity regressions into pilot acceptance; broader Phase 5 capability stays on its roadmap. | M92:35-96:43; sequencing proposal |
| D11 | Enterprise observability integration | Identify the actual Layer 6 library, enterprise AIOBS contract, ADLS path and trace schema/retention. Record decisions and evidence, not an assumed complete capture of model reasoning. | M47:56-49:17, M79:06-80:17 |
| D12 | MRM use-case ownership and LLM inventory | Produce source-backed call inventory. A question-to-final-answer system-level assessment was proposed; MRM must confirm scope and model/use-case ownership. | M03:19-08:00, M72:51-78:59, M99:29-101:18 |
| D13 | Targeted integration discovery | Preserve the latest roadmap: Genie evaluation, on-premises discovery and Collibra contract work can run during MVP 1; implementation is conditional and generally aligned to MVP 2 / Phase 3. | S9 pp. 8-13, 17 |
| D14 | Operational ownership and economics | Assign application/infrastructure/support ownership and size from a workload envelope. Treat cost scenarios as assumptions; measure total forward cost per correct accepted answer. | M49:17-57:12, S9 pp. 10-11 |

### Semantic ownership contract

The business/data owner approves meaning. Collibra may supply the enterprise-approved definitions, relationships and classifications within its confirmed coverage. Unity Catalog supplies applicable Databricks object metadata and governance. askalpha validates and publishes those inputs into its versioned runtime Registry. Templates and suggestions reference that Registry instead of redefining semantics.

Until a supported metadata interface is available, a bounded, owner-approved manual intake can be an interim proposal. Record provenance, mapping, validation and publication evidence. Do not make Collibra a live per-question dependency or assume Collibra/UC bidirectional synchronization already exists. Metadata integration remains separate from entitlement administration. [S9 p. 13; M28:35-32:34]

### Cache and recipe compatibility contract

- Authenticate and resolve current permitted scope before early reuse. A cache hit cannot bypass current access, approval, treatment or freshness requirements.
- Early keys use pre-plan information, such as normalized request/template and parameters, effective scope, source/data freshness, relevant policy/semantic identity and output contract. They cannot require a plan hash that does not yet exist.
- A post-plan key can add plan/recipe/dependency identity. Include effective row/column constraints if those affect the result.
- A global Registry version may be a conservative cache key component. This does **not** change dependency-scoped recipe lifecycle semantics: unrelated Registry changes can cause a cache miss without invalidating a recipe.
- Reusing a recipe can avoid planning/SQL-generation calls; it does not automatically avoid querying current data or approved summarization. Only a valid reusable final response can avoid both, where all current checks pass.
- Keep payloads bounded. Approximately 5 TB is source planning context, not a cache target or proven capacity. Query filtering, joins and aggregation stay on the approved data platform.
- Do not add Redis/AMR, nightly materialization, liquid clustering or serverless as new mandatory dependencies solely from meeting suggestions. Confirm the exact platform product, ownership, approved availability and representative workload evidence.

### Output and audit contract

Use explicit presentation routing. An approved template takes the deterministic path; any enabled AI-formatting alternative receives only its specifically approved minimized context and must preserve analytical meaning. The meeting's illustrative code-generation example does not direct implementation of an unrestricted generated-code executor.

All LLM routes, including planning and clarification, require an input contract: free text, metadata, history and SQL can also contain sensitive values. A result-formatting approval is not a blanket approval for every call, and an approved data query is not automatic permission to transmit its result to a model. [S8]

Trace evidence should link request, effective scope reference, Registry/dependency identity, recipe lifecycle, selected route, model/deployment, query execution, output validation and outcome. Record safe reason codes and observable events; do not promise hidden chain-of-thought capture or retain raw payloads by default. Reuse the approved enterprise SDK through a bounded integration seam; confirm its supported package/version instead of treating transcribed framework names as an implementation standard.

## 4. Phase and milestone impact

This is a proposed sequencing adjustment, not phase completion or renumbering.

| Existing slice | Required impact review |
| --- | --- |
| 2F.1 - Lifecycle evaluator | Verify actual implementation/integration first. Preserve purity, deterministic reasons, dependency identity, feature-flag compatibility and current gates. No cache, provider or UI work is added to this slice. |
| 2F.2 - Approval/reapproval | Resolve authority, expiry and `REVIEW_REQUIRED` policy using recorded decisions. Do not let engineering invent acceptance evidence. |
| 2F.3 - Certified semantics | Define enterprise provenance, Deposits KPI/glossary ownership and the Collibra mapping/refresh contract. API implementation is separate. |
| 2F.4 - Templates | Versioned Registry references; deterministic output selection; integrity/provenance tests; authorized suggestion behavior wherever suggestions actually live. |
| 2F.5 - Relationship impact | Preserve D4-D6 evidence prerequisites: fields, governed endpoints and naming. No guessed joins or Graph DB requirement. |
| 2F.6 / relevant hardening slice | Verify emitted query objects against governed scope and qualify added recipes. Bring forward only the controls needed for the approved pilot's actual risk. |
| 2G - Controlled publishing, as referenced by the executive roadmap | Locate the actual task/contract before relying on this phase label. Ensure releases/rollback preserve template, recipe, policy and dependency compatibility. Detailed 2G source definition was not available in the reviewed files. |
| Phase 3 | Bounded provider/Databricks integration, identity, dialect/query pushdown and conditional Genie/on-premises/metadata adapters. |
| Phases 4-6 | Preserve the full hardening/evaluation/performance roadmap; pull a minimum evidence slice into MVP acceptance so the pilot does not precede basic control and quality proof. |
| Phases 7-8 | Broader self-service, richer reports and governed export after pilot and integration evidence. |

MVP 1 remains Foundation & Trust, MVP 2 Enterprise Integration & Efficiency, and MVP 3 Advanced Visualization. Broad action-taking agents and advanced what-if scenarios are future concepts without a delivery commitment here.

## 5. LLM-call inventory for MRM

**Current verification status: not source-verified. Actual call count, providers/models, call-site paths, payloads, retry counts and runtime enablement remain unknown in this document.** The meeting's "five LLM calls" was illustrative. Agent names and model names are not call counts.

The rows below are an inspection checklist, not an attested architecture inventory:

| Candidate function to inspect | Question for the repository agent | Evidence needed |
| --- | --- | --- |
| Intent/clarification | Is this deterministic, model-assisted or mixed? The meeting reported pattern-based intent routing. | Actual branches, conditions and caller. |
| Semantic/report planning | When is a model called versus an approved recipe reused? | Input fields, Registry scope and version, output schema and validator. |
| Query generation | Is SQL generated by a model on this path or by deterministic builders? | Actual helper/call site, allowed schema context and SQL validation. |
| Plan/query review or repair | Are there separate model reviews, retries or error-triage calls? | Trigger, sanitized error payload, maximum attempts and metering. |
| Summary/report writing | Does a call receive actual result rows, aggregates or prior response text? | Exact approved/minimized payload class and output checks. |
| Visualization/presentation | Is the route template-based, model-generated specification or code generation? | Feature flag, validator, renderer boundary and permitted payload. |
| Dynamic suggestions/follow-ups | Are suggestions generated by an LLM and can they expose restricted metadata/history? | Permission checks, context handling and provenance. |
| Evaluation/offline jobs | Are there evaluator models outside the user request path? | Separate purpose, data boundary, cost and approval coverage. |

For every actual invocation path, record: stable call ID; repository and exact revision; caller and centralized model helper; business purpose; trigger/skip conditions; enabled flag; model/deployment policy; each input category; PI/PII exposure and minimization; expected output schema; deterministic checks; retries/fallbacks; trace and persistence/retention behavior; applicable use-case approval reference; owner; and source/runtime evidence status.

Capture representative payload **schemas or synthetic examples**, not production records or secrets in the report. Static evidence does not prove deployed configuration. A later authorized runtime observation should record observed call counts for one recipe hit, one free-form request, one clarification and one repair path where supported; do not run those against live data as part of a document-only task.

## 6. Open dependencies and accountable functions

The five High items in the latest owner-edited email remain open in this package. No item is closed by the meeting or by drafting documents.

| ID | Dependency / decision | Proposed lead | What closes it |
| --- | --- | --- | --- |
| G01 | End-user entitlement mechanism and enforcement contract | IAM + Architecture + Data Owner | Approved contract and effective-access evidence. |
| G02 | Enterprise metadata sources, API/service and refresh | Data Governance + metadata platform owners | Approved coverage, mapping, ownership and refresh/failure contract. |
| G03 | Interim and target governed data path | Data Platform + DAC + Architecture | Exact object/treatment/copy/freshness mapping and approved route. |
| G04 | Query-serving model and latency/concurrency | Data Platform + Operations | Approved endpoint and measured workload/SLO/cost evidence. |
| G05 | Workload identity, groups and network connectivity | IAM + SpruceX + Network | End-to-end identity, grants, DNS/firewall and deny tests. |
| G06 | MRM use-case owner and assessment boundary | Business + MRM, with governance coordinator | Named accountable business owner and accepted assessment scope. |
| G07 | Application/infrastructure registration, ownership and support | Technology leadership + Platform | Named owners, required application record, support and funding path. Exact internal registration acronym must be confirmed. |
| G08 | Reference questions, expected answers and evaluation ownership | Deposits SME + QA + Product | Approved suite, thresholds, reviewers and review cadence. |
| G09 | Enterprise observability SDK and AIOBS integration | Enterprise observability owner + Engineering | Supported contract, deployed integration evidence and permitted trace handling. |
| G10 | Pilot-to-production transition | Application owner + relevant governance authorities | Separate production-readiness evidence; SpruceX pilot success alone is insufficient. |

PIA, DAC and production-data governance were reported as progressing in parallel. Reuse existing completed approvals when their scope matches; identify the remaining conditions without restarting completed processes. No individual is assigned an unconfirmed responsibility based on transcription guesses.

## 7. Bounded task for the engineering agent

The three documents are already prepared. Use the task below only to reconcile them against actual engineering evidence and update the engineering plan. It does not require the user to regenerate these documents.

```text
askalpha - Source-backed impact review and LLM inventory

Speak Persian with Hesam; keep engineering documents and code in English.
Read the three 2026-09-10 Leadership Alignment documents completely, plus the
current repository task, applicable AGENTS.md and later verified checkpoints.
Use the owner's latest explicit authorizations. This notice does not revoke
existing authority and does not independently authorize unrelated changes.

Environment: the existing askalpha engineering repository and current approved
development checkout. Resolve its exact identity from current evidence; do not
assume a historical branch or SHA is the current baseline. SpruceX, production
data, provider endpoints and deployed resources are not execution targets for
this review.

1. Establish the actual current phase/slice, repository, branch, commit, dirty
   state, acceptance evidence and feature activation. Reconcile historical 2E
   and newer reported 2F.1 status; do not restart accepted work.
2. Map each D01-D14 delta to actual files, contracts, tests and planned slices.
   Classify: already satisfied, evidence missing, bounded change needed,
   documentation-only, future-only or external decision required.
3. Preserve dependency-scoped recipe compatibility and lifecycle-first 2F
   sequencing. A changed global registry_version must not invalidate unrelated
   recipes. A cache miss is not a recipe-lifecycle failure.
4. Preserve MSI plus application authorization as the working design, no custom
   cross-provider ACL synchronization, metadata-never-grants-access, and the
   open enterprise entitlement contract. Report concrete control gaps; do not
   silently replace the design with user-token propagation.
5. Extract a source-backed LLM invocation inventory using Section 5. Trace
   central helpers back to their callers, flags, retries and payload builders.
   Distinguish deterministic paths, potential calls and enabled runtime calls.
   Do not invent a count or expose credentials or production values.
6. Produce ARCHITECTURE_DELTA_IMPACT_REPORT_2026-09-10.md and
   LLM_CALL_INVENTORY_2026-09-10.md, with exact source revision and unresolved
   evidence. If no actual runtime evidence exists, state that explicitly.
7. Update the relevant engineering plan/documents under existing authorization:
   keep 2F.1 bounded; map semantics/templates to the actual later 2F slices;
   identify minimum pilot safety/evaluation/trace/performance work; preserve
   parallel Genie/on-premises/Collibra discovery without making integration a
   default core-pilot dependency. Verify any 2G task before relying on its label.
8. Recommend the next smallest necessary implementation slice with acceptance
   evidence and dependencies. Do not make broad code, provider, deployment or
   data changes solely because this planning addendum exists.

Use read-only source inspection for this review. Existing data-access approvals
do not imply authorization to invoke live models or query real data for it.
Do not send emails/messages, modify deployments or change PR state as part of
this review. Return the evidence-backed outputs and any separate action needed.
```

## 8. Evidence register and precedence

Apply the latest explicit user direction first. Treat meeting statements as reported direction, questions or proposals according to their wording. Use the latest document for planning context while preserving the date and scope of historical engineering evidence. None of these sources replaces a live repository/platform check.

| Ref | Source reviewed | Use and limitation |
| --- | --- | --- |
| M | Leadership meeting transcript supplied in this conversation, 00:00-107:17; described by the user as today's meeting | Deposits focus, platform independence, ownership, MRM, access ambiguity, trace/evaluation and staged optimization. Calendar date is inferred as 10 September 2026 from the session; speaker identities and garbled acronyms are not reconstructed. |
| U1 | Latest user-edited email block 58321, subject "AskTD - Priority SpruceX Gaps / Dependencies", addressed to Lalit | Authoritative user wording of the five current High gaps and parallel governance activity. Reviewed as supplied; not sent or modified. |
| U2 | User-supplied architecture discussion and prior Phase 2F agent notice in this conversation | Explicit no-ACL-sync/MSI direction; early cache, Registry references, deterministic formatting and controlled publication. Reconcile older simplified phase and global-version wording with the detailed accepted baseline. |
| S1 | `/AskTD/Handoff 2026-08-23/AskTD_01_Authoritative_Current_State_2026-08-23.md`, updated 26 August | Historical 2E/PR #17 baseline and 199-field pilot; not today's source state. |
| S2 | `/AskTD/Handoff 2026-08-23/AskTD_02_Implementation_Phase_Status_2026-08-23.md`, updated 26 August | Engineering phase map and bounded metadata cache. |
| S3 | `/AskTD/Handoff 2026-08-23/AskTD_03_Architecture_and_Roadmap_Update_2026-08-23.md`, updated 26 August | Runtime contracts, entity-scoped compatibility, provider boundary and scale context. |
| S4 | `/AskTD/Handoff 2026-08-23/AskTD_04_Assumption_Decision_Log_2026-08-23.md`, updated 26 August | Preserved invariants and D1/D4-D9 open decisions. |
| S5 | `/AskTD/Handoff 2026-08-23/AskTD_05_Management_Roadmap_and_Feature_Map_2026-08-23.md`, updated 26 August | Historical business-value and phase map. |
| S6 | `/AskTD/Handoff 2026-08-23/AskTD_09_Phase_2F_Scope_Discovery_2026-08-26.md` | Detailed 2F.1-2F.6 ordering and dependency-specific acceptance. |
| S7 | `/AskTD/askalpha_Executive_Update_for_Copilot.md`, updated 9 September | Documented pilot and Foundation & Trust reporting. Later integration positioning is taken from S9. |
| S8 | `/askAlpha_SpruceX_Governance_and_Security_Playbook_2026-09-09.md` | Real-data SpruceX distinction, historical business-data scope, user/service identity boundaries, PIA and three-state evidence requirements. Draft, not approval. |
| S9 | `/askalpha_Executive_Roadmap_Genie_Cost_70_30_Updated.pdf`, saved 10 September; all 17 pages reviewed | Latest executive milestones, parallel discovery, reported 2F.1 status, Collibra ownership and cost caveats. The 70/30 budget scenario is not measured TCO or an accepted infrastructure quote. |
| S10 | `/AskTD/Handoff 2026-08-23/AskTD_00_Library_Index_2026-08-23.md` | Historical handoff navigation and status scope. |
| S11 | `/AskTD/AskTD_LATEST.md`, pre-update version 3 | Existing navigation pointer; supplemented with this planning package without replacing engineering evidence. |

The September roadmap cites a 1 September impact report in its evidence notes. That underlying report was not resolved in the available document search and is not claimed as directly reviewed. Repository review must resolve it, if present, before treating it as source-level acceptance evidence.

## 9. Document-level completion

Completed here: source reconciliation, Deposits scope and proposed acceptance criteria, authorization decision record, architecture deltas, phase mapping, dependency/owner register and a bounded source-review task.

Outstanding: exact current engineering status, actual call-site/payload inventory, enterprise decisions, actual data approvals, numerical service targets, named owners and runtime qualification. These require repository evidence or the responsible organizational owners; running a generic prompt cannot supply their missing approvals.
