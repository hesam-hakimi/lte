The previous operational-wrapper implementation is rejected. It produced a read-only audit tool, but the required deliverable is a simple, executable deployment wrapper following the actual root-to-NPID operating sequence.

Work in the current VS Code window and current clue-rc-20260926 worktree. Do not create another branch, worktree, or window.

Frozen scope

Do not modify:

* pom.xml
* assembly/pom.xml
* assembly.xml
* .gitignore
* CI.yml
* CD.yml
* any existing application source file
* any existing deployment script

Preserve the already-authorized values:

* version: 1.1.1-SNAPSHOT
* application root: /app/clue

Do not run the full test suite, Maven build, packaging gates, Git-history audit, or previously completed validations. Do not stage, commit, push, open a PR, invoke CI/XLR, upload to Nexus, or contact a server.

First inspect the real package

Before writing anything, inspect every existing tracked file under Deliverables/deploy/ and determine:

1. Which scripts actually exist.
2. Their supported arguments.
3. Which script performs prerequisites, execution, integration checks, probing and runtime-secret loading.
4. The valid order in which those existing scripts must run.
5. Which operations are absent and therefore must be implemented directly by the new wrapper.

Do not reference or recreate nonexistent files such as:

* bin/clue-prepare-host.sh
* bin/clue-deploy.sh
* any wheelhouse
* any release-manager script
* any releases/current layout

The official package remains the complete tracked Deliverables/ tree produced by the existing Maven Assembly configuration.

Replace the rejected implementation

Create only these three files:

* Deliverables/deploy/clue_operational_wrapper.sh
* Deliverables/docs/CLUE_OPERATIONAL_DEPLOYMENT.md
* Deliverables/tests/clue/test_operational_wrapper.py

Keep them small and focused. Do not create a generic release-management framework, JSON receipt system, activation model or rollback framework.

Required wrapper behaviour

The wrapper must provide an explicit deploy operation and an optional --dry-run.

Required inputs:

--environment dev
--npid <runtime-NPID>
--group <approved-application-owner-group>
--app-root /app/clue
--source-root <path-to-extracted-official-artifact>

The NPID and group must always come from arguments. Never use:

* the current Windows/Agent username;
* the user who built the package;
* a hard-coded NPID;
* a hard-coded owner group;
* unix_sudo_svc_clue as the filesystem owner unless it is explicitly supplied and validated as the approved application-owner group.

Actual deployment sequence

The non-dry-run deploy operation must:

1. Require effective UID 0. Fail clearly when not executed through root/sudo.
2. Resolve the supplied NPID with id.
3. Resolve the supplied group with getent group.
4. Verify that the NPID belongs to the supplied owner group.
5. Verify that --app-root resolves exactly to /app/clue; reject /, /app, traversal and symlink redirection.
6. Validate that --source-root is an extracted official artifact containing the required real Deliverables members.
7. Fail if any command it intends to invoke is absent. Never invent a filename.
8. Create /app/clue as root when it does not exist.
9. Refuse to overwrite a non-empty existing installation unless an explicit safe replacement option is supplied. Do not silently delete anything.
10. Copy the validated artifact content into /app/clue while preserving executable modes.
11. Apply the actual filesystem ownership:

chown -R "<NPID>:<approved-owner-group>" /app/clue

12. Verify the resulting owner and group.
13. Change execution identity from root to the supplied NPID using the host-supported form of sudo -u or runuser.
14. Prove the changed identity by checking id -un inside that child process.
15. Execute the applicable existing packaged prerequisite/run/probe scripts in their evidence-backed order, as the NPID—not as root.
16. Use the existing deploy/clue_with_runtime_secrets.sh only where the existing runtime contract requires it. Never print or persist secret values.
17. Return the real child exit code and clearly identify the failed step.

The wrapper must never:

* create users or groups;
* edit sudoers;
* use the Agent account as the runtime account;
* run pip against system Python;
* add files that are absent from the official artifact;
* modify lifecycle-data directories outside /app/clue;
* claim success if identity, ownership or an existing deployment command was not actually verified.

Dry run

deploy --dry-run must perform all non-mutating validation and print the exact commands that would:

* create /app/clue;
* copy the package;
* run chown;
* switch to the NPID;
* execute each existing packaged script.

It must not write, copy, extract, change ownership or execute application commands.

Operator document

CLUE_OPERATIONAL_DEPLOYMENT.md must begin with the real operator sequence—not an architectural discussion.

It must clearly show:

1. Obtain or manually build the artifact using the same existing Maven Assembly path as CI/CD.
2. Verify that its member paths and file content match the tracked Deliverables/ input.
3. Extract it to a staging directory.
4. Run the wrapper first with --dry-run.
5. Run the actual deployment as root, supplying the real NPID and approved owner group.
6. Show that the wrapper installs under /app/clue, changes ownership and continues as the NPID.
7. Run the documented status/probe command as the NPID.

Include one complete paste-ready example with placeholders only for the real NPID and approved group.

Focused tests only

Rewrite test_operational_wrapper.py as a small targeted suite covering:

* deployment refuses non-root execution;
* unknown NPID fails;
* unknown group fails;
* non-member NPID fails;
* unsafe application roots fail;
* dry-run performs no mutation;
* actual command plan contains chown;
* actual command plan changes identity to the supplied NPID;
* no Agent username is embedded;
* nonexistent bin/* deployment scripts are never referenced;
* missing real packaged scripts cause a clear failure.

Run only this focused test file and any direct shell syntax check available in the current environment. Do not run the full repository suite or Maven build.

Final report

Report:

* the exact existing scripts discovered;
* the resulting root-to-NPID command sequence;
* the exact ownership command;
* the exact identity-switch command;
* the three changed paths;
* focused-test results;
* confirmation that all protected POM/CI/CD files are untouched.

Stop without staging or committing.
