Continue in the current VS Code window and the current clue-rc-20260926 worktree.

Goal: remove every local CI/CD, Maven and packaging-contract change except the authorized version increase to 1.1.1-SNAPSHOT.

Do not create another branch or worktree. Preserve the pending merge and MERGE_HEAD. Do not abort the merge, reset the branch, commit, push, build, test, publish, upload, or trigger CI.

First inspect the current index, working tree and origin/main. Stop without changing anything if the expected files or version anchors are ambiguous.

For these six files, use origin/main as the authoritative content baseline:

* .gitignore
* CI.yml
* CD.yml
* assembly.xml
* assembly/pom.xml
* pom.xml

Restore their complete content from origin/main, then reapply only these version changes:

1. In root pom.xml, change the CLUE project version from 1.1.0-SNAPSHOT to 1.1.1-SNAPSHOT.
2. In assembly/pom.xml, change:
    * the CLUE parent version to 1.1.1-SNAPSHOT;
    * the assembly module’s own declared version to 1.1.1-SNAPSHOT.
3. In the active DEV CD.yml batch_url, change only the artifact version directory and filename from 1.1.0-SNAPSHOT to 1.1.1-SNAPSHOT.

No other difference from origin/main is authorized.

In particular:

* CI.yml must be byte-identical to origin/main; it has no independent CLUE version to modify.
* .gitignore and assembly.xml must be byte-identical to origin/main.
* Do not change the Maven module structure, parent coordinates, packaging type, plugins, Assembly file sets, artifact naming logic or repository configuration.
* Do not change Nexus endpoints.
* Do not change owner, group, states, grains or other deployment settings.
* Because this step authorizes only the version increase, restore CD.yml basename to the exact origin/main value; do not retain the local /app/clue change.
* Do not touch application source files, existing deploy scripts, or the three untracked operational-wrapper files during this step.

Keep the corrected versions in both the index and working tree so that no intended version change remains unstaged.

After the correction, report:

1. git status --short
2. git diff --name-status
3. git diff --cached --name-status
4. The complete staged diff against origin/main for:
    * pom.xml
    * assembly/pom.xml
    * CD.yml
5. Proof that .gitignore, CI.yml, and assembly.xml are byte-identical to origin/main
6. Whether MERGE_HEAD is still present and unchanged

The diff against origin/main must contain only the four version-bearing lines described above. If anything else differs, stop and report it rather than repairing or guessing.

Do not commit or push. Stop after the report.
