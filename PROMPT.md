Stage 0 — Locate and stage the CLUE package only

This is a bounded preparation task. Do not deploy the application and do not run any deployment scripts yet.

All responses, commands, evidence, and reports must be in English.

Objective:
Locate the package produced from the current integration worktree, copy it into an isolated Linux installation-simulation landing directory, verify copy integrity, and stop. We will execute and evaluate the installation steps one at a time in later instructions.

Expected source context:

* Repository: TD-Universe/W001CLUEinitialRepo
* Integration branch: integration/edponbaord-main-20260924
* Expected HEAD: c70b121f397736e4a0e65f903f80547fd1f1ab16
* Reported integration worktree: C:\repos\clue-edp-integrate-20260924
* Expected local package name: target/clue-code-1.0.5-SNAPSHOT.tar.gz

Important evidence boundary:

* Do not use the Nexus artifact named clue-code-1.0.5-20260924.230307-1.tar.gz as the current PR #19 package. It predates PR #19.
* Do not assume that any file named clue-code*.tar.gz belongs to the current integration commit.
* Do not download anything from Nexus or trigger any pipeline in this task.
* Do not rebuild the package unless the expected current local package cannot be found. If it is missing, stop and report instead of rebuilding.

Tasks:

1. Establish repository identity without changing it.

Run read-only Git checks:

* git worktree list
* git remote get-url origin
* git branch --show-current
* git rev-parse HEAD
* git status --short --branch

Locate the worktree for integration/edponbaord-main-20260924.

Do not checkout, merge, rebase, pull, reset, clean, commit, push, or change branches.

2. Locate the current package.

Search only:

* the integration worktree;
* its target directory;
* explicitly configured local build-output directories.

Do not search the entire computer.

Prefer:

C:\repos\clue-edp-integrate-20260924\target\clue-code-1.0.5-SNAPSHOT.tar.gz

Record:

* absolute source path;
* filename;
* size;
* modification time;
* SHA-256;
* integration worktree HEAD;
* whether the package has documented build provenance for that HEAD.

A matching filename or recent modification time alone is not proof of provenance. If no manifest or build record connects it to c70b121f397736e4a0e65f903f80547fd1f1ab16, classify provenance as:

LOCAL_INTEGRATION_ARTIFACT_REPORTED_AT_CURRENT_WORKTREE_HEAD

Do not claim cryptographic source-commit provenance unless it is actually embedded or recorded.

3. Perform a read-only archive sanity check before copying.

Do not extract it yet.

Confirm that the archive is readable and includes at least:

* pyproject.toml
* requirements.txt
* src/clue/
* tests/clue/
* deploy/clue_with_runtime_secrets.sh

Check for:

* absolute member paths;
* .. traversal;
* duplicate member paths;
* symlinks or hard links;
* nested .git;
* packaged .env;
* obvious real certificate/key material.

If an unsafe condition is found, do not copy the package. Stop and report it.

4. Create an isolated Linux simulation landing directory.

Prefer the existing WSL RHEL filesystem because later steps will run Bash and must preserve Unix behavior.

Do not place the simulation under /mnt/c, inside any Git worktree, under the real /opt/clue, or inside an active application directory.

Create a unique temporary directory using mktemp, with a structure similar to:

/tmp/clue-install-simulation.XXXXXXXX/incoming/

Record the exact generated path.

This is a simulation landing directory only. Do not claim that it is the real DEV/EDP landing path.

5. Copy, do not move, the package.

Copy the verified package into the simulation incoming directory.

Requirements:

* preserve the original source file;
* do not overwrite an existing different file;
* if the destination filename already exists, compare hashes first;
* if hashes differ, stop without overwriting;
* do not extract the archive;
* do not rename the archive;
* do not change repository files.

6. Verify the staged copy.

Calculate SHA-256 for both:

* the source package;
* the copied package.

They must be identical.

Also record the destination file size and permissions.

7. Stop after staging.

Do not perform any of the following:

* do not extract the archive;
* do not execute deploy/*.sh;
* do not run Maven, pytest, pip, or the application;
* do not use sudo;
* do not invoke salt-call;
* do not retrieve secrets;
* do not contact Symcor or Tungsten;
* do not contact a DEV server;
* do not modify /opt/clue;
* do not create or modify AutoSys jobs;
* do not commit, push, update a PR, or trigger EDP.

Return this exact report structure:

STAGE_0_RESULT: READY_FOR_STEP_1 | BLOCKED
Repository:
Remote:
Branch:
HEAD:
Working-tree state:
Package source:
Package filename:
Package size:
Package modified time:
Source SHA-256:
Provenance classification:
Archive readable:
Required members present:
Unsafe paths:
Duplicate paths:
Links:
Contamination findings:
Simulation root:
Installation landing directory:
Staged package:
Destination size:
Destination SHA-256:
Source/destination hashes identical:
Repository files changed:
External systems contacted:
Scripts executed:
Blockers or evidence limitations:
READY_FOR_NEXT_INSTRUCTION: YES | NO

If successful, end with:

Package staged successfully. No extraction or installation command has been executed. Waiting for the next single-step instruction.

Do not proceed beyond this point.
