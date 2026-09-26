Subject: CLUE deployment baseline decision required before packaging changes

Read-only comparison of branch integration/edponboard-main-20260924 (HEAD b9d12e5) against origin/main (e0150e3, containing merged PRs #22, #23 and #24 from feature/edponboard/):

* Ahead of origin/main by 6 commits — all application code: Symcor, capture-guard, and runtime-secrets.
* Behind origin/main by 9 commits — all EDP onboarding: “updates for userID,” “lb changes,” and “script changes.”

Merge base: e846755 (2026-09-24 23:31 EDT)

The two lines are NOT in conflict. We verified that the integration branch has made ZERO changes to CD.yml, CI.yml, pom.xml, assembly.xml, .gitignore, or assembly/pom.xml since the merge base. origin/main changed all six afterward. The integration branch is simply stale on the deployment contract.

Values on origin/main — newer, from the EDP onboarding stream:

* Multi-module Maven: clue-parent 1.1.0-SNAPSHOT plus the assembly/ submodule clue-code 1.1.0-SNAPSHOT
* assembly.xml directory: ${project.basedir}/../Deliverables
* CI.yml: deployableArtifact.type = pom
* CD.yml java_batch.owner: user TCLUE999DEVS, group users — ACTIVE
* CD.yml batch_url: clue-code-1.1.0-SNAPSHOT.tar.gz
* .gitignore ignores target/

Values on the integration branch — inherited unchanged from the merge base:

* Single-module Maven: clue-code 1.0.5-SNAPSHOT, with the assembly plugin inline
* assembly.xml directory: ${project.basedir}/Deliverables
* CI.yml: deployableArtifact.type = tar.gz
* CD.yml java_batch.owner is commented out, with the stub ## user: tsadm
* CD.yml batch_url: clue-code-1.0.5-SNAPSHOT.tar.gz
* .gitignore does not ignore target/

Requested decision:

Please approve ONE coherent set covering all six values together, rather than deciding value by value.

Our read-only analysis recommends adopting the complete origin/main deployment contract and merging it forward into the integration branch. This retains all application commits from the integration branch and loses nothing from either side.

The following two items are NOT resolved by this baseline decision and must not be treated as closed:

1. assembly.xml sets includeBaseDirectory=false in BOTH lines, meaning the .tar.gz has no top-level folder. A TD peer validator (com-td-tdi-validators/validate_batches.py) requires exactly one top-level folder named after the batch name, clue_dev. This is a Platform/Salt question, not a repository-baseline question.
2. EDP must clarify whether deployableArtifact.type=pom refers to the Maven packaging type or the uploaded file extension. Both lines use Maven packaging pom, while the file fetched by Salt has the .tar.gz extension.

Until this baseline decision is recorded, we will not edit, build, package, or run CI.
