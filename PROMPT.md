CLUE Deployment Package Truth and Stepwise Validation

Document ID: CLUE-DEPLOYMENT-PACKAGE-TRUTH-2026-09-25-R1
Status: Working reference — execution stopped at Step 1
Purpose: Establish exactly what CI/CD packages, align the repository with that contract, build one authoritative deployment artifact, and validate it one controlled step at a time.
Primary rule: Do not build, upload, deploy, commit, push, or run CI until the current step has been reviewed and explicitly accepted.

────────

1. Why this document exists

The recent DEV rehearsal exposed a fundamental packaging ambiguity:

1. The repository has a Deliverables/ tree used by the established deployment process.
2. A separate manual bundler created a deployment archive containing generated or externally sourced files such as bin/clue-prepare-host.sh, bin/clue-deploy.sh, a wheelhouse, and deployment documentation.
3. Those files are not necessarily present under the application repository’s Deliverables/ tree.
4. Therefore, the manually built rehearsal archive and the artifact produced by the real CI/CD packaging path may have different members and different behavior.

This means that a successful test of the manual archive does not prove that the CI/CD artifact will contain the same scripts or work the same way.

The solution is not to create another package immediately. The solution is to identify the official packaging contract first, place every required deployment input in the correct authoritative source location, and then build through the same mechanism used by CI/CD.

────────

2. Facts, current evidence, and unresolved items

2.1 Facts supported by the meeting and rehearsal evidence

• The application repository contains a Deliverables/ directory.
• The existing operational understanding is that deployment content is sourced from Deliverables/.
• The repository also contains Maven/assembly material, including pom.xml and assembly-related configuration that may further control what is packaged.
• A separate manual process built 0.2.0-a516a21.dirty.917b244b and included deployment scripts not visibly present in the application repository’s Deliverables/ tree.
• An older artifact, clue-0.2.0-test-f676277-deploy.tar.gz, also exists under /opt/clue on DEV.
• The meeting mixed references to the older f676277 artifact and the newer a516a21...917b244b manual-rehearsal artifact.
• The newer manual-rehearsal bundle contained the deployment scripts, but the team initially searched in the older artifact/staging location.
• A prototype wrapper.sh was created during the meeting and encountered shell syntax, placeholder, path, and line-ending failures.
• The prototype wrapper included a real rollback command after deployment. If run successfully where a previous release exists, that could undo the deployment.
• DEV currently demonstrated successful installation mechanics with a temporary identity/group arrangement.
• A previous second-run test showed that the installed product state remained stable, but extra logs/workspace files were created; strict zero-mutation idempotency did not pass.

2.2 Claims that still require repository evidence

The following must not be treated as facts until Step 1 confirms them from tracked files:

• Whether CI packages every file under Deliverables/ or only selected members.
• Which pom.xml, assembly descriptor, workflow, or CD.yml file is authoritative.
• Whether the official CI artifact is a tarball, another archive, or a Maven-produced assembly.
• Whether bin/, documentation, wheelhouse content, configuration templates, and wrapper scripts are included by the current assembly.
• Which version field controls the final deployment artifact name.
• Whether the Python package version and Maven release version must be identical.
• Whether CI retrieves any deployment inputs from a second repository.
• Whether a generated file is an official build output or an accidental local-only addition.

2.3 Environment information that remains unresolved

|Environment|Runtime NPID          |Canonical Linux name|Application owner group                                                        |Application root|Evidence status                                      |
|-----------|----------------------|--------------------|-------------------------------------------------------------------------------|----------------|-----------------------------------------------------|
|DEV        |`TCLUE999DEVS`        |`tclue999devs`      |Original design: `vmc2_clue_dev`; temporary rehearsal used `unix_sudo_svc_clue`|`/opt/td/clue`  |Account proven; final approved owner group unresolved|
|PAT        |To be recorded exactly|To be verified      |To be recorded exactly                                                         |To be confirmed |Verbal confirmation only                             |
|PROD       |To be recorded exactly|To be verified      |To be recorded exactly                                                         |To be confirmed |Verbal confirmation only                             |

unix_sudo_svc_clue must not automatically become the application owner group merely because it provides sudo capability. Filesystem ownership and sudo authorization are separate controls.

