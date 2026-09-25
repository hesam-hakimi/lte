Create a draft pull request for the completed integration branch. Do not merge it.

Repository:
https://github.com/TD-Universe/W001CLUEinitialRepo.git

Worktree:
C:\repos\clue-edp-integrate-20260924

Expected head branch:
integration/edponbaord-main-20260924

Expected head SHA:
c70b121f397736e4a0e65f903f80547fd1f1ab16

Expected base:
main at a69970eaeb8a762ef3734e182f5955c823bfcb80

1. Fetch origin and verify the head and base SHAs. Check whether an open PR already exists for this exact head branch. Do not create a duplicate.
2. If either branch has advanced, stop and report the new SHAs. Do not update or rewrite the integration branch in this step.
3. Create a draft PR with:
    * Base: main
    * Head: integration/edponbaord-main-20260924
    * Title: Integrate EDP onboarding, runtime Salt secrets, and environment lifecycle
4. The PR description must clearly include:
    * Why: preserve the EDP Deliverables layout while integrating main’s environment-lifecycle functionality and runtime Salt secret retrieval.
    * Changes: resolved file-location conflicts, relocated lifecycle/configuration assets, added runtime-secret precedence mode, removed the unrelated sudo -n true probe, preserved non-interactive Salt retrieval, and retained executable deployment-script modes.
    * Validation reported for this exact commit: 841 passed and 53 skipped on Windows; 75 focused tests passed in WSL; 119 lifecycle tests passed; six shell scripts passed bash syntax checks; Maven package succeeded; clue.batch help succeeded; archive structure, permissions, duplicate paths, and contamination checks passed.
    * Test limitation: one pre-existing NTFS timestamp test showed intermittent negative-age behavior during an intermediate run; isolated reruns and complete runs passed.
    * Pending live validation: DEV Python version and virtual environment, dependency wheels, deployed path, AutoSys command/account/working directory, sudoers permission for salt-call pillar.get, real configuration IDs, input landing path, and environment selection.
    * State explicitly that no real secret, Salt provider, Symcor endpoint, Tungsten endpoint, or DEV host was contacted.
5. Do not assign reviewers unless repository ownership rules identify them automatically. Do not modify labels, milestones, main, or feature/edponbaord.

If authenticated PR creation is unavailable, do not alter credentials. Return the GitHub compare/create URL and the complete prepared PR title and body.

Return the draft PR URL and number, verified base/head SHAs, and whether repository checks started.
