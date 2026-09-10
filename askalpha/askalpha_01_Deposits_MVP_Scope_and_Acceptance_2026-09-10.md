# askalpha - Deposits MVP scope and acceptance

**Prepared:** 10 September 2026 | **Version:** 0.1 | **Status:** Review-ready planning draft

**Purpose:** Deliver a bounded conversational analytics pilot for Deposits, with trusted answers, explicit access controls and measurable business value. This records the direction of the leadership meeting; exact datasets, accountable owners, acceptance thresholds and release approvals remain open.

## Delivery boundary

| Area | Proposed MVP boundary |
| --- | --- |
| Environment | SpruceX pre-production validation, including approved production-origin data where the specific access and use are authorized. Pilot acceptance is separate from production release. |
| Business domain | Deposits first. Digital and other portfolios remain expansion candidates. The exact use cases, KPI definitions and source inventory require the Deposits owner's confirmation. |
| User experience | Authorized users ask analytical questions and receive bounded answers, tables and basic approved charts. Ambiguous requests trigger clarification; unsupported questions receive an explicit limitation. |
| Data and calculations | Approved source objects, governed definitions and recipes, with source and as-of information. No invented joins, grain, relationships or business definitions. |
| Identity | askalpha applies effective user permissions; the working source-access model uses Managed Identity. The enterprise entitlement mechanism and actual provider connection require confirmation and tests. See the authorization record. |
| Source route | Prefer the meeting's proposed Unity Catalog-governed Databricks route if available and approved. Preserve an explicitly approved interim route; document whether DAC/AZ/Consumption access is a query or a data copy. No automatic fallback that broadens access. |
| Output | Deterministic approved presentation where available; preserve values, filters, warnings and provenance. Result-assisted AI formatting remains disabled until its specific payload and use are approved. |
| Follow-up questions | Bounded continuation within the same analysis is a proposed scope option. Confirm whether included before setting the acceptance baseline. Advanced exploration is later work. |
| Exclusions | Autonomous business actions, source writes, unrestricted raw-data access, broad cross-source joins, automatic model retraining, advanced what-if analysis and unapproved exports. |

**Scope reconciliation:** The documented engineering foundation is one governed dataset, one approved recipe and 199 evidenced fields. This does not establish the approved Deposits business inventory. The September security playbook also references an older lending/sales business-data request. Map, replace or exclude those use cases explicitly; do not relabel either historical scope as the new Deposits pilot. [S1-S4, S7-S8; M06:01-06:48, M97:41-99:04]

## Proposed acceptance criteria

All criteria below are requirements to evidence, not claimed test results. Named reviewers and quantitative thresholds must be recorded before evaluating the pilot.

| ID | Acceptance criterion | Required evidence / proposed accountable function |
| --- | --- | --- |
| A01 | Scope and owners are explicit | Approved question/KPI list, datasets and views, users/personas, data treatment, business/model owner, application owner and pilot exit authority. Business + Product + Data Governance. |
| A02 | Authorized requests work; prohibited or unresolved scope fails closed | Positive and negative tests across metadata discovery, queries, results and any history/cache/export. Required row/column restrictions are proven for the enabled data. IAM + Engineering + Data Owner. |
| A03 | Source route is governed and repeatable | Endpoint, compute, identity grants, approved object mapping, freshness and source-load limits; connection and permission-denial evidence. Platform + Data Owner. |
| A04 | Answers agree with business-approved expectations | Versioned benchmark questions with reference calculations/SQL, fixed data snapshot or as-of time, persona, expected outcome and reviewer. Preserve totals, grain, units and filters; do not require identical prose. Business SME + QA. |
| A05 | Ambiguity and unsupported requests are handled safely | Tests for missing period, ambiguous KPI, unavailable fields, invalid relationships and requests outside scope. Product + QA. |
| A06 | Semantic changes produce the correct lifecycle outcome | Relevant dependency changes, missing/ambiguous evidence and invalid approval produce explicit outcomes; unrelated metadata changes do not invalidate a recipe. `REVIEW_REQUIRED` execution policy requires the designated owner's decision. Engineering + Governance. |
| A07 | Presentation preserves the validated result | Tests for numerical fidelity, sources, as-of dates, filters and warnings; no unapproved result-data transmission to an LLM. Engineering + QA + Privacy. |
| A08 | Enabled model and trace paths are accounted for | Verified LLM-call inventory and payload contracts; correlation across route, versions, execution and outcome; approved telemetry content, storage, retention and AIOBS integration evidence or a formally accepted interim arrangement. Engineering + enterprise observability owner. |
| A09 | Operational and business value is measured | Agree p50/p95 response-time goals, cold/warm behavior, concurrency, failure rate, freshness, source impact, cost per correct accepted answer and time saved versus the current process. Platform + Operations + Business. |
| A10 | Pilot use and release are authorized within their actual scope | Applicable PIA/DAC/AI governance decisions, MRM disposition and conditions, support contacts, rollback/disable procedure and pilot duration/exit review. Existing approvals must be referenced rather than repeated. Respective authorities + application owner. |

Critical authorization, prohibited payload and material answer-integrity failures block the affected route. Other thresholds and permitted exceptions require the relevant owner's recorded decision. A reduced pilot is possible only with an explicitly revised, approved scope and corresponding evidence.

## Delivery sequence

| Workstream | Near-term work | Later expansion |
| --- | --- | --- |
| Core product | Verify the current 2F baseline; finish applicable lifecycle/policy, certified meaning and bounded output work. | Broader recipes, self-service and advanced reports. |
| Pilot readiness | Bring the minimum access, evaluation, trace and performance evidence into the pilot acceptance gate. | Full Phase 4-7 hardening and scale roadmap. |
| Data and semantics | Confirm Deposits route and definitions; agree Collibra ownership, mapping and refresh contract. | Read-only metadata ingestion and additional sources. |
| Strategic integration | Evaluate one Genie domain and identify the first on-premises use case in parallel. Neither is a default core-pilot dependency. | Integrate only after business, access, accuracy, latency, cost and ownership gates pass. |

Use the existing executive milestones: **MVP 1 - Foundation & Trust; MVP 2 - Enterprise Integration & Efficiency; MVP 3 - Advanced Visualization.** Engineering phases are not renumbered. Basic pilot charts and optional bounded follow-ups do not imply completion of the advanced visualization milestone. [S9, pp. 5-9, 12-17]

## Decisions required to finalize this scope

| Decision | Proposed accountable function | Status |
| --- | --- | --- |
| Exact Deposits use cases, source inventory, users and reference answers | Business sponsor + Data Owner | Open |
| Entitlement authority and interim/target source route | IAM + Architecture + Data Platform | Open |
| Follow-up depth and required basic charts | Product + business reviewers | Open |
| Model/use-case owner, application/infrastructure owner and support funding | Business leadership + Technology leadership | Open |
| Acceptance thresholds, pilot duration, review date and go/no-go authority | Business + QA + Operations | Open |

No delivery date, cost saving, serverless availability or enterprise approval is established by this document. The meeting's architecture-approval statement is reported evidence only. The source register and detailed engineering actions are in `askalpha_03_Architecture_Delta_and_Agent_Handoff_2026-09-10.md`.
