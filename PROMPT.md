Continue the existing CLUE corporate development session. Update our handoff information, then trace and locate the actual Python deployment bundle in Nexus. Complete the investigation using native files, existing pipeline logs and authorized Nexus metadata. Use English throughout. Do not stop at a proposed search plan.

NEW CONTEXT — screenshot observations; verify natively

1. Natasha's onboarding merge is reported as PR #4 in TD-Universe/W001CLUEinitialRepo, feature/edponboard -> main, merge commit a6f3ba4b107104337a5c7b327edd7b6d9586076b, merged 2026-09-23T18:20:42Z. Payload: 8 changed files. Seven visible paths: .mvn/wrapper/MavenWrapperDownloader.java, .mvn/wrapper/maven-wrapper.properties, CD.yml, CI.yml, mvnw, mvnw.cmd, pom.xml. Inspect the complete native diff.
2. POM: com.td.clue:clue-cd-only:1.0.5-SNAPSHOT, packaging pom, parent com.td.pipe:pipeline-parent-pom:LATEST. CI.yml declares deployableArtifact type pom, Maven wrapper and JDK 21. Python commands were removed from that file; other workflows/inherited executions remain unverified.
3. GitHub run 35901809407, job 107319618610, “EDP XL Pipeline Caller”, succeeded in 11 seconds. It called https://release.td.com/webhooks/start-edp-vmc and received HTTP 200 with an empty body. This proves the trigger response, not downstream build/deployment success.
   https://github.com/TD-Universe/W001CLUEinitialRepo/actions/runs/35901809407/job/107319618610
4. Nexus rp.td.com visibly contains td-maven-snapshots / com.td.clue / clue-cd-only / 1.0.5-SNAPSHOT. Displayed assets:
   com/td/clue/clue-cd-only/1.0.5-SNAPSHOT/clue-cd-only-1.0.5-20260923.184900-2.pom
   plus .pom.md5 and .pom.sha1. No Python archive is visible in that selected component. Search beyond it before concluding absence. The banner reports the repo.td.com -> rp.td.com cutover completed.
5. CD.yml declares DEV host crcluesbdzwnk0.dev.vmc2.td.com, VMC reuse, custom app type, an AutoSys state and Vault names tungsten_primarykey, tungsten_secondarykey, symcor_cert_privatekey, symcor_certpublickey. Provisioning/runtime mapping are unverified. Do not expose values or inline notification webhooks.
6. Earlier DEV success was reported as developer-account rehearsal in an alternate directory, with Python 3.12.14. /opt/td/clue installation and service-account validation were not completed. sudo -n requiring a password does not rule out approved interactive operator sudo. Historical upload-credential restrictions do not prove downloads are blocked.
7. Earlier comparison reported the business workbook implementation in W001CLUEinitialRepo@5ac9541d and a provisional exporter in fcrm_clue@2a2603f. The later source-alignment result is unknown here. Verify current ancestry; neither historical commit is automatically the current release. POM version 1.0.5 is separate from application version 0.2.0.

COMPLETE THIS WORK

A. Read existing CLUE_HANDOFF.md, deployment runbook/report, prior findings and git status. Preserve unrelated changes. Record new observations with evidence levels, then resolve uncertainty from native evidence. Identify the correct checkout, current refs, merge and complete diff without resetting or overwriting work.

B. Read pyproject.toml, existing build/release/bundle scripts, CI/CD/workflows and parent/effective configuration. Derive actual package/bundle names, formats, versions and expected contents. Prefer configuration and parent version used by the historical run: resolving LATEST today may differ. Inspect without initiating a build, deployment lifecycle or workflow rerun.

C. Follow the existing GitHub run into the downstream EDP/XL run. Record its ID, stages, statuses and accessible log references. Locate build/publish commands, outputs and coordinates. Do not replay the webhook or send messages to others.

D. Search Nexus read-only using derived names and pipeline coordinates across relevant accessible repositories. Inspect assets, versions, classifiers and pagination. Separate access errors from empty results; report the searched scope. Use existing authorized authentication and TLS validation. Keep credentials out of commands, logs and deliverables. Do not retrieve privileged credentials or treat the Nexus homepage as a download URL.

E. Download plausible existing assets to isolated temporary storage; inspect format and contents without executing packaged code. Compare available repository/build checksums and calculate SHA-256 locally. State when independent checksum/provenance is unavailable. Confirm source/release provenance, application payload, deployment entry point and dependency installation route. A POM, Maven distribution, source-only archive or HTML page is not proof of the expected deployment bundle. Record missing elements rather than creating replacements.

F. Complete the existing runbook's FIRST INSTALL instructions. The operator cannot clone Git, SCP/copy our files, or run scripts not yet downloaded. Start after SSH login:
   approved interactive sudo/account transition
   -> accessible staging directory
   -> exact Nexus download(s)
   -> checksum and format verification
   -> extraction
   -> configuration from extracted templates
   -> invocation of the extracted deployment script.
   Discover the actual account, paths and authentication mechanism; do not invent them. Include executable commands where inputs are established; mark remaining inputs explicitly. Root-owned directories alone do not justify changing permissions. Prepare these steps; do not execute deployment in this task.

DELIVERABLE

Update existing handoff/runbook/report files with minimal duplication. Provide an evidence table: source commit, producing EDP build, artifact name/version/type/classifier, repository, exact asset URL, checksums, contents and bootstrap readiness. Distinguish POM publication from Python bundle publication.

Conclude with FOUND_VALID_DEPLOYMENT_BUNDLE, CANDIDATE_UNVERIFIED, ONLY_CD_POM_CONFIRMED, NOT_FOUND_WITHIN_SEARCHED_SCOPE, or ACCESS_BLOCKED, supported by evidence and gaps. If missing, identify the smallest existing build-to-publication wiring change and its owner where documented; do not implement or publish it yet. If found, give the precise next operator action.

Keep this an artifact investigation and documentation task: no application-code changes, build/publish/merge, deployment, provider calls or broad test runs. Preserve the Excel business contract, historical PARTIAL results, open business issues and prior authorizations. Complete accessible independent investigation before reporting blockers. Return exact local paths to updated existing documents and evidence references.
