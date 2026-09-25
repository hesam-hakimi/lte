The publication report is received. Continue with a focused, read-only review for merge readiness and DEV runtime verification.

Use the publication worktree C:\repos\clue-edp-publish-20260924. Confirm its repository identity and inspect the current origin/main and origin/feature/edponbaord tips. The last reported published commit is e846755. Reuse validation evidence for unchanged code; do not repeat the full test suite.

1. Compare the onboarding branch with main, accounting for the move into Deliverables/. Separate file moves, application behavior changes, and deployment configuration changes. Identify concrete merge risks or conflicts. Do not claim parity with the separate fcrm_clue repository, which remains outside this task.
2. Find the actual application entry point from pyproject.toml, Python CLI/batch modules, and maintained usage documentation. Identify its required arguments and non-secret configuration. Do not treat the pytest harness as the production command. Derive what the repository establishes; list only genuinely missing deployment details.
3. Check how the runtime-secrets wrapper would invoke that entry point. Specifically inspect configuration precedence: could a .env file override the exported runtime secrets? Also check whether a sudo -n true prerequisite could reject an account permitted to run only the required salt-call commands. Report findings with file references; do not change permissions or sudoers.
4. Prepare a minimal DEV smoke-test command using the existing wrapper and a harmless Python child. It should report only whether the required environment values are present and certificate/key files are readable. Never print secret values or certificate/key contents, and do not call Symcor, Tungsten, or process a workbook. Clearly mark any unknown deployed path or interpreter path.

Do not execute the live smoke test, retrieve secrets, modify files, commit, push, or create/merge a PR in this review.

Return: merge-readiness findings, the evidenced application entry point, the DEV smoke-test command, and the specific remaining deployment inputs.
