Continue CLUE-OPS-ENV-LIFECYCLE in W001CLUEinitialRepo on the existing feature branch. This prompt is self-contained.

Preserve the completed implementation and reported Windows/Linux package checks. Verify current HEAD and local changes; do not restart completed work.

Close only these four gaps:

1. Workbook-write failure
Inject a failure during XLSX writing, separately from archive failure. Verify the input remains recoverable, incomplete output is not published, and completion is not falsely reported. Restart from persisted state and prove committed retrieval/OCR stages are not repeated.

2. Live-worker claim protection
Use two independent processes. Keep the first worker healthy beyond the stale-claim interval and verify the second cannot steal its delivery. Separately test owner termination and safe recovery. Age alone must not establish owner death. State the supported same-host/shared-mount topology and reject unsupported use explicitly.

3. Environment/profile compatibility
Inspect existing contracts and registry code for accepted combinations. Distinguish environment-name checks from semantic compatibility. Reject evidenced incompatible combinations before input claim or provider work. Do not invent compatibility rules; document any missing authoritative rule precisely.

4. External YAML with installed code
Keep mutable configuration outside the wheel. Through the existing installed launcher, verify external YAML selection, relative paths, missing/invalid configuration rejection and preservation of operator edits. Supply templates and exact commands through the existing delivery mechanism. Preserve direct-input/export-only behavior; do not create another installer.

Inspect existing tests first, implement actual gaps and run focused regressions. Repeat the full suite only for a concrete risk or required repository gate.

Update existing README/operator instructions, handoff and backlog. Preserve live guards, Excel A:W/result/41-column contract, associations, provenance and historical outcomes. Keep Debit zero-prefix fallback deferred. Do not expand into header/confidence issues or infrastructure provisioning. No live provider call or historical batch rerun is needed.

Make focused commits. Fetch and inspect the application's remote/base/PR state, preserve unrelated work, and never force-push or merge unrelated histories. Push the feature branch and create or update one draft PR against the established base. Do not merge, bypass required reviews, publish to Nexus or deploy.

If remote access is unavailable, complete independent local work and provide the precise blocker plus ready PR title/body.

Return:
Gap | Change/evidence | Test result | Remaining limitation

Include full HEAD and actual push/PR status. Work through implementation and verification without stopping at a plan or requesting routine confirmation. All engineering output must be English.
