Continue in the current VS Code window and the current clue-rc-20260926 worktree. Do not create another worktree, branch, or VS Code window.

This is a narrowly scoped cleanup. Do not run the full test suite, packaging gates, Maven build, archive inspection, or any previously completed validation. Do not commit, push, open a PR, trigger CI/XLR, or publish anything.

Goal: for the protected deployment-contract files, preserve the exact origin/main implementation and retain only the explicitly requested version increase from 1.1.0-SNAPSHOT to 1.1.1-SNAPSHOT.

Protected files:

* .gitignore
* CI.yml
* CD.yml
* assembly.xml
* assembly/pom.xml
* pom.xml

First perform this read-only preflight:

git status --short
git rev-parse HEAD
git rev-parse origin/main
git rev-parse -q --verify MERGE_HEAD
git diff --name-status
git diff --cached --name-status
git diff origin/main -- .gitignore CI.yml CD.yml assembly.xml assembly/pom.xml pom.xml
git diff --cached origin/main -- .gitignore CI.yml CD.yml assembly.xml assembly/pom.xml pom.xml

Stop without modifying anything if there are unexpected unstaged or untracked repository files.

Then restore only the six protected files to the exact local origin/main versions:

git restore --source=origin/main --staged --worktree -- .gitignore CI.yml CD.yml assembly.xml assembly/pom.xml pom.xml

After that restore, apply only these exact version changes:

1. Root pom.xml: change the project’s direct version from 1.1.0-SNAPSHOT to 1.1.1-SNAPSHOT.
2. assembly/pom.xml: change its parent version from 1.1.0-SNAPSHOT to 1.1.1-SNAPSHOT.
3. assembly/pom.xml: change the assembly module’s direct version from 1.1.0-SNAPSHOT to 1.1.1-SNAPSHOT.
4. Active DEV CD.yml batch_url: change only the logical Snapshot directory and artifact filename from 1.1.0-SNAPSHOT to 1.1.1-SNAPSHOT.

Do not:

* change Maven modules, packaging, plugins, repositories, coordinates, or file layout;
* change assembly.xml;
* change .gitignore;
* change or add anything in CI.yml; it has no independent version field;
* change owner, group, basename, endpoint, repository, NPID, permissions, or any other CD.yml value;
* touch any application, test, wrapper, documentation, or Deliverables/ file.

Before editing, confirm that every expected source value occurs in the correct semantic position. If a count or source value differs, stop and report it rather than guessing.

Stage only the three version-bearing files:

git add -- pom.xml assembly/pom.xml CD.yml

Run only these final diff checks—no tests or builds:

git diff --name-status
git diff --cached origin/main -- .gitignore CI.yml CD.yml assembly.xml assembly/pom.xml pom.xml
git diff --cached origin/main -- .gitignore CI.yml assembly.xml
git diff --cached origin/main --word-diff=plain -- pom.xml assembly/pom.xml CD.yml

Expected protected-file result:

* .gitignore: byte-identical to origin/main
* CI.yml: byte-identical to origin/main
* assembly.xml: byte-identical to origin/main
* pom.xml: only the direct project-version change
* assembly/pom.xml: only the parent-version and module-version changes
* CD.yml: only the active DEV batch_url version change

Source Control may still show files inherited from the pending merge when compared with the old pre-merge HEAD. Do not attempt to remove those legitimate origin/main changes. The authoritative check for this cleanup is the scoped diff against origin/main.

Stop after reporting the exact diff. Do not run gates and do not commit.
