Continue in this same CLUE session. Review and simplify the recent deployment changes, then verify the required Excel output contract. Use English throughout. Read the existing CLUE_HANDOFF.md, deployment runbook/report, git diff and saved execution evidence first.

The last report shows 25 changed files, successful developer-account deployment rehearsal, and unresolved /opt installation and Nexus publication. Treat those as reported results; retain their evidence and complete this bounded follow-up.

1. Review the files before changing them
Identify which files were newly created versus modified by the deployment task. In the existing deployment report, add a compact table: path, purpose, referenced by, and keep/consolidate/remove-from-release decision. Check actual callers and packaging rules; filenames alone do not prove redundancy.

Use one documented deployment entry point. Retain helpers only when they have a distinct reusable purpose or reduce duplication. Review clue_deploy_probe.sh, clue_deploy_probe2.sh, clue_deploy_probe3.sh and setup_rehearsal.sh specifically. Consolidate useful checks into existing scripts. Remove a newly created disposable helper only after confirming that no supported workflow depends on it. Preserve existing user files, unrelated changes, logs, evidence and historical releases. Keep temporary diagnostics and generated build outputs out of the normal source/release payload unless required.

Update existing documentation. Do not create another deployment framework, numbered probe scripts, or a second set of reports. Do not force unrelated responsibilities into one large script merely to reduce the file count.

2. Verify the actual business output
Your report says "source columns retained in order + 14 clue_* columns." That does not demonstrate the accepted business-template contract. First inspect the smoke command, selected profiles and produced workbook to determine whether the generic export profile was tested.

Run one focused offline fixture through the actual deployment launcher and release artifact using the existing rahona-workbook/business-template workflow, after confirming the supported arguments:
- Input workbook remains byte-identical.
- All original worksheets are preserved.
- Exactly one result worksheet is added.
- result has the exact 41-column A:AO template.
- A:W retains the corresponding source values.
- X:Y contains the two image columns.
- Z:AO contains the eight field/confidence pairs in the required order, including repeated confidence headers.
- No extra clue_* diagnostic columns appear in the business result.

Use existing fixtures and the normal application path. Correct deployment/test profile selection if that explains the discrepancy. Change application code only if a real contract defect is demonstrated. Record the actual headers, workbook path, check results and application exit code in the existing report. Make zero Symcor/Tungsten calls.

3. Validate and package only what changed
Reuse the current supported Python runtime and dependency setup. Run focused syntax/reference checks for edited scripts and the single contract smoke above. Preserve the previous fix that makes explicit CLI arguments override configuration. Do not repeat the full suite or historical business batch.

If packaged contents changed, create a new release identifier/checksum and validate that exact final artifact. Do not overwrite an existing release or report checks against the old artifact as verification of the revised one. Keep secrets and private keys outside the package.

4. Finish with a clear handoff
Update the existing runbook, report and CLUE_HANDOFF.md. Give the final maintained file list and explain each consolidation/removal. Provide one exact deployment command with its configuration file, the run command, and rollback command.

Keep status precise: developer-account rehearsal, installation at /opt/td/clue, Nexus publication, service-account validation and live connectivity are separate. Preserve unresolved access/identity blockers with the exact next action and responsible role. A blocked operational deployment must not be marked complete because the rehearsal passed.

Complete the authorized local cleanup and focused DEV validation without repeated permission requests. Respect existing access controls. Return a concise summary, changed-file counts, artifact hash, actual validation results and absolute delivery paths.
