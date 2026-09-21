Prepare this CLUE session for continuation in a new GitHub Copilot chat on the same Windows laptop.

Update the existing on-disk project documentation now, then generate the exact startup prompt for the new session. Complete the handoff rather than only proposing a plan.

All responses, documents and prompts must be in English. Use native text and filesystem tools; no screenshots, OCR, vision or browser automation.

1. Establish the actual checkpoint

Verify these previously used locations:

* Application repository: C:\repos\fcrm_clue
* Existing handoff directory: C:\repos\fcrm_clue\docs\handoff\clue
* External references: C:\repos\FCRM
* Local configuration: C:\repos\FCRM.env
* Symcor reference material: C:\repos\FCRM\symcore

Use the actual current locations if they differ. Do not recreate missing directories or assume the new session can access ChatGPT Library links.

Inspect the current branch, HEAD, working-tree changes and known active operations. The latest report mentioned HEAD 22046c1; treat that as historical evidence to compare, never a revision to restore.

Preserve all application changes, untracked files and other sessions’ work, including the previously reported staged .github/workflows/ci.yml deletion. Do not reset, stash, clean, switch branches, stage, commit, push or create a PR.

2. Update the existing authoritative documents

Locate and update the current equivalents of:

* CLUE_HANDOFF.md
* START_NEW_SESSION.txt
* Project/reference index
* Current task and blocker register
* Symcor authentication/connectivity notes

Use the established handoff structure. The latest report mentioned section 28; verify the actual latest content before editing. Preserve historical evidence while marking superseded conclusions clearly.

Record:

* Checkpoint timestamp with timezone, repository, branch and HEAD.
* Current task, completed work, outstanding work and parked items.
* Relevant changed files and known ownership boundaries.
* Exact paths to source documents, scripts, configuration references and diagnostic reports.
* Which required artifacts are tracked, ignored, untracked or outside the repository.
* What was actually tested, where, against which target and with what result.
* The next action, its prerequisites and the responsible role when known.

Do not overwrite a document another session is actively editing. If ownership cannot be resolved, save a clearly identified supplemental checkpoint and report the limitation.

3. Carry forward the latest corrected findings

Reconcile these points with the existing reports and source documents:

* The JKS password is available, the keystore opens and the private key was reported usable. “Obtain the JKS password” is no longer an open task.
* Client-certificate support was added to the Symcor application transport, including a correction for SSLContext replacement involving pip-system-certs.
* Local tests demonstrated certificate transmission to a loopback server. Keep that separate from live PenHub evidence.
* A client identity was configured for the live PAT attempts. PenHub receiving or accepting that identity remains unconfirmed.
* Live DNS/TCP checks succeeded, but TLS failed. No successful live HTTP/SOAP result was established.
* The 15:01:48Z certificate-verification failure must remain recorded with its exact date, configuration and evidence. Preserve its distinction from the later connection resets.
* Do not restore the retracted claims “provably transmitted to PenHub” or “no longer a CLUE-side gap.”
* The current client_certificate_sent flag does not independently establish wire transmission. Preserve the limitation identified in the evidence review.
* SASE inspection, source allow-listing, certificate registration and trust-chain issues remain hypotheses or questions unless supported by new evidence.
* TDBBASIC was found in existing documentation associated with Production/CAT. Its applicability to PAT remains unresolved unless a newer authoritative source answers it.
* componentName is caller-chosen according to the reviewed contract. Document examples and predecessor configuration are not automatically active PAT settings.
* Preserve the distinction between prepared and sent communications. GATEWAY_OWNER_MESSAGE_DRAFT.md was reported prepared, not sent.

Document the configuration names the application actually consumes, including the current CLUE_SYMCOR_* TLS settings. The legacy JKS variable was reported inert; do not describe it as effective application configuration.

Retain test counts with their command, scope, revision and evidence. Do not combine the reported 189-test run, focused loopback checks and earlier acceptance results into an invented current total.

4. Preserve the wider project context

Retain existing decisions covering the DAT input contract, staged Symcor retrieval, cheque/image association, Tungsten processing, Excel output, recovery behavior and concurrency limits.

Carry forward unresolved business-template mapping and DEV/runtime validation separately from laptop connectivity. Preserve the latest execution-path decision and conditional status of any Rahona migration.

Update only demonstrated changes; do not reopen settled requirements or perform another broad project audit.

5. Generate the exact new-session startup prompt

Write START_NEW_SESSION.txt using verified paths, with no unresolved placeholders.

It must be self-contained and include:

* A statement that this continues the existing CLUE project.
* The checkpoint, actual repository location, branch/HEAD and relevant uncommitted state.
* Exact reading order and paths for the main handoff, current tasks, source index, latest connectivity reconciliation and necessary supporting references.
* An instruction to read those files fully and reconcile any newer changes forward.
* English-only, native-text-tool and secret-handling requirements.
* Known ownership boundaries and parked work.
* The next authorized action and its completion evidence.

The next session should restore context and continue the existing gateway/network and PAT-configuration follow-up. If the needed external response is still unavailable, it should identify the precise blocker without inventing another development task or repeating the handshake matrix.

Any subsequent live retry must remain within the previously authorized bounded test scope and follow the applicable prerequisites. Do not launch one during this handoff.

The startup prompt must work without access to this conversation or the previous agent’s memory.

6. Validate and deliver

Read back the final files. Verify every required path or explicitly mark it unavailable. Check that the handoff, task register and startup prompt agree.

Keep secrets and sensitive payloads out of documentation. Record safe paths and configuration names, never .env contents, passwords, private keys or raw customer data.

Return:

1. Exact absolute paths of all documents updated or created.
2. The complete START_NEW_SESSION.txt contents, read from disk, in one copyable text block.
3. A short statement of what the new session should do first.
4. Any unresolved ownership or file-access limitation.

This task authorizes documentation updates and read-only inspection. Leave application code, configuration and credentials unchanged. Do not run provider calls, repeat test suites or rebuild release packages.
