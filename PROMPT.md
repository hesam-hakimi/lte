Perform a read-only reconciliation of the preserved dirty fcrm_clue worktree against the current clean remote branch.

Do not edit, stage, unstage, restore, reset, stash, clean, commit, merge, rebase or push anything.

Expected repository:
C:\repos\fcrm_clue

Previously reported local state:
- branch: feature/clue-durable-core
- local HEAD: fc07ec4409a5fb1142c6d1632cd5623779735450
- one staged deletion: .github/workflows/ci.yml
- backup: C:\temp\clue-git-backup-20260924-105343

Expected current remote tip:
origin/feature/clue-durable-core
26a397d3129aaf69b01742e6ddfd8da10b2fca99

1. Confirm the actual repository root, branch, HEAD, origin and all linked worktrees.

2. Capture read-only evidence:

   git status --porcelain=v2 --branch -uall
   git diff --name-status
   git diff --cached --name-status
   git ls-files --others --exclude-standard
   git ls-files --others --ignored --exclude-standard

   Do not print `.env`, credentials, patches or secret values.

3. Fetch origin without modifying the working tree.

4. Confirm the current remote SHA and describe the exact divergence between the local branch and remote branch.

5. Classify every staged, unstaged and untracked path as:

   - already durable on the clean remote branch;
   - intentional pending source/config/test/CI/documentation work;
   - generated artifact or evidence that should remain ignored on disk;
   - private or machine-specific;
   - uncertain and requiring an owner decision.

6. Special reconciliation gates:

   A. `.github/workflows/ci.yml`
   - Compare its staged deletion with the current remote branch, origin/main and all proposed replacement workflows.
   - Determine whether it is a proven intentional replacement or an unresolved deletion.
   - Do not unstage, restore or delete anything in this task.

   B. `requirements.lock.txt`
   - Confirm whether build/package code requires it.
   - Identify its current location, ignore rule and canonical tracked destination.
   - Determine whether excluding it makes a clean checkout unable to build the bundle.
   - Do not force-add it yet.

   C. Generator/bootstrap files
   - Confirm that `.gitattributes`, `deploy/clue-bootstrap.sh`,
     `tools/generate_deploy_md.py` and
     `tests/clue/test_generate_deploy_md.py`
     are already durable at remote commit 26a397d...
   - Mark any equivalent local uncommitted copies as superseded; do not recommit them.

   D. Remaining tracked modifications
   - Review `.gitignore`, `pyproject.toml`, `requirements.txt` and both handoff documents.
   - Identify the originating task/session and whether each change is already represented remotely, still required, or obsolete.
   - Report the mixed-line-ending condition without normalizing any file.

   E. Generated delivery and artifact paths
   - Confirm they remain on disk and are ignored by narrow rules.
   - Do not delete, move, rebuild or upload them.

7. Verify that the existing backup directory still contains the previously reported status and staged/unstaged patch evidence. Do not display patch contents.

8. Return an exact disposition table with:

   - path;
   - staged/unstaged/untracked/ignored state;
   - purpose;
   - remote-equivalent status;
   - KEEP / SUPERSEDED / NEEDS DECISION / GENERATED-IGNORE recommendation;
   - proposed future clean branch or commit grouping.

9. Finish by recommending the safest clean-worktree plan for the approved remaining changes.

Do not perform that plan in this task. Do not modify Nexus, artifacts, PR #6 or the application repository.
