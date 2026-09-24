Continue CLUE-OPS-ENV-LIFECYCLE. Build the actual TEST deployment artifact now, ready for Nexus upload. Complete the work, not just a plan.

SOURCE AND SCOPE
Application repository: TD-Universe/W001CLUEinitialRepo.
Draft PR #6: https://github.com/TD-Universe/W001CLUEinitialRepo/pull/6
Branch: feature/clue-env-lifecycle-20260924.
Last reported HEAD: f6762774f4a8c213648e368501b2ff24e777704c; verify the actual full local and remote SHA before building. Report divergence rather than silently selecting another revision. Preserve unrelated local work; use an isolated checkout if necessary.
This is a feature test release; no merge is required or authorized by this task. Do not deploy to an operational environment or call Symcor/Tungsten. Debit zero-prefix fallback remains deferred.

REUSE THE EXISTING DEPLOYMENT CONTRACT
Inspect the maintained release builder, deployment packager, deploy.md, and deploy/clue-bootstrap.sh. Reuse them; do not create another installer or merge unrelated repository histories.
The earlier deployment bundle was clue-0.2.0-a6f3ba4-deploy.tar.gz, staged under C:\repos\fcrm_clue\delivery. That bundle predates this feature. The application and fcrm_clue deployment-tooling repositories have separate histories: record both revisions independently if both contribute to the build.
The newer clue-0.2.0-f676277-local-release.zip is a review package. Do not simply rename it or assume it satisfies the deployment contract.
Build from the selected application source using the maintained deployment packager. Verify the archive format/root layout expected by the bootstrap and installer. Include the built wheel, sdist if required by the existing contract, compatible pinned offline dependencies and lock data, existing bin/clue-deploy.sh and bin/clue-batch-run.sh, configuration examples, internal checksums, and revision manifest.
Use the existing version conventions with a unique immutable TEST/prerelease artifact identity containing the source SHA. Do not overwrite or relabel an earlier release. If packaging fixes are necessary, make bounded changes and record the final source/tooling revisions actually used.

EXTERNAL ENVIRONMENT CONFIGURATION
Ship config/environments templates outside the importable Python package, consistent with the implementation. Preserve operator-owned YAML and credentials during installation. Document selection via --environment-config or CLUE_ENVIRONMENT_CONFIG_DIR. Do not invent production paths. Retain the same-host worker restriction and current profile-coverage reporting behavior.
Exclude credentials, .env contents, private keys, real business inputs, and captured provider responses from the deliverable. Use sanitized fixtures for validation.

VALIDATE THE EXACT DELIVERABLE
Run the maintained package validator and extract the completed deployment archive into a fresh location. Verify member checksums and source provenance. Install the exact included wheel and offline dependencies into an isolated environment using the existing installer; run pip check and the installed CLI outside the source checkout.
Prefer the available RHEL 9/Python 3.12 test environment. State any platform unavailable for this build; earlier Linux validation of another revision is not evidence for this artifact.
Exercise an external YAML and synthetic multi-sheet workbook through input -> processing -> output/completed ZIP. Check original input bytes/hash in the archive, preserved workbook tabs, the expected 41-column result structure, and preservation of operator configuration. Record actual outcome and exit codes; do not equate successful packaging with successful OCR or business acceptance.
Run focused tests for packaging changes and required repository gates. Previously reported 785 passed/4 skipped is historical evidence unless rerun; the green EDP caller workflow is not Python test evidence.

DELIVER AND PREPARE NEXUS
Produce one delivery directory containing the deployment archive, its .sha256 sidecar, and a manifest with full revisions, build/version identity, dependency inventory, archive hash, and validation results. Open the directory for the user and give exact absolute file paths.
Prepare the upload and install instructions using the existing tooling. Keep installation/status, intentional batch execution, and recovery-only rollback as separate steps; normal installation must not run rollback.
Finish the build even if Nexus details are missing. Resolve the exact TEST repository and component path from approved existing configuration. td-raw-snapshots and tdu-raw-prerelease were only candidates, not confirmed destinations. Do not reuse the unrelated clue-cd-only Maven POM coordinates.
If an approved TEST destination and publisher access are available, upload the unique artifact and sidecars, then download it afresh and verify SHA-256 before reporting publication success. Use credentials without printing them. Otherwise deliver the completed local files and ask only for the missing Nexus destination/access; do not guess or claim publication.

FINAL REPORT
Return: BUILT/VALIDATED/PUBLISHED status separately; source and tooling SHAs; three delivery paths, size and SHA-256; actual validation results; exact Nexus URL if verified; installation command using the existing bootstrap and verified hash; remaining limitations. Update the existing handoff with the artifact identity and status. Do not stop at a proposed plan.
