Stage 0 — Place the package on the actual DEV server only

The previous attempt went in the wrong direction. Stop the local WSL simulation immediately.

Do not create or continue any /tmp/clue-install-simulation* directory. Do not create additional temporary helper scripts. Do not delete the existing temporary helpers unless explicitly requested.

Objective

Perform exactly one operation:

1. Find the correct existing clue-code-*.tar.gz package for the current integration branch.
2. Determine the authoritative landing directory on the actual DEV server—the directory where EDP places the package and from which installation is expected to begin.
3. Copy the package to that directory.
4. Verify byte identity.
5. Stop.

Do not extract, install, execute, or modify the package.

Expected source context

Start with:

* Worktree: C:\repos\clue-edp-integrate-20260924
* Draft PR: #19
* Expected integration HEAD: c70b121f397736e4a0e65f903f80547fd1f1ab16
* Local candidate:
    C:\repos\clue-edp-integrate-20260924\target\clue-code-1.0.5-SNAPSHOT.tar.gz

Verify all values before using them. Obtain the exact branch name from Git or PR #19; do not guess its spelling.

Do not treat the older Nexus artifact ending in:

clue-code-1.0.5-20260924.230307-1.tar.gz

as the PR #19 artifact unless you can prove that it was produced from the expected integration commit.

Do not rebuild the package during this stage. If no existing package can be tied reliably to the intended integration revision, stop with:

BLOCKED_ARTIFACT_IDENTITY

Establish the DEV destination

Inspect authoritative existing evidence, including:

* Current CD.yml
* Relevant EDP/CD configuration
* Deployment handoff documentation
* Output or logs from the successful EDP run
* Existing configured server-delivery settings

You must establish both:

* Exact DEV hostname
* Exact absolute landing directory

Quote the exact configuration property, file location, or EDP log entry proving each value.

Important:

* Distinguish the Nexus repository path from the DEV server filesystem path.
* Do not assume that /opt/clue itself is the landing directory.
* A basename, application root, batch name, or intended unpack directory is not sufficient proof of the package landing directory.
* Do not use information from historical documentation as current server evidence unless it matches the active configuration.
* If the exact hostname or directory is missing, ambiguous, or has multiple candidates, do not transfer anything. Stop with:

BLOCKED_DESTINATION_UNCONFIRMED

Transfer rules

If the package identity and destination are both proven:

* Use only an existing authorized transfer method already available for this DEV environment, such as the configured EDP artifact-copy step, SCP/SFTP, or an approved mounted share.
* Do not extract or reuse credentials.
* Do not bypass access controls or request broader permissions.
* Copy the package; do not move or delete the source.
* Do not change unrelated files.
* Do not use sudo merely to bypass a permission problem.
* Do not overwrite an existing destination file with different content.

If a file with the same name already exists:

1. Calculate SHA-256 for the source and destination.
2. If the hashes match, leave it untouched and report ALREADY_PRESENT.
3. If the hashes differ, do not overwrite it. Stop with BLOCKED_EXISTING_FILE_MISMATCH.

After a successful copy, verify:

* Destination file exists
* Filename
* File size
* Source SHA-256
* Destination SHA-256
* Both hashes match

Hard stop boundaries

Do not:

* Extract or unpack the archive
* Run tar, deployment scripts, wrapper scripts, or application commands against it
* Install dependencies
* Run Maven or rebuild the archive
* Retrieve Salt secrets
* Contact Symcor or Tungsten
* Run an AutoSys job
* Start the application
* Modify permissions, sudoers, environment files, or server configuration
* Trigger a general deployment pipeline that may install or execute scripts
* Commit, push, merge, or modify any PR
* Print credentials, tokens, certificates, keys, or secret values

An EDP operation may be used only if it has a proven artifact-copy-only mode. If it would perform installation or script execution, do not trigger it.

Required final report

Return exactly this information:

* RESULT: PACKAGE_PLACED, ALREADY_PRESENT, BLOCKED_ARTIFACT_IDENTITY, BLOCKED_DESTINATION_UNCONFIRMED, BLOCKED_ACCESS, or BLOCKED_EXISTING_FILE_MISMATCH
* Source worktree
* Source branch
* Source HEAD
* Source package path
* Evidence connecting the package to the source revision
* Source size
* Source SHA-256
* DEV hostname
* DEV landing directory
* Exact evidence establishing the hostname and directory
* Transfer method used
* Final destination path
* Destination size
* Destination SHA-256
* Hashes match: yes or no
* Archive extracted: no
* Deployment scripts executed: none
* Installation performed: no
* Repository files changed: none
* Ready for manual inspection: yes or no

Stop immediately after package placement and verification. End with:

“Package placement is complete. No extraction, installation, or deployment script execution was performed. Waiting for the next instruction.”
