Subject: CLUE deployment baseline decision required before packaging changes

Read-only comparison of branch integration/edponbaord-main-20260924 (HEAD b9d12e5) against origin/main (e0150e3, containing merged PRs #22, #23 and #24 from TD-Universe/feature/edponbaord):

* Ahead of origin/main by 6 commits — all application code: Symcor, capture-guard, and runtime-secrets.
* Behind origin/main by 9 commits — all EDP onboarding: “updates for userID,” “lb changes,” and “script changes.”

Merge base: e846755 (2026-09-24 23:31 EDT)
build(assembly): ship deploy/*.sh executable in the release tar.gz

The two lines are NOT in conflict. We verified that the integration branch has made ZERO changes to CD.yml, CI.yml, pom.xml, assembly.xml, .gitignore, or assembly/pom.xml since the merge base. origin/main changed all six afterward. The integration branch is simply stale on the deployment contract.

DEPLOYMENT-CONTRACT VALUES

origin/main — newer, from the EDP onboarding stream:

* Multi-module Maven: clue-parent 1.1.0-SNAPSHOT plus the assembly/ submodule clue-code 1.1.0-SNAPSHOT
* assembly.xml directory: ${project.basedir}/../Deliverables
* CI.yml: deployableArtifact.type = pom
* CD.yml java_batch.owner: user TCLUE999DEVS, group users — ACTIVE
* CD.yml batch_url: clue-code-1.1.0-SNAPSHOT.tar.gz
* .gitignore ignores target/

Integration branch — inherited unchanged from the merge base:

* Single-module Maven: clue-code 1.0.5-SNAPSHOT, with the assembly plugin inline
* assembly.xml directory: ${project.basedir}/Deliverables
* CI.yml: deployableArtifact.type = tar.gz
* CD.yml java_batch.owner is commented out, with the stub # user: tsadm
* CD.yml batch_url: clue-code-1.0.5-SNAPSHOT.tar.gz
* .gitignore does not ignore target/

REPOSITORY TREE LAYOUT — a separate axis and the reason we cannot adopt either line wholesale

assembly.xml packages the Deliverables tree and nothing else. On origin/main, the following APPLICATION files are outside that tree and are therefore silently absent from main’s release .tar.gz:

* config/environments/dev.yaml
* config/environments/local.yaml
* config/environments/sit.yaml
* tools/dev_checks/clue_env_lifecycle_linux_check.sh

Verified: git ls-tree -r --name-only origin/main -- Deliverables lists only deploy, docs, pyproject.toml, requirements.txt, src, tests, and tools. There is no config/ inside it.

The practical effect is that clue-batch --environment dev on the DEV host cannot find dev.yaml, because the file is not in the archive.

The integration branch has already corrected this: the files are inside Deliverables/. It also adds the regression guard Deliverables/tests/clue/test_deliverables_layout.py, which fails the build if any application file is left at the repository root.

origin/main additionally tracks 17 target/site/** files—committed Maven site output, including surefire-report.html. The integration branch deletes them.

REQUESTED DECISION

Please approve ONE coherent baseline covering all six deployment-contract values together, plus the repository tree layout, rather than deciding value by value.

Our read-only analysis recommends a HYBRID:

* Adopt all six deployment-contract VALUES from origin/main. They are the newer, deliberate EDP onboarding decisions, and TCLUE999DEVS:users is the only tracked owner evidence we have.
* Retain the integration branch’s TREE LAYOUT: keep config/ and dev_checks/ inside Deliverables/, keep target/site/** deleted, and retain test_deliverables_layout.py.
* Set the assembly.xml <directory> value to match whichever module layout is approved:
    * ${project.basedir}/../Deliverables for main’s multi-module layout; or
    * ${project.basedir}/Deliverables for the single-module layout.

Adopting origin/main wholesale would ship an artifact without environment templates. Adopting the integration branch wholesale would discard the approved runtime identity and the newer release version. Neither line is correct on its own.

NOT RESOLVED BY THIS DECISION — please do not treat these items as closed

1. assembly.xml sets includeBaseDirectory=false in BOTH lines, so the .tar.gz has no top-level folder. A TD peer validator (TD-Universe/com-td-tdi-validators/validate_batches.py) requires exactly one top-level folder named after the batch name, clue_dev. This is a Platform/Salt question, not a repository-baseline question.
2. EDP must state whether deployableArtifact.type refers to the Maven packaging type or the uploaded file extension. Both lines use Maven packaging pom, while the file fetched by Salt through batch_url has a .tar.gz extension.

Until this baseline decision is recorded, we will not edit, build, package, or run CI.
