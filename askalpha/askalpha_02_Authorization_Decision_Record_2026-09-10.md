# askalpha - Authorization decision record

**Record:** ASKTD-ADR-AUTH-2026-09-10 | **Version:** 0.1 | **Status:** Working application design retained; enterprise enforcement contract open

## Decision and authority

Retain the owner's existing direction: askalpha enforces end-user/entity permissions, and the backend uses Managed Identity for approved source access. Do not build continuous synchronization or replication of end-user ACLs from SQL Server, Unity Catalog or every other provider into askalpha.

The latest owner-edited SpruceX gaps email states that the authoritative enterprise mechanism to determine and enforce a user's permitted data remains open. A proposed user-access API is not currently available in the supplied evidence. Therefore this ADR does not claim that the enterprise entitlement source, target provider identity or full end-to-end enforcement is approved or deployed. [U1-U2]

The distinction is between **where the application enforces effective scope** and **who authoritatively grants that scope**. An application enforcement boundary does not authorize the project to invent enterprise entitlements.

## Context and meeting reconciliation

| Evidence | Meaning | Treatment in this record |
| --- | --- | --- |
| Existing architecture direction supplied by Hesam | Application authorization plus MSI; no ACL synchronization | Retained working decision. |
| Meeting M35:06-39:46 | Service identity access with user/group-based restrictions in the application | Consistent in direction; exact enforcement still requires evidence. |
| Meeting M61:10-66:50 | Persona/table-level access and AD-group associations discussed | Candidate bounded pilot approach; workspace membership must not be equated with data privileges. |
| Meeting M67:03-68:40 | User-token propagation and equal access outside the application discussed | Different identity approach; not accepted as implemented or as a replacement for MSI merely because it was asserted in conversation. |
| Owner-edited email, "AskTD - Priority SpruceX Gaps / Dependencies" | Entitlement authority, runtime identity and connectivity remain open | Preserved as current issue status. |
| September security playbook | Entity-level foundation does not prove user-specific row/column enforcement | Retained restriction on claims and on enabled data scope. |

## Proposed responsibility contract

| Concern | Responsibility | Outstanding evidence |
| --- | --- | --- |
| User authentication | Entra sign-in; askalpha validates the token and permitted application context | Actual configuration, audience and group-claim handling. |
| User entitlements | Approved business/IAM grant process; askalpha resolves a versioned effective scope | Named grant authority, trustworthy input, group-object-ID mapping, ambiguous/absent-claim behavior and revocation expectations. |
| Source authentication | askalpha workload identity, MSI where supported by the approved route | Actual provider support, identity registration/grants, network and token audience. |
| Source permissions | Source platform restricts that workload identity to approved objects | Explicit grants, denied raw/bypass routes and applicable view treatment. |
| User-specific restrictions | Deterministic enforcement before protected use or retrieval | Entity controls plus required row/column restrictions for each enabled object. |
| Semantics and classification | Registry/source metadata describe meaning and sensitivity | Never interpreted as an access grant. |
| Audit | Application records initiating user reference, effective scope, service identity reference and outcome | Approved non-sensitive identifiers, correlation, access and retention. |

An MSI connection proves service identity, not the initiating employee's individual data rights. If the service has broad grants, application restrictions must prevent unauthorized retrieval; filtering only in the UI or after LLM transmission is insufficient. Datasets requiring controls that have not been implemented and tested remain unavailable in the pilot. [S3-S4, S8]

## Required request behavior

1. Authenticate the signed-in user and validate the application context.
2. Resolve effective permissions using the approved entitlement mechanism. If absent, invalid, ambiguous or no longer acceptable under the agreed freshness policy, deny protected processing.
3. Restrict metadata discovery, suggestion candidates and planning to permitted scope. Revalidate the selected governed plan and source objects before execution.
4. If a cache or conversational follow-up is enabled, check current effective scope and relevant policy/data versions before reuse. Previously authorized content does not remain accessible solely because it was cached or is in history.
5. Execute a bounded read-only query using the approved service identity and source route, after mandatory authorization and query-safety checks.
6. Validate the bounded result and any additional payload/output restrictions before model transmission, formatting or export.
7. Return a safe outcome with correlation evidence. A permission failure must not trigger a broader principal, raw table or less restricted fallback.

