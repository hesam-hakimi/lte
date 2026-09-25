Reconcile the verified Salt runtime-secret wrapper onto the latest PR #13 branch tip, fix executable modes in the Maven tar.gz, independently revalidate, and publish by normal fast-forward push.

Do not modify or clean the existing worktree that contains the local commit and Maven evidence.

Verified local source commit:
07c096c67a0d5c3d5c5576d38d382abd6aec3400

Its recorded parent:
471d6303840af92e8e0300f96d3ee0ffbe8ed1d8

The remote branch backing PR #13 moved during the prior task and was last reported at a SHA beginning with:
0b47bcb

Resolve the exact remote branch name from Git and refs/pull/13/head; do not guess its spelling.

Safety requirements:

* do not access real Salt pillars or secrets;
* do not call Vault, Symcor or Tungsten;
* do not modify any fcrm_clue repository or worktree;
* do not clean, reset, restore, rebase or remove the existing implementation worktree;
* do not include target/, Maven wrapper downloads or temporary evidence;
* do not force-push;
* do not reopen or merge PR #13.

1. Verify the source commit

Inspect the local source commit directly.

Confirm that it contains exactly:

* Deliverables/deploy/clue_with_runtime_secrets.sh, Git mode 100755;
* Deliverables/tests/clue/test_runtime_secrets_wrapper.py, Git mode 100644.

Confirm its parent, file list, modes and diffstat.

Scan the committed blobs and confirm that they contain no real credentials, keys, certificates, .env values or release-specific artifact identities.

2. Fetch and verify the new remote tip

Fetch origin.

Resolve:

* the exact remote branch backing PR #13;
* its current complete SHA;
* refs/pull/13/head;
* the commit range from 471d630... to the current remote tip.

Require that:

* the remote change is a normal descendant of 471d630...;
* no force-rewrite occurred;
* the four Salt pillar names remain unchanged;
* the application CLUE_* configuration contract remains unchanged;
* the later commits do not already add an equivalent runtime-secret wrapper;
* the Maven assembly structure is still compatible with the proposed change.

Report the new intervening commits and files.

If the history diverged, the secret contract changed, or an equivalent implementation already exists, stop.

3. Create a new clean publication worktree

Create a new linked worktree and temporary local branch from the exact current remote tip.

Do not reuse or modify the previous implementation worktree.

If the proposed branch or worktree path already exists, stop instead of deleting or overwriting it.

4. Replay only the verified local commit

Cherry-pick only:

07c096c67a0d5c3d5c5576d38d382abd6aec3400

Do not cherry-pick unrelated commits.

If a conflict occurs, stop without resolving or pushing.

After the cherry-pick, confirm that the wrapper and test blobs match the verified local source commit exactly and retain Git modes 100755 and 100644.

5. Fix executable modes in the Maven archive

Inspect the current assembly.xml structure before editing.

The existing Windows Maven build packages every .sh member as archive mode 0644, including scripts stored in Git as 100755.

Implement the smallest non-duplicating Maven Assembly configuration that packages maintained files under Deliverables/deploy/**/*.sh with tar mode 0755.

Requirements:

* do not add the same archive member through two overlapping fileSets;
* if the general Deliverables fileSet includes deployment shell scripts, exclude those exact shell paths from it before adding the dedicated executable fileSet;
* preserve the existing archive-root layout;
* preserve LF bytes;
* preserve normal non-shell file modes;
* do not mark Python, YAML, JSON, TXT, certificate examples or documentation executable;
* do not change artifact coordinates, Nexus publication, environment variables or CD behavior;
* do not change the wrapper solely to compensate for packaging;
* do not rely on Windows NTFS executable bits.

The intended result is that all maintained deployment .sh files, including:

deploy/clue_with_runtime_secrets.sh

have tar mode 0755 exactly once.

6. Add or perform an archive-mode regression check

Use the smallest appropriate test or deterministic validation to prove:

* no duplicate archive member names;
* every maintained deploy/**/*.sh member is 0755;
* non-shell deployment files are not made executable;
* the wrapper in the archive is byte-identical to the committed blob.

If adding a tracked regression test is necessary, keep it narrowly focused. Otherwise perform and report a deterministic post-build verification.

7. Produce one coherent unpushed commit

Because the replayed commit remains local-only, amend it so the new branch contains exactly one commit above the current remote tip.

The final commit may contain only:

* Deliverables/deploy/clue_with_runtime_secrets.sh;
* Deliverables/tests/clue/test_runtime_secrets_wrapper.py;
* the minimal Maven assembly-mode correction;
* one directly associated focused test only if required.

Use the message:

feat(deploy): load CLUE runtime secrets from Salt pillar

Report the new commit SHA and its exact parent.

8. Validate from another disposable clean checkout

Create a separate disposable clean worktree at the final amended commit.

Run all validation from that clean checkout so the publication worktree remains clean.

Required validation:

* bash -n on the wrapper;
* confirm LF-only, no BOM and committed mode 100755;
* rerun the focused WSL secret-wrapper tests;
* rerun the existing full test suite;
* run the Maven package command used by PR #13;
* safely inspect the generated tar.gz;
* verify no duplicate members;
* verify all deploy/**/*.sh modes are 0755;
* verify the wrapper is byte-identical to the committed blob;
* rerun the forbidden secret/artifact scan;
* confirm no .env, PEM, key, JKS, P12, CRT, CER, PFX, wheel or temporary secret material is packaged;
* confirm no real provider is called.

Test counts may differ if Muhammad’s intervening commits legitimately changed the suite, but there must be no new failure or unexplained regression.

ShellCheck remains optional if it is unavailable; report it as unverified rather than installing unrelated software.

After recording evidence, remove only the disposable verification worktree if Git confirms it is safe. Do not remove either existing implementation worktree.

9. Prove the proposed push is isolated

The range from the freshly recorded remote tip to the final HEAD must contain exactly one commit.

Report:

* parent and commit SHA;
* complete changed-path list;
* file modes;
* diffstat;
* wrapper/test blob comparison;
* assembly change;
* test and build results;
* archive member and mode evidence.

The publication worktree must be clean.

10. Publish safely

Immediately before pushing, verify with git ls-remote that the remote branch backing PR #13 still points to the recorded remote tip.

If it moved again, stop.

If unchanged and every gate passed, perform a normal fast-forward push:

git push origin HEAD:refs/heads/<exact-remote-branch-name>

Do not use force or force-with-lease.

Verify that the remote branch now resolves exactly to the new commit SHA.

Do not reopen or merge PR #13.

Return:

* exact remote branch spelling;
* old and new remote SHAs;
* intervening Muhammad commits reviewed;
* final commit parent, files, modes and diffstat;
* focused and full test results;
* Maven build result;
* tar.gz filename, checksum, member count and mode verification;
* secret-safety result;
* push result;
* explicit remaining integration item: the real Python production command AutoSys must place after --;
* reminder that Muhammad must reopen PR #13 or create a replacement PR.
