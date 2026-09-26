# CLUE Implementation Reference

**Document ID:** CLUE\-IMPLEMENTATION\-REFERENCE\-2026\-09\-26\-R1
**Status:** Controlling implementation baseline
**Scope:** Source integration, official build, Nexus publication, and independent
download/ownership validation for the CLUE deployment package\.

## 1\. Authority and conflict rule

This document records the current owner decisions and the last verified
repository facts\. It is the reference document for implementation\.

The precedence order is:

1. a new, explicit written owner decision recorded in the implementation
   journal;
2. this implementation reference;
3. the implementation phases and acceptance document;
4. current repository evidence;
5. the historical investigation report and screenshots\.

Current repository evidence may show that a SHA, branch relationship, or file
has moved since the last inspection\. That movement must be documented during
Phase 0; it does not silently change the owner decisions in this document\.

The historical file
`CLUE_Deployment_Package_Truth_and_Stepwise_Validation_2026-09-25.md` is an
evidence appendix only\. Its older `/opt/clue`, branch\-count, and authorization
conclusions are superseded and must not be used as implementation instructions\.

## 2\. Delivery objective

Produce the simplest high\-quality release candidate that:

- preserves the intended CLUE application changes;
- inherits the current `origin/main` EDP\-owned build and deployment contract;
- changes the CLUE install root to `/app/clue` through the single authorized
  `CD.yml` edit;
- uses the official Maven Assembly build path;
- passes the complete applicable local qualification;
- is published through the existing CI/XLR process to Nexus after approval;
- is independently downloaded and validated as the environment NPID; and
- leaves complete, reproducible evidence for every phase\.

The required near\-term result is:

```text
NEXUS_DOWNLOADABLE_BUILD_VERIFIED
```

This result does not claim full Salt, AutoSys, PAT, PROD, or production
deployment readiness\.

## 3\. Current owner decisions

|Topic                        |Controlling decision                                                                                                  |
|-----------------------------|----------------------------------------------------------------------------------------------------------------------|
|Install root                 |`/app/clue`                                                                                                           |
|Runtime identity             |Exact environment NPID, verified on the target host                                                                   |
|Ownership                    |The NPID owns CLUE application/runtime content in approved CLUE directories                                           |
|Root use                     |Only narrowly scoped host bootstrap that genuinely requires privilege                                                 |
|Download/extract/validate/run|Execute as the NPID, except a proven platform-owned privileged transport step that leaves the final subtree NPID-owned|
|Build producer               |Existing Maven Assembly implementation                                                                                |
|Publication route            |Existing EDP/XLR pipeline and Nexus                                                                                   |
|`CI.yml`                     |No edits                                                                                                              |
|Every `pom.xml`              |No edits, including `assembly/pom.xml`                                                                                |
|`CD.yml`                     |Only the active install-root/`basename` value may change from `/opt/clue` to `/app/clue`                              |
|Other EDP values             |Inherit current `origin/main` unchanged                                                                               |
|Application work             |Preserve verified integration-branch application changes and corrected `Deliverables/` layout                         |
|Manual rehearsal bundler     |Do not use                                                                                                            |
|Engineering priorities       |Quality first, then the simplest evidence-supported implementation                                                    |

The NPID ownership decision applies to `/app/clue` and separately approved
CLUE runtime\-data directories\. It does not authorize recursive ownership
changes to `/app`, filesystem roots, operating\-system directories, or unrelated
application content\.

## 4\. Last verified repository checkpoint

These values are evidence anchors and must be refreshed in Phase 0:

|Item                                                      |Last verified value                                                                         |
|----------------------------------------------------------|--------------------------------------------------------------------------------------------|
|Integration branch                                        |`integration/edponbaord-main-20260924`                                                      |
|Integration tip                                           |`b9d12e5`                                                                                   |
|`origin/main`                                             |`e0150e3`                                                                                   |
|Merge base                                                |`e846755`                                                                                   |
|Relationship                                              |Integration was 6 ahead of and 9 behind `origin/main`                                       |
|Protected-contract changes on integration since merge base|Zero for `CD.yml`, `CI.yml`, `pom.xml`, `assembly.xml`, `.gitignore`, and `assembly/pom.xml`|
|Deployment-contract changes on main since merge base      |Main changed all six listed files                                                           |
|Maven site output tracked on main                         |16 `target/site/**` files at the checkpoint                                                 |

