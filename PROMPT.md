Prepare a complete local handoff so I can continue this SAME CLUE / Symcor project in a NEW GitHub Copilot chat. Do the documentation now, then give me the exact startup prompt to paste into the new chat. All replies, documentation, code references and startup text must be in English.

This task is documentation and continuity only. Do NOT start the pending post-meeting Debit preparation task in this chat. Do not rerun the batch, call Symcor/Tungsten, run curl or a TLS preflight, change application behavior, start a regression suite, or push/merge/deploy. Preserve all work already present.

1. Inspect and reconcile the actual current workspace

- Read applicable repository instructions and the existing handoff, README, decision records and prompt ledger. Reuse the established documentation structure; do not create competing sources of truth.
- Identify the actual repository root, worktree, current branch, full HEAD SHA, tracking branch and local working-tree status. Do not assume that an earlier C:\repos\FCRM path or C:\repos\clue-e2e-20260922 path is still the active checkout.
- Record modified, staged and relevant untracked files, what each group belongs to, and any work still in progress. Preserve existing edits. Do not reset, clean, stash, switch branches, stage everything or create application commits as part of this handoff.
- Record which local commit contains each received change. Distinguish the current local state, cached remote information, earlier agent reports and any current read-only verification. The previously reported merge commit is not proof of today's HEAD.
- Read /CLUE Project Reference/00_START_HERE.md and 01_CURRENT_STATE.json if available, then follow their selected release. The latest reference supplied by the owner is CLUE-REF-2026-09-23-R3, checkpoint CLUE-2026-09-23-SYMCOR-MEETING-RECONCILED-INPUT-CONTRACT-OPEN. Relevant release files are 02_IO_Contract_and_Implementation.md, 06_Prompt_Ledger.md, 10_Symcor_Meeting_Outcomes_2026-09-23.md, 11_Next_Actions_and_Code_Impact.md and 12_Post_Meeting_Open_Questions.md.
- These reference paths may belong to the owner's reference collection rather than this machine. Locate a supplied local copy or attachment; do not claim inaccessible documents were read. Complete the useful handoff from actual repository/session evidence and the context below, recording any unavailable source. Do not invent a new reference release.

2. Preserve the reconciled project state

Use evidence links, commit IDs, commands/log paths and timestamps where actually available. For each claim distinguish INSPECTED_EVIDENCE, AGENT_REPORTED, OWNER_REQUIREMENT, PROVIDER_MEETING_GUIDANCE and UNRESOLVED. Do not mark tests or implementation complete based only on a plan.

Current context to reconcile, not instructions to repeat completed work:

- Excel/result implementation prompt 58316 was received, reported commit b368696. The latest explicitly reported full suite at that revision was 675 passed, 5 skipped, 0 failed; do not relabel that as a test run against a later HEAD.
- Historical-workspace re-export/hash recovery was reported at b8cb82c; acquisition-origin metadata correction at 31568a2; manual Symcor curl tooling at 2648f14. Export activity and the saved data's acquisition origin are separate.
- PR #2 was reported merged at 573cd90 on 2026-09-23. Record any newer actual repository evidence and do not repeat the push/merge task.
- The completed MON_INSTRUMENTS baseline is 16 source rows (5 Debit, 11 Credit), 354 output rows, 350 associations, 88 unique documents and 684 embedded images, PARTIAL / exit 3. Outcomes: 341 completed_extraction, 1 extraction_fields_blank, 8 image_unavailable associations and 4 no_matching_document. Keep it distinct from the older 17-source dataset and later re-exports.
- The separately authorized fresh DEV attempt was refused by the live guard before provider calls: zero Symcor calls, zero Tungsten calls, no fresh acquisition. Later Symcor profile binding was reported resolved; Tungsten job-status/idempotency contract evidence and the Python 3.9.25 versus declared >=3.10 runtime gap remain unresolved unless newer evidence proves otherwise.
- Investigation 46382, reported 644f048, prepared four getTransactionItems requests; they remain unsent unless a newer actual result establishes otherwise.
- Inspect any result already produced for the previous conditional Debit-direction review. Its implementation result has not been received in the owner's reference record; do not confuse this with the completed Debit account/operation evidence review.
- The Word/curl meeting document was mentioned and used in the meeting, but its native delivery was not received in the owner's reference record. Locate existing files before treating the document as missing or asking anyone to rebuild it.
- The latest prompt CLUE_Post_Meeting_Debit_Case_Preparation_2026-09-23.txt has NOT been executed according to the owner's current instruction. Record it as PREPARED / NOT_STARTED. Do not mark this handoff as its execution.

3. Carry the meeting corrections and invariants forward

