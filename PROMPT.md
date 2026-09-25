Continue the existing CLUE runtime-secrets task. All responses, code, and reports must be in English. Execute the work, not just propose a plan.

Current workspace:
C:\repos\clue-edponboard-runtime-env

Expected origin:
https://github.com/TD-Universe/W001CLUEinitialRepo.git

Existing implementation commit: resolve 07c096c locally to its full SHA.
Target remote branch: feature/edponbaord

The latest terminal output shows fetch completed without errors and only target/ is untracked.

1. Verify the repository identity and implementation commit. Confirm its changes are the runtime-secrets wrapper and its tests. Preserve this worktree and its existing target/ build evidence. Do not touch C:\repos\fcrm_clue.
2. Fetch the target branch and record its current full SHA. Inspect the changes since the implementation commit’s parent. Create or safely resume an isolated publication worktree based on the latest target tip. Apply only the existing runtime-secrets changes, preserving Muhammad’s updates. Do not overwrite an existing worktree or guess conflict resolutions.
3. Fix the confirmed packaging issue in assembly.xml: deployment shell scripts must have mode 0755 inside the tar.gz. Use non-overlapping fileSets, excluding those scripts from the general fileSet before including them in a dedicated executable fileSet. Preserve archive paths, other file modes, and existing content.
4. Run Bash syntax checks, the runtime-secrets tests in the available Linux/WSL environment, the existing regression suite, and the Maven package build. Use synthetic secrets and mocked Salt commands. Do not retrieve real secrets or invoke production processing.
    Inspect the resulting archive: deployment scripts are 0755 and LF-only; the wrapper matches the committed source; no duplicate member paths, real secrets, local .env, wheel files, or nested build outputs were introduced. Report actual results and any unavailable checks.
5. Commit only the intended runtime-secrets and packaging changes. Do not stage target/ or unrelated files. Keep the publication history minimal and review its complete diff against the recorded remote tip.
6. Once validation passes, check the remote branch again. If unchanged, perform a normal push to feature/edponbaord and verify the resulting remote SHA. If it advanced, incorporate the new changes and rerun affected checks before pushing. Never force-push. Do not create, reopen, or merge a PR.

If TD security blocks a network operation, stop that operation and report the exact failure without attempting a bypass.

Return a concise report: base and final commit SHAs, changed files, test/build results, archive permission evidence, push result, and final remote SHA. Clearly distinguish local validation from any server validation still pending.
