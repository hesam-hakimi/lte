Verify and safely publish the isolated deployment-guide generator commit.

This task is verification and remote durability only. Do not edit any files.

Expected repository: fcrm_clue
Expected branch: feature/clue-durable-core
Expected local commit:
fc07ec4409a5fb1142c6d1632cd5623779735450

Required steps:

1. Identify and report:
   - repository root;
   - current branch;
   - current HEAD;
   - configured origin URL;
   - current porcelain Git status.

2. Fetch origin without modifying the working tree.

3. Inspect the expected commit directly using Git, not the prior agent summary. Confirm its parent, complete file list and diff statistics.

4. The commit must contain exactly these two added files:
   - tools/generate_deploy_md.py
   - tests/clue/test_generate_deploy_md.py

   Confirm explicitly that it does not contain:
   - .github/workflows/ci.yml;
   - deploy.md;
   - build/stage content;
   - handoff files;
   - artifact files;
   - any other tracked or unrelated change.

   If the commit contains anything else, stop without pushing.

5. Re-run the focused test from the tracked location:

   python -m pytest tests/clue/test_generate_deploy_md.py -q -o addopts=""

6. Confirm that the tracked generator contains no release-specific URL, filename, commit SHA or checksum literal, including:
   - f676277
   - a516a21
   - a6f3ba4
   - rp.td.com
   - the known artifact SHA-256 prefixes

7. Determine whether the remote branch already exists and list the exact commits that would be introduced by the push.

   If the push would publish any unrelated commit, or the remote branch has diverged, stop and report the evidence. Do not force-push.

8. If and only if all checks pass, push the existing branch normally:

   git push -u origin feature/clue-durable-core

   Do not use --force or --force-with-lease.

9. Verify using git ls-remote that the remote branch resolves exactly to:
   fc07ec4409a5fb1142c6d1632cd5623779735450

10. Leave every pre-existing modified, deleted or untracked file exactly unchanged. Do not stage, stash, reset, restore, clean or commit them.

Do not rebuild or upload an artifact, modify Nexus, regenerate or commit deploy.md, call providers, create or merge a PR, or modify application PR #6.

Return:
- repository and remote identity;
- verified commit file list and diff statistics;
- focused test result;
- commits evaluated for push;
- push result;
- remote branch SHA verification;
- final Git status;
- confirmation that all unrelated working-tree changes remained untouched.
