Publish only the verified deployment-guide generator change by replaying it onto the clean remote branch tip.

This is a narrowly scoped Git-history isolation task. Do not modify, clean, stash, reset, rebase or otherwise disturb the existing dirty worktree or its current local branch.

Repository:
fcrm_clue

Existing dirty local branch:
feature/clue-durable-core

Verified source commit containing the intended patch:
fc07ec4409a5fb1142c6d1632cd5623779735450

Remote destination branch:
origin/feature/clue-durable-core

The prior report recorded the remote tip as:
2a2603fe34fc0ba4c5342e636bbcccaa1332d251

Required procedure:

1. In the existing worktree, record without changing anything:
   - repository root;
   - current HEAD;
   - `git status --porcelain=v1`;
   - origin URL.

2. Fetch origin.

3. Resolve the current SHA of `origin/feature/clue-durable-core`.

   If it is no longer:
   2a2603fe34fc0ba4c5342e636bbcccaa1332d251

   stop and report the new remote state. Do not publish anything.

4. Reconfirm directly that source commit
   fc07ec4409a5fb1142c6d1632cd5623779735450
   changes exactly these two added files and nothing else:

   - tools/generate_deploy_md.py
   - tests/clue/test_generate_deploy_md.py

   Expected diffstat:
   - 2 files changed
   - 309 insertions

5. Create a new, separate linked worktree from the exact remote branch tip.

   Use a new temporary local branch such as:
   publish/clue-generator-isolated-20260924

   If that branch or proposed worktree already exists, stop. Do not delete or overwrite it.

6. Inside the clean worktree, cherry-pick only:

   fc07ec4409a5fb1142c6d1632cd5623779735450

   Do not cherry-pick or merge these unrelated commits:

   - 69786b7...
   - b26286a...
   - 07a705b...

   If the cherry-pick conflicts, stop without resolving or publishing.

7. Verify the resulting new commit:

   - its parent is exactly the recorded remote tip;
   - the worktree is clean;
   - it changes exactly the two expected files;
   - the diffstat remains 2 files and 309 insertions;
   - the stable patch ID matches the stable patch ID of the original
     fc07ec4409a5fb1142c6d1632cd5623779735450 patch.

   Report the newly created commit SHA. It is expected to differ from
   fc07ec4409a5fb1142c6d1632cd5623779735450 because its parent is different.

8. Run:

   python -m pytest tests/clue/test_generate_deploy_md.py -q -o addopts=""

   Require all 10 tests to pass.

9. Inspect the committed generator blob and confirm it contains none of:

   - f676277
   - a516a21
   - a6f3ba4
   - rp.td.com
   - 1138cb0e
   - 8c083149
   - 10e6134e

10. Prove that the proposed push introduces exactly one commit:

    git log --oneline <recorded-remote-tip>..HEAD

    The range must contain only the new isolated generator commit.

11. Immediately before pushing, use `git ls-remote` to confirm that the
    remote destination branch still points to the recorded remote tip.

    If it moved, stop. Do not force-push.

12. If and only if every check passes, perform a normal fast-forward push
    from the clean worktree:

    git push origin HEAD:refs/heads/feature/clue-durable-core

    Do not use `--force` or `--force-with-lease`.

13. Verify with `git ls-remote` that the remote destination branch now
    resolves exactly to the new isolated commit SHA.

14. Return to the original worktree only for read-only verification:

    - original HEAD is unchanged;
    - all original modified/deleted/untracked file entries are unchanged;
    - no original file was staged, restored, reset, cleaned or committed.

    The original branch may now show a changed ahead/behind relationship
    because the remote branch received the clean sibling commit. That is
    expected. Do not try to reconcile it in this task.

Do not remove either worktree, delete branches, regenerate deploy.md,
build or upload artifacts, modify Nexus, call providers, create or merge
a PR, or touch application PR #6.

Return:
- original and clean-worktree identities;
- old remote SHA;
- original and new isolated commit SHAs;
- patch-ID comparison;
- exact new commit file list and diffstat;
- focused test result;
- one-commit push-range evidence;
- push result;
- final remote SHA;
- proof that the original worktree files and HEAD remained untouched.
