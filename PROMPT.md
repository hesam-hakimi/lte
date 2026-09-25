Make the completed local integration branch durable on the remote under its own branch name. Do not modify main or feature/edponbaord, and do not create or merge a PR.

Expected state:

* Repository: TD-Universe/W001CLUEinitialRepo
* Worktree: C:\repos\clue-edp-integrate-20260924
* Local branch: integration/edponbaord-main-20260924
* Expected local HEAD: c70b121f397736e4a0e65f903f80547fd1f1ab16
* Expected origin/main: a69970eaeb8a762ef3734e182f5955c823bfcb80
* Expected origin/feature/edponbaord: e846755dc0ca9007f0a5e1a3a2cbdb1691d2e5ba

1. Verify repository identity, branch, HEAD, merge parents, and working-tree status. Generated target/ files may remain untracked but must not be staged.
2. Fetch origin and verify that both expected remote tips are unchanged. If either main or feature/edponbaord has advanced, stop without pushing and report the new SHAs.
3. Confirm the integration branch contains:
    * the published onboarding commit history unchanged;
    * the merge of the recorded main SHA;
    * the focused integration-fix commit;
    * no temporary helpers, target outputs, credentials, secrets, or unrelated files.
4. Perform a normal push:
    git push -u origin integration/edponbaord-main-20260924
5. Verify with git ls-remote that the remote integration branch resolves exactly to the local HEAD.

Do not force-push. Do not push to feature/edponbaord or main. Do not create, reopen, or merge a pull request. Return the local and remote SHAs, the remote-tip checks, working-tree status, and push result.
