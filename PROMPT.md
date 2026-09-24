Continue the same CLUE session. The Nexus investigation is complete for the accessible scope: ONLY_CD_POM_CONFIRMED. Prepare the CURRENT Python application deployment bundle for my manual upload to Nexus. Build and deliver the files; do not repeat the broad Nexus investigation or require an automated publisher first. Use English throughout.

Read the existing CLUE_HANDOFF.md, deployment report/runbook and build scripts first. Use native files and command output.

1. Select and record the source.
Verify the canonical TD-Universe/W001CLUEinitialRepo remote and current origin/main using Git. Obtain the full commit SHA directly from Git; the SHA transcribed into the earlier prompt was incorrect. Your report identifies 5ac9541 as an ancestor about 20 commits behind main. Do not relabel or upload that old Release B as the current application. Preserve unrelated working changes; build in an isolated checkout/staging directory. Record application provenance separately from deployment-tool provenance if scripts still come from fcrm_clue, which reportedly has a different Git history. Resolve only concrete packaging dependencies; do not merge unrelated repository histories.

2. Produce one operator-ready deployment archive.
Reuse the existing builder and deployment scripts. Make only minimal packaging fixes needed to include the selected application version, the existing bin/clue-deploy.sh and batch entry point, sanitized configuration templates, version/commit manifest and required supporting files. Follow the established dependency strategy: target-compatible Linux wheels or the explicitly configured corporate dependency repository. Do not install this application using an unqualified "pip install clue": the investigation found an unrelated public package with that name. Install the exact bundled application wheel/path and resolve dependencies through the intended source.

Keep credentials, real .env files, private keys, JKS files, notification webhook values, real business data and historical workspaces out of the archive. Certificates and secrets remain external runtime inputs. Do not change CI/CD or introduce another deployment framework.

3. Verify the actual archive.
Extract it into a clean staging directory. Check the manifest/checksums, expected installer/template paths and dependency completeness. Use the existing supported Linux/Python environment for a focused installation/import and offline fixture smoke check; do not activate the operational deployment. Verify the established Excel output contract using existing focused verification, and preserve/report known header or confidence-scale gaps rather than changing business semantics. Do not run broad test suites or live Symcor/Tungsten calls. Distinguish packaging checks that ran from checks blocked by access or prerequisites.

4. Prepare the manual upload details.
The investigation proposed hosted raw repository tdu-raw-prerelease at rp.td.com, under com/td/clue/<release>/. Check the existing runbook/native repository metadata for the applicable destination and publishing method. This proposal is not proof that my account has upload rights. Prepare the exact repository, directory, archive filename and SHA-256 sidecar for Nexus Upload Component, or the same files for the documented release-management uploader. Use a distinct release identifier; do not overwrite an existing artifact.

Do not upload in this task. Label future download URLs PROPOSED_NOT_PUBLISHED until the upload and exact download have been verified. Missing publish credentials must not prevent completing the local build and upload-ready delivery.

5. Complete the existing operator runbook.
Starting after SSH login with no Git checkout or pre-copied application scripts, document the authorized interactive sudo/account transition, staging directory, Nexus download, external checksum verification, extraction, target-directory prerequisites, configuration and execution of the extracted installer. Confirm how installer configuration uses this exact downloaded artifact so it does not fetch an older or unrelated package. Preserve existing configuration files on repeat use. Stop the sequence on failed prerequisites or commands. Leave unknown account/permission values clearly marked rather than inventing them.

Deliver one finished archive and its SHA-256 sidecar in an accessible local Windows delivery folder. Return absolute paths, file size, release ID, native source commit, checksum, checks performed, and the exact manual-upload form values. Update the existing handoff/runbook/report. The final status must distinguish LOCAL_BUNDLE_READY, NEXUS_NOT_UPLOADED and OPERATIONAL_DEPLOYMENT_NOT_RUN. Do not claim upload or deployment success from local packaging checks.