────────

3. Three different things currently called “the package”

The word package must always be qualified.

3.1 Python application package

Examples: wheel or source distribution produced from pyproject.toml.

Purpose:

• Install CLUE Python code into a virtual environment.
• Represent the Python application version.

This is only one member of a deployment artifact. It is not, by itself, the operational deployment package.

3.2 Manual rehearsal deployment bundle

Example:

• clue-0.2.0-a516a21.dirty.917b244b-deploy.tar.gz

Observed construction characteristics:

• Built by a custom/manual bundle generator.
• Combined application source with deployment tooling from another working tree.
• Included bin/ scripts, documentation, manifests, and an offline wheelhouse.
• Marked dirty because inputs were not all committed and clean.

Purpose:

• Exercise deployment mechanics on DEV.
• Collect evidence while CI/CD was intentionally bypassed.

Limitation:

• It does not prove what the official CI/CD packaging job will emit.

3.3 Official CI/CD deployment artifact

Working meeting contract:

• The deployment process obtains its content from the application repository’s Deliverables/ tree.
• Maven/assembly/CI configuration may select or transform that content.

Purpose:

• Produce the artifact that Operations receives and deploys to DEV, PAT, and PROD.

This is the artifact that must ultimately contain every required deployment script and offline dependency. Its exact construction is the subject of Step 1.

────────

4. Authoritative path model

These locations must not be conflated:

|Location                             |Intended role                                  |Must contain                                                                               |
|-------------------------------------|-----------------------------------------------|-------------------------------------------------------------------------------------------|
|Repository `Deliverables/`           |Source inputs for official deployment packaging|All deployment-owned tracked inputs selected by the assembly                               |
|Build output directory               |Local/CI build result                          |The exact candidate artifact and checksum/manifest                                         |
|Nexus                                |Versioned artifact repository                  |Immutable official/test candidate plus checksum metadata                                   |
|`/opt/clue` on server                |Artifact staging only                          |Downloaded archive, sidecar, and controlled extraction/staging data                        |
|`/opt/td/clue`                       |Installed application root                     |`releases/`, `current`, `conf/`, `logs/`, and `work/` as defined by the deployment contract|
|`/opt/td/clue-rehearsal/<release-id>`|Optional isolated test root                    |Rehearsal-only installation, never mistaken for the production-like active root            |

Rules:

• Do not replace /opt/td/clue with /opt/clue merely because the archive is staged under /opt/clue.
• Do not recursively change ownership of /opt/td.
• Do not execute a root command from an NPID-writable extracted directory.
• Root-owned staging must be used before executing privileged packaged code.

────────

5. Required privilege boundary

|Activity                          |Required identity                              |Rule                                                             |
|----------------------------------|-----------------------------------------------|-----------------------------------------------------------------|
|Copy artifact into trusted staging|Operations/deployment identity                 |Result must become root-owned before privileged execution        |
|Verify outer SHA-256              |Operations/deployment identity                 |Must use an expected digest obtained independently of the archive|
|Extract into trusted staging      |Root or controlled deployment identity         |Prevent path traversal and unsafe members                        |
|Prepare `/opt/td/clue`            |Root through one approved elevated operation   |Only the exact CLUE subtree may be changed                       |
|Install/activate release          |Environment NPID                               |Must run without general root privilege after host preparation   |
|Run application/AutoSys job       |Environment NPID                               |Normal runtime identity                                          |
|Retrieve four runtime secrets     |Environment NPID with narrowly scoped sudo rule|Only approved `salt-call pillar.get` commands; never general sudo|

Prohibited patterns:

• NOPASSWD: ALL for the runtime service account or its broad group.
• sudo pip install into the system interpreter.
• chown -R <npid>:<group> /opt/td.
• Running every deployment command through sudo.
• Making the runtime NPID a general administrator simply to simplify deployment.
• Treating a sudo group as the application owner group without explicit Platform approval.

The temporary DEV sudoers change demonstrated a technical possibility. It is not an accepted production security design.

────────

6. Required official deployment artifact contents

The final list is not approved until Step 1 establishes the actual assembly mapping. The target contract should include at least:

