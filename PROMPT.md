Continue the same CLUE development session. The owner explicitly authorizes you to commit any remaining completed in-scope work, push it to the correct existing project remote, and merge it into the repository's intended integration branch through its normal permitted process. Complete the push and merge when the actual repository requirements allow it; do not stop at a plan or ask the owner to authorize these same actions again.

Reconcile current state first
- Read the current checkout's AGENTS.md, CLUE_HANDOFF.md and contribution/merge instructions. Inspect actual Git status, branch, upstream, remotes, recent commits and existing PRs. Use the established project repository; do not infer the destination from an editor window title or assume that the target branch is main.
- The latest manual-search report identifies commit 2648f14 for symcor_search_request.py, symcor_search.sh and symcor_search_report.py. Treat this as a reported locator and verify it locally.
- Include the completed CLUE work from this session that is not already integrated: Excel input and preserved-workbook/result output, hash-verified recovery, acquisition-origin metadata, documented Symcor DEV profile binding, manual Symcor search tooling, relevant tests and documentation. Preserve earlier retrieval/provenance fixes in the branch. Determine the actual outgoing commit range instead of blindly cherry-picking photographed commits or duplicating already merged changes.
- The manual-search utility was reported validated offline, with zero new provider calls. The fresh end-to-end run has not occurred. Tungsten capability questions and the supported Python-runtime gap remain unresolved. Preserve those distinctions in the handoff and PR.

1. Prepare the exact integration change
Review staged, unstaged and untracked files and the branch diff against the intended target. Stage completed project changes deliberately. Preserve unrelated edits and unfinished work without including them accidentally; use an isolated worktree if needed. Do not use a destructive reset, git clean, broad stash or blanket git add as a substitute for reviewing the scope.

Keep the existing business contract: A:W Excel input; a separate output workbook preserving original tabs and appending exactly result; the existing 41-column result layout. Preserve source values, source/document associations, RETURN_ALL_CHEQUES, outcomes, acquisition provenance, matching behavior and the live guard. Do not resolve open contract questions by assigning unsupported capability values merely to make integration pass.

2. Check what would leave the workstation
A previous report flagged credential exposure. Inspect the outgoing changes and commit range using the repository's existing secret-checking tools and targeted review. Ensure no .env secrets, private keys, JKS/P12 material, tokens, real customer workbooks/images, raw provider captures or local runtime state are accidentally being published. Retain approved sanitized fixtures and legitimate source documentation.

Do not print secret values. Removing a secret only from the latest file does not remove it from an outgoing earlier commit. If this requires a destructive/shared-history rewrite or an external credential action outside the task, finish the safe preparation and report the precise blocker before pushing affected content. Do not force-push or silently rewrite shared history.

3. Validate the actual merge candidate
Fetch the intended target and reconcile new changes. Resolve routine conflicts while preserving both sides' intended behavior; stop only for a concrete unresolved business/contract decision that cannot be determined from the existing evidence.

Run repository-required checks and focused offline tests relevant to the changed code, including workbook/source preservation, origin metadata, DEV profile selection/live refusal, and manual-search request/response handling where applicable. Reuse existing tests and recorded valid evidence; rerun checks only when the candidate changed or a required gate demands it. Record the exact tested revision and actual results.

Do not run the historical batch, a fresh provider batch, the manual-search POST/TLS preflight, or the four getTransactionItems probes as part of this Git task. No new provider execution is authorized by this push/merge instruction. Do not claim passing offline tests prove current live readiness.

4. Push and merge
Commit any reviewed, completed changes not already committed, with clear English messages. Push the intended feature/integration branch explicitly to the verified remote; do not push all branches or force-push.

Reuse the existing relevant PR if present; otherwise create one against the verified target. Follow the actual repository-host workflow and permitted merge strategy. The PR description should explain the concrete problems addressed, resulting behavior, validation performed, and remaining live-run limitations. Include the new manual-search tool's offline-only evidence. If using a CLI for a multiline PR description, write the exact text to a file and use its body-file option.

Wait for required CI and check the actual review/merge requirements. Fix in-scope failures and rerun only affected or required checks. Once the candidate meets the repository requirements, merge it and complete the normal remote integration workflow.

Owner authorization is already given for this push/merge. It does not override protected-branch rules, required independent approval or missing repository permissions. Do not self-approve, use an admin bypass, weaken checks or change branch protection. If a mandatory reviewer/permission requirement prevents merging, leave the concrete PR ready, report its URL and exact blocking requirement, and label the result PUSHED / MERGE BLOCKED. Do not present a queued auto-merge or open PR as already merged. Do not send Slack/email messages or request reviews from named people without separate authorization.

5. Verify and hand back
After merging, fetch the target again and verify the PR's merged state, remote target commit, and presence of the intended changes. For squash/rebase merges, verify the resulting content and PR metadata rather than assuming the original commit hashes must be ancestors. Preserve unrelated local work and do not delete branches/worktrees unless the established workflow requires it.

Keep the checked-in handoff accurate before the final push; report the final merge identifiers afterward without creating an unnecessary extra documentation commit. Do not deploy or launch the application as a post-merge check.

Return a concise English table:
item | verified result | evidence/link
Include repository, source branch/head, target branch, pushed status, PR URL, checks actually run, merge status, final remote commit, and any remaining blocker or preserved local work. End with MERGED only if verified; otherwise state the precise completed actions and remaining dependency.
