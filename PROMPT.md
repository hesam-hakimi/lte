Implement the concrete integration fixes identified in your review. All responses, code, tests, and documentation must be in English.

Repository: TD-Universe/W001CLUEinitialRepo
Publication worktree: C:\repos\clue-edp-publish-20260924
Last reported published tip: e846755
Onboarding branch: feature/edponbaord

Prepare a reviewable local integration result. Do not push, create a PR, or merge into local or remote main.

1. Fetch and record the latest main and onboarding tips. Preserve the original implementation and publication worktrees, including their target/ directories. Create or safely reuse an isolated local integration worktree based on the onboarding tip. Do not access fcrm_clue.
2. Merge origin/main into the integration branch. Resolve the reported file-location conflicts by preserving both main’s environment-lifecycle functionality and the onboarding layout. Place application files, tests, config/environments, and tools/dev_checks under their correct Deliverables paths. Inspect configuration discovery and path references; do not merely move files and assume compatibility. Do not resolve wholesale with “ours” or “theirs”.
3. Fix runtime-secret precedence without changing the established behavior of ordinary local runs:
    * Add a narrowly scoped, explicit runtime-secrets mode enabled by the existing wrapper.
    * In that mode, the four canonical environment variables supplied by the wrapper must take precedence over env-file values and aliases throughout the actual configuration-loading path.
    * Missing required injected values must fail clearly without falling back to stale file secrets.
    * Outside that mode, preserve the existing documented precedence.
    * Keep non-secret environment configuration working.
    * Use synthetic tests to prove both modes, including stale file aliases and certificate/key paths. Never print secret values.
4. Remove the unrelated sudo -n true prerequisite. Retain non-interactive sudo -n for the actual Salt retrieval commands and fail safely when they fail. Do not modify sudoers or request broader privileges.
    Add focused tests showing:
    * Salt retrieval succeeds when sudo permits the required commands but denies true.
    * Denied or failed Salt retrieval prevents the child from running and does not expose secret material.
5. Validate the integrated result:
    * Run relevant runtime/configuration/lifecycle tests and the merged regression suite, with POSIX wrapper tests actually executed on Linux/WSL.
    * Build the Maven archive.
    * Confirm that the relocated lifecycle modules, environment YAML files, tests, and intended tools are included.
    * Confirm deploy shell scripts retain 0755, archive paths are unique, and no real secrets or local build outputs are packaged.
    * Check the evidenced clue-batch entry point using help or synthetic tests; do not process real input or contact live providers.
6. Commit the integration and fixes on the local integration branch using explicit paths. Preserve published history. Update only the relevant existing deployment documentation with the runtime-secrets behavior and evidenced invocation pattern.

Return the branch/worktree, source SHAs, local commits, conflict resolutions, changed files, actual test/build results, and remaining deployment inputs. Distinguish historical documentation about DEV Python from freshly verified server facts.

Complete the local work without waiting for AutoSys details. Stop only for a concrete conflict or decision that cannot be resolved from the code and established contracts.