<single-release-root>/
  bin/
    clue-prepare-host.sh
    clue-deploy.sh
    clue-batch-run.sh
    clue_with_runtime_secrets.sh
    <one approved operational wrapper, if required>
  conf/
    clue-deploy.conf.example
  wheelhouse/
    <CLUE application wheel>
    <all locked dependency wheels>
  docs/
    CLUE_OPERATIONAL_DEPLOYMENT.md
    CLUE_DEPLOYMENT_ENGINEERING_REFERENCE.md
  MANIFEST.json
  SHA256SUMS

Acceptance requirements:

• Exactly one archive root.
• No absolute paths.
• No .. traversal members.
• No device files, setuid/setgid files, or unexpected links.
• All required scripts are present and executable.
• All shell scripts pass bash -n after extraction.
• All files are represented in the internal manifest/checksum file.
• The wheelhouse supports a clean offline installation.
• No .env, secret, private key, certificate password, GitHub token, or Vault/HKV value is included.
• Version and release identity are consistent across the artifact name, manifest, Maven metadata, Python metadata, and documentation.

────────

7. Wrapper contract

The meeting prototype is not the accepted wrapper. A production-capable wrapper must:

1. Be tracked in the authoritative packaging source.
2. Be included by the official assembly, not injected from an unrelated working tree.
3. Use LF line endings and a Bash shebang.
4. Start with safe shell settings such as set -Eeuo pipefail.
5. Accept or resolve, without hardcoding:
  • environment;
  • release ID;
  • artifact path or approved Nexus URL;
  • expected artifact SHA-256;
  • NPID;
  • owner group;
  • application root.
6. Validate every required input before making a change.
7. Verify the archive before executing anything from it.
8. Use trusted, root-owned staging for the privileged preparation step.
9. Run host preparation as root and release deployment as the NPID.
10. Stop immediately on any failed command.
11. Never perform a real rollback during normal validation.
12. Require an explicit rollback action and target.
13. Never use a fixed sleep as a readiness or success check.
14. Never modify sudoers.
15. Never call Salt/HKV, Symcor, Tungsten, AutoSys, or other providers during installation validation.
16. Produce a concise final result with release ID, digest, installed path, active target, and exit status.

The variable name release-id is invalid in Bash. Use RELEASE_ID. Placeholder notation such as <artifact-sha256> must never be executed as shell syntax.

────────

8. Controlled validation sequence

Every step has an explicit stop gate. Do not begin the next step until the previous result is reviewed.

Step 1 — Discover the real CI/CD packaging source

Mode: Read-only
Server access: None
Build: No
Git mutation: No

Objectives:

• Identify the correct repository, branch, and commit.
• Inventory every tracked member of Deliverables/.
• Identify every pom.xml, assembly descriptor, CD.yml, and workflow/build file relevant to packaging.
• Trace the exact CI packaging command and its source directories.
• Determine whether the entire Deliverables/ tree or only selected members are packaged.
• Determine the artifact name and version sources.
• Determine whether content is copied from another repository or generated during CI.
• Compare the official mapping with the manual rehearsal bundle design.

Required evidence:

repository root
origin URL without credentials
branch
HEAD SHA
git status --short
tracked Deliverables inventory
packaging-related file inventory
exact package/build entry command
assembly include/exclude mappings
artifact naming/version expression
external/generated input mappings
gap table: required member -> official source -> included? -> action needed

Pass criteria:

• One evidence-backed packaging flow is identified.
• Every file in the expected official artifact can be traced to a tracked source or an explicitly defined generated output.
• Any discrepancy is reported without modifying the repository.

Stop marker:

STEP_1_PACKAGE_SOURCE_DISCOVERY_COMPLETE

If evidence is insufficient:

STEP_1_PACKAGE_SOURCE_DISCOVERY_BLOCKED

Step 2 — Approve the target artifact contract

Do not execute yet.

• Review the Step 1 gap table.
• Decide which existing files are authoritative.
• Decide where each missing script belongs under Deliverables/.
• Decide whether a wrapper is required or the operational guide should invoke packaged scripts directly.
• Record environment-independent inputs versus environment-specific values.
• Reject duplicate scripts with overlapping responsibilities.