The integration branch spelling contains the historical string `edponbaord`\.
Do not silently correct or invent the branch name; resolve its current exact
name from Git\.

## 5\. Baseline integration model

Neither historical line is adopted wholesale\. The release candidate is a
controlled union:

1. Start from or bring forward the latest `origin/main` deployment contract\.
2. Preserve the integration branch’s intended application commits\.
3. Preserve its repaired packaged tree, including required configuration and
   lifecycle material inside `Deliverables/` and the
   `test_deliverables_layout.py` regression guard\.
4. Before the authorized path edit, require these files to match current
   `origin/main` byte\-for\-byte:
   - `CI.yml`;
   - every `pom.xml`;
   - `assembly.xml`;
   - `.gitignore`;
   - `CD.yml`\.
5. Then make exactly one authorized semantic change in `CD.yml`:
   `/opt/clue` to `/app/clue` in the active Salt/java\-batch install\-root or
   `basename` field\.

If live evidence makes this union impossible without another protected\-file
change, stop and record `BLOCKED_EXTERNAL_EVIDENCE`\. Do not improvise\.

## 6\. Packaging and artifact contract

- Use the Maven wrapper and the repository’s official Assembly configuration\.
- Do not edit Maven configuration to make the build pass\.
- Do not create an alternative tarball with a manual script\.
- Do not hardcode a timestamped Snapshot URL\.
- The future package input must contain every required application,
  environment, lifecycle, and deployment file under the tree selected by the
  inherited Assembly descriptor\.
- Generated Maven site output, caches, credentials, private keys, `.env`
  files, and unrelated build products must not enter source control or the
  release archive\.
- A successful Maven exit alone is insufficient\. The archive must also pass
  safe member, mode, path, secret, and packaged\-content smoke checks\.
- Nexus publication is successful only when the artifact can be resolved and
  independently downloaded with its identity, size, and SHA\-256 recorded\.

## 7\. Identity and host contract

Root may be used only to:

1. verify the requested NPID and approved group;
2. create `/app/clue` when it does not exist; and
3. assign that exact subtree, plus separately approved CLUE runtime\-data
   directories, to the NPID/group\.

After bootstrap, prove the NPID can perform the approved download,
verification, extraction, read/write operations, and executable entry\-point
checks\. Never grant general administrator rights merely to simplify
deployment\. Never record or expose secret values while proving access\.

The exact NPID, group, Salt extraction behavior, AutoSys entry point, and
environment\-specific runtime\-data paths must be established from the relevant
host/platform evidence\. Unknown values must remain explicit; they must not be
guessed from a comment, screenshot, or temporary rehearsal account\.

## 8\. Authorization boundary

Authorized without another approval:

- read\-only discovery and fetch;
- isolated clean\-worktree integration;
- the single `CD.yml` install\-root change;
- minimal active application/path consistency repairs supported by evidence;
- implementation documentation;
- targeted and full local tests;
- official local Maven build and local artifact inspection; and
- preparation of the Phase 6 evidence packet\.

Requires explicit approval after review of the Phase 6 packet:

- commit;
- push;
- PR creation or update;
- CI/XLR execution;
- Nexus publication;
- target\-host or server access; and
- installation or execution in DEV or another environment\.

## 9\. Stop conditions

Stop the current phase and document the evidence when any of these occurs:

- live Git state cannot be reconciled unambiguously;
- a protected file differs outside the one authorized `CD.yml` change;
- an intended application file is missing from the package input;
- a targeted or full test fails;
- the official Maven build fails;
- the archive contains unsafe paths, unsafe special members, secrets, or
  unexplained content;
- the exact NPID/group or the permitted root action is ambiguous;
- a credential would need to be exposed or repurposed; or
- the next step would cross the authorization boundary\.

Use `BLOCKED_EXTERNAL_EVIDENCE` when the missing fact belongs to EDP,
Platform/Salt, Identity/Unix, AutoSys, or another external owner\.

## 10\. Documentation requirement

The implementation journal is part of the deliverable\. At the end of every
phase it must contain:

- timestamp and source identity;
- objective and preconditions;
- exact sanitized commands and exit codes;
- concise observed results;
- changed files and reasons;
- test/build/artifact evidence;
- secret/safety result;
- residual risks;
- exit\-condition decision; and
- exactly one next permitted action or approval request\.

No success statement may depend only on chat history, a screenshot, an
unexecuted command, or an assumption\.