- Debit item lookup: Symcor recommended awsSearchRequest with the actual ItemSequenceNumber. Date + ISN was described first; a later ISN-only statement was abbreviated and needs reconciliation. Preserve ProcessingDate until its scope is established. Do not infer ISN from a UTI suffix, CIF_Number, Transaction_Details or column W.
- Account numbers are strings; actual leading zeros must survive. Symcor identified the displayed test account as 05224077 and said spreadsheet handling lost a zero. No universal prefix, padding length or automatic retry rule was established. Preserve the admitted historical input; corrected sample data requires a separate version and evidence.
- Adding DebitCreditIndicator=D is not a proven universal fix. Its effect was discussed in the context of an identifying date/ISN query. Reconcile any pending direction change with this evidence.
- Inline Debit images through docsFetchLimit were described as an option. The exact threshold, response packaging and current parser behavior still need evidence. Do not turn this into a guaranteed two-image result or an implementation requirement for this handoff.
- Credit keeps transaction search followed by getDocs, with applyFilter=false for the deposit use case. Relevant children may have other account numbers. Business/BSA must resolve item types, parent treatment and amount relationships; the meeting did not validate every association or declare the sample invalid.
- UTI is transaction scope, not cheque identity. Source-to-item mapping and TD transaction-date equivalence to archive check-processing date remain open.
- Keep the Excel A:W input, separate output workbook preserving every original tab and appending exactly result, and existing 41-column result layout. Diagnostics remain companions. Preserve RETURN_ALL_CHEQUES, source values, multi-document associations, provenance, outcomes and live guards.

4. Write a self-contained local handoff

Update the existing canonical CLUE_HANDOFF.md or its established equivalent with a dated checkpoint and an explicit read order. Keep older evidence and corrections traceable. Reuse existing current-state and ledger files; create small equivalents only if absent. Record:

Table A: Task/prompt | Status | Actual/reported revision | Evidence path | Result received? | Next handling.
Table B: Artifact | Absolute path | Purpose | Historical/current/proposed | Exists? | Hash when it identifies an input or evidence set.
Table C: Open issue | What is known | Missing evidence | Dependency/owner | Smallest next action.

Include the real Windows checkout and, where already known, Linux DEV workspace, interpreter/configuration locations, source workbook, saved requests/responses, output packages, comparison/conformance reports, manual curl tools, meeting document and transcripts/reference copies. Missing paths or remote files must be labelled unverified or inaccessible, not replaced with invented paths.

Do not include credentials, .env contents, key material or passphrases. Reference protected configuration locations without copying their secrets. Preserve the user's original input and historical deliverables.

Save the full pending Debit prompt locally if it is available in this chat or attachments. If its full text is unavailable, create a clearly labelled scope summary rather than claim an exact copy:

NEXT TASK, FOR THE NEW SESSION ONLY: Prepare one trustworthy Debit validation case offline. Reconcile previous review results first. Start with historical MON_INSTRUMENTS row 2, Account 5224077 and submitted date 20260717; locate the authoritative corrected sample and real ItemSequenceNumber, using the meeting's account 05224077 as guidance to verify. Produce a source-to-request mapping table, narrow code trace for identifier preservation/ISN support, a schema-supported date-scoped item-search XML and parameterized curl helper, all labelled PREPARED_NOT_SENT or INCOMPLETE. Preserve historical responses separately from proposed requests. Historical row 3, account 5224069, may be a separate control; its one returned document had extraction_fields_blank. Do not use that document as row 2 evidence. No provider calls, production code changes, batch rerun, push/merge, global padding, guessed mapping or matching changes. If evidence is missing, complete all useful offline work and report the exact gap.

5. Create START_NEW_COPILOT_SESSION.txt

Write a compact, standalone startup prompt with the actual repository and handoff paths you just verified. It must work without access to this chat and must:

- Tell the new Copilot session to continue the existing checkout and read applicable repository instructions, the canonical handoff, current state, prompt ledger, meeting corrections and saved next-task prompt in the specified order.
- Reconcile any workspace changes since the checkpoint before editing. Preserve all existing user/agent work.
- Identify completed work that must not be repeated and keep prepared, attempted, blocked and completed statuses distinct.
- Require English for every engineering response and artifact, and table-based findings.
- Start with a brief status summary, then proceed with the pending OFFLINE Debit preparation task within its existing scope. Do not restart broad discovery, repeat completed implementation, request routine confirmation to begin the named task, or make provider calls.
- Carry the meeting constraints, live guard, input/output contract and evidence distinctions above. Preserve existing authorization records without expanding them; a handoff does not authorize extra live calls.
- Point to concrete local files, not 'the previous chat' or inaccessible reference paths as the only source of context.

6. Verify and finish

Perform only documentation checks: file existence, internal links/read order, JSON validity if applicable, consistent task statuses and a final git diff/status review showing which documentation changed. No application tests are needed to validate a handoff.

Return:
1. A table of created/updated files with absolute paths.
2. A short checkpoint summary: actual repo/branch/HEAD, working-tree state, completed tasks, unresolved dependencies and the pending next task.
3. The FULL contents of START_NEW_COPILOT_SESSION.txt in one copyable code block, plus its absolute file path.

Finish after delivering the handoff and startup prompt. Do not execute the pending Debit task in this chat.