Output: approved package member map. No code changes yet.

Step 3 — Reconcile source layout

Do not execute yet.

• Move or implement required deployment files only in their approved authoritative locations.
• Remove dependency on untracked files from another working tree.
• Make the assembly include the approved files.
• Keep environment values external to the artifact.
• Update .gitignore so .env and secret-bearing local files cannot be committed.
• Do not add secrets or credentials.

Output: focused source diff and updated member map.

Step 4 — Implement and test the wrapper contract

Do not execute yet.

• Implement argument parsing and validation.
• Separate root preparation from NPID deployment.
• Remove automatic rollback, broad sudo, recursive parent ownership changes, and system pip installation.
• Add failure-path tests and exact identity tests.
• Normalize scripts to LF.

Output: wrapper tests and shell validation evidence.

Step 5 — Resolve versioning

Do not execute yet.

• Identify the authoritative Maven version.
• Identify the authoritative Python version.
• Identify the CI artifact/release version.
• Update pom.xml, Python metadata, CD.yml, manifest generation, and documentation consistently according to the approved version rule.
• Do not label a dirty artifact as an official release.

Output: version matrix with no contradictory values.

Step 6 — Run local test gates

Do not execute yet.

Required gates:

• unit and regression tests;
• bash -n for all packaged scripts;
• shell linting where available;
• package-member contract test;
• archive path/link/mode safety test;
• internal checksum verification;
• offline wheelhouse installation test;
• missing-wheel negative test;
• wrong-digest negative test;
• wrapper dry-run tests;
• idempotency tests covering both product and auxiliary paths;
• status behavior for a healthy first release.

Step 7 — Build through the CI-equivalent packaging path

Do not execute yet.

• Use the exact build command identified in Step 1.
• Build from a clean, committed source state.
• Produce exactly one candidate artifact and its digest/sidecar.
• Record source commit, builder inputs, artifact size, member count, and SHA-256.
• Do not substitute the custom manual bundle generator unless Step 1 proves CI uses it.

Step 8 — Compare expected and actual artifact members

Do not execute yet.

• Extract only into a new temporary inspection directory.
• Compare actual members to the approved member map.
• Verify modes, single root, checksums, wheelhouse, scripts, docs, and configuration templates.
• Fail for missing or extra security-sensitive content.

Step 9 — Stage the exact candidate on DEV

Do not execute yet.

• Upload/download the exact Step 7 bytes.
• Stage under a controlled root-owned location.
• Verify outer SHA-256 before extraction.
• Verify internal checksums after extraction.
• Do not use the old f676277 package or the dirty manual-rehearsal package unless that exact candidate was selected and recorded.

Step 10 — DEV preflight and host-preparation dry-run

Do not execute yet.

• Verify exact DEV NPID and approved owner group.
• Verify group membership independently from sudo rights.
• Run clue-prepare-host.sh --dry-run against the approved test/application root.
• Confirm zero filesystem mutation.
• Stop on any identity, group, path, permission, or configuration failure.

Step 11 — Isolated real DEV installation

Do not execute yet.

• Use a versioned isolated rehearsal root first.
• Perform the one root preparation operation.
• Run release deployment as the NPID.
• Verify offline installation, active symlink, manifest/digest, entry points, config permissions, and runtime identity.
• Do not call external business/runtime providers.

Step 12 — Second-run and operational acceptance

Do not execute yet.

• Run the identical release command a second time.
• Verify no change to releases, current, configuration, logs, workspaces, or smoke-test artifacts unless the accepted contract explicitly permits it.
• Verify status exits successfully for a healthy first release.
• Verify rollback is only planned in dry-run mode and never automatically executed.

Step 13 — Commit, push, PR, and CI validation

Do not execute yet.

• Review the complete diff.
• Exclude scratch scripts, .env, credentials, server transcripts, and generated test artifacts.
• Commit only accepted source, tests, build metadata, and documentation.
• Push the feature branch without force.
• Open/update the PR.
• Run CI and compare the CI artifact member list and digest evidence to the locally accepted contract.

Step 14 — PAT/PROD readiness

Do not execute yet.