Scope revalidation must cover generated SQL behavior, not just an earlier plan declaration. Resolve the documented emitted-table versus governed-scope hardening item in the slice that owns that risk; do not mark it complete from this ADR. [S2, S6]

## Failure contract

| Condition | Required behavior | Proposed user message |
| --- | --- | --- |
| User is not permitted | No protected retrieval or source execution for the denied scope | "You do not have access to the requested data." |
| Effective scope cannot be established | Fail closed; log a safe reason | "We could not verify your access. Please contact support with reference {correlation_id}." |
| User is permitted, but MSI lacks source permission or connectivity fails | Treat as a source/platform issue; no privilege fallback | "This data source is currently unavailable to the application. Please contact support with reference {correlation_id}." |
| Required row/column treatment is unavailable | Do not query the unrestricted route | "This request is not supported within the currently approved data scope." |

These are proposed product messages, not reported current strings. Keep credentials, tokens, sensitive SQL/literals, raw provider errors and internal paths out of user output. Internal diagnostic detail remains subject to its own redaction and retention rules.

## Options and decision boundaries

| Option | Position |
| --- | --- |
| MSI plus askalpha enforcement from an approved entitlement source | Retained working MVP design; qualify against the actual pilot data and enterprise pattern. |
| Bounded group-to-approved-view mapping for pilot users | Possible interim contract if the responsible business/IAM/architecture owners approve and maintain it. This is not automatically approved by this draft. |
| Per-user delegated execution / token propagation | Open alternative requiring a separate supported identity flow, permission semantics and operational assessment. No switch is authorized by meeting wording alone. |
| Full provider ACL mirroring/synchronization inside askalpha | Excluded from the current working design. |
| Inheriting authorization from metadata classifications or LLM judgment | Invalid. |

Normal identity/group administration and controlled updates to an application's approved mapping are distinct from building a custom cross-provider ACL synchronization service. Likewise, read-only Collibra metadata refresh is not permission synchronization.

## Qualification evidence and owners

| ID | Evidence / decision | Proposed lead | Gate |
| --- | --- | --- | --- |
| AUTH-01 | Grant authority, entitlement contract and group namespace mapping; reconcile historical D8 | Business/Data Owner + IAM + Architecture | Before affected user/data access |
| AUTH-02 | Exact workload identity, target endpoint, audience, grants and network route | Platform + IAM | Before provider route activation |
| AUTH-03 | Authorized/unauthorized personas; missing claims; multi-group scope; revocation; metadata non-disclosure | Engineering + QA | Before pilot acceptance |
| AUTH-04 | Applicable row/column treatment, raw-access denial and emitted-query scope checks | Data Owner/DAC + Engineering + QA | Before affected dataset use |
| AUTH-05 | Cross-user/session/cache isolation and safe source-access errors | Engineering + QA | Before corresponding feature release |
| AUTH-06 | Employee/service correlation and protected diagnostic handling | Operations + Security + Engineering | Before operational handover |
| AUTH-07 | Enterprise confirmation of MSI/app-enforcement versus a delegated-user alternative | Architecture + IAM + Data Platform | Before claiming target authorization resolved |

Named owners, due dates and approval references remain **Open**. The project team can prepare the contract and tests now; it cannot manufacture enterprise grants or attest deployment from documents. Review this record when new data restrictions, providers, Genie execution, identity patterns or user populations are introduced.

Related records: `askalpha_01_Deposits_MVP_Scope_and_Acceptance_2026-09-10.md` and the source register in `askalpha_03_Architecture_Delta_and_Agent_Handoff_2026-09-10.md`.