For each environment, obtain evidence for:

• exact hostname;
• exact NPID and canonical Linux account;
• exact approved application owner group;
• id -nG <canonical-account> output;
• getent group <approved-group> result;
• approved application root;
• approved staging path;
• approved privileged preparation operator/process;
• narrowly scoped runtime Salt sudo rule;
• artifact promotion rule and immutable digest.

Never infer PAT/PROD values from DEV naming.

────────

9. Step 1 agent instruction — execute this next

Copy the following prompt into the Windows development agent. Run it in the application repository that contains Deliverables/ and the real CI/CD configuration.

CLUE Step 1 — Discover the authoritative CI/CD deployment package source

This is a read-only evidence-gathering task. Do not edit, generate, stage,
commit, push, merge, build, package, upload, deploy, or run CI/CD.
Do not access DEV/PAT/PROD servers. Do not read any .env values or credentials.

Context:
- The operational team states that the real deployment artifact is sourced
  from the repository's Deliverables tree.
- A previous manual bundle generator created a different archive by injecting
  bin scripts, docs, and wheelhouse content that may not exist in Deliverables.
- We must determine the actual CI/CD packaging contract before making any fix.

Tasks:
1. Confirm the repository root, sanitized origin URL, current branch, HEAD SHA,
   and `git status --short`.
2. List every tracked file under Deliverables, preserving relative paths.
3. Locate all packaging-related files, including every pom.xml, assembly
   descriptor, CD.yml, build workflow, pipeline file, packaging script, and
   artifact manifest configuration.
4. Trace the exact build/package command used by CI/CD from its entry point to
   its inputs and final artifact output.
5. State whether CI/CD packages:
   a. all of Deliverables,
   b. selected Deliverables members, or
   c. another source entirely.
   Cite exact file paths and line numbers for the conclusion.
6. Identify the exact source of the artifact name and version. Include Maven,
   Python, CD.yml, or workflow variables that participate.
7. Identify every generated or cross-repository input. Do not assume that a
   local untracked file is available to CI.
8. Search for the following required deployment members and report whether
   each is tracked, selected by the official package assembly, generated, or
   absent:
   - clue-prepare-host.sh
   - clue-deploy.sh
   - clue-batch-run.sh
   - clue_with_runtime_secrets.sh
   - an operational wrapper
   - clue-deploy.conf.example
   - CLUE_OPERATIONAL_DEPLOYMENT.md
   - CLUE_DEPLOYMENT_ENGINEERING_REFERENCE.md
   - MANIFEST.json generation
   - SHA256SUMS generation
   - application wheel
   - offline dependency wheelhouse
9. Compare the discovered official packaging path with the known manual-bundle
   design. Do not modify either implementation.
10. Produce a gap table with these columns:
    Required member | Current tracked source | Included by CI? | Evidence |
    Risk if absent | Smallest future corrective action

Required final report sections:
A. Repository identity
B. Deliverables inventory
C. Official CI/CD packaging call chain
D. Include/exclude mapping
E. Artifact naming and version sources
F. Generated/external inputs
G. Required-member gap table
H. Manual bundle versus CI artifact comparison
I. Open questions that cannot be answered from the repository
J. Confirmation that no files or external systems were changed

End with exactly one marker:
STEP_1_PACKAGE_SOURCE_DISCOVERY_COMPLETE
or
STEP_1_PACKAGE_SOURCE_DISCOVERY_BLOCKED

────────

10. What to send back after Step 1

Return the full Step 1 report, not screenshots alone. At minimum, retain:

• repository/branch/HEAD;
• clean or dirty status;
• complete Deliverables/ inventory;
• exact CI packaging entry point;
• assembly mapping;
• version source;
• required-member gap table;
• final Step 1 marker.

No next-step prompt should be executed until this evidence has been reviewed.

────────

11. Current execution checkpoint

CHECKPOINT: CLUE-2026-09-25-PACKAGE-TRUTH-STEP-1-ISSUED
AUTHORIZED NOW: Read-only repository discovery described in Step 1
NOT AUTHORIZED YET: Edits, build, package generation, server access, upload,
deployment, git commit/push, PR update, or CI/CD execution
