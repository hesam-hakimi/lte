Continue in the current C:\repos\clue-rc-20260926 worktree. Do not create another branch, worktree, or VS Code window.

Make one narrow correction to the current operational-wrapper implementation.

Required public interface

The wrapper must take exactly these two required operational inputs:

--release <Maven release version>
--npid <runtime Linux account>

Supported optional switches may remain:

--dry-run
--help

The intended command for the current DEV release is:

sudo -H -u tclue999devs -- \
  /app/clue/bin/clue_operational_wrapper.sh \
  --release 1.1.1-SNAPSHOT \
  --npid tclue999devs

Wrapper changes

Modify only:

Deliverables/deploy/clue_operational_wrapper.sh
Deliverables/docs/CLUE_OPERATIONAL_DEPLOYMENT.md
Deliverables/tests/clue/test_operational_wrapper.py

Do not modify, restore, stage or unstage any other file. In particular, do not touch:

pom.xml
assembly/pom.xml
assembly.xml
CI.yml
CD.yml
.gitignore
.gitattributes
.mvn/**
mvnw
mvnw.cmd
.github/**

Preserve the existing Git index and pending merge exactly as they are.

In clue_operational_wrapper.sh:

1. Remove the compiled-in value:

readonly NPID='tclue999devs'

2. Parse --release and --npid as required command-line arguments.
3. Accept the two options in either order.
4. Reject:

* a missing value;
* duplicate --release or --npid options;
* unknown options;
* an empty value;
* an unsafe release containing whitespace, /, \, shell metacharacters or URL syntax;
* an invalid Linux account name;
* --npid root.

5. Resolve and validate the supplied account:

getent passwd "$NPID"

6. Determine the actual executing account:

ACTUAL_USER="$(id -un)"
ACTUAL_UID="$(id -u)"

Fail closed unless:

[[ "$ACTUAL_UID" -ne 0 ]]
[[ "$ACTUAL_USER" == "$NPID" ]]

The failure message must show both the expected NPID and actual user, without printing credentials.

7. Keep the approved owner-group validation. For the current DEV contract it remains:

readonly OWNER_GROUP='users'

Verify that the supplied NPID belongs to users.

8. Use the parsed release consistently for Nexus resolution, artifact naming, staging paths, receipts and validation.
9. Use the parsed NPID consistently for identity and ownership checks.
10. The wrapper must never use sudo, su, runuser, chown or otherwise change identity. Orchestration launches the wrapper as the supplied NPID; the wrapper only verifies that contract.
11. Keep all unrelated operational constants and existing fail-closed checks unchanged.

Documentation

Update the operational document so that it clearly states:

* Orchestrator supplies the release and NPID.
* Root only prepares /app/clue.
* Orchestrator then launches the wrapper as that NPID.
* The wrapper does not switch users.
* A mismatch between --npid and id -un is fatal.
* NPID ownership and sudo authorization are separate controls.

Include this exact current DEV example:

sudo -H -u tclue999devs -- \
  /app/clue/bin/clue_operational_wrapper.sh \
  --release 1.1.1-SNAPSHOT \
  --npid tclue999devs

Also include this explicit two-variable orchestration form:

CLUE_RELEASE='1.1.1-SNAPSHOT'
CLUE_NPID='tclue999devs'
sudo -H -u "$CLUE_NPID" -- \
  /app/clue/bin/clue_operational_wrapper.sh \
  --release "$CLUE_RELEASE" \
  --npid "$CLUE_NPID"

Focused tests

Update the existing focused test file to cover at least:

* --help documents both required parameters;
* missing --release fails;
* missing --npid fails;
* duplicate options fail;
* unsafe release values fail;
* invalid NPID values fail;
* root NPID is refused;
* actual-user/NPID mismatch fails;
* the wrapper contains no identity-switching command;
* the documented example agrees with the real --help interface.

Run only the focused wrapper tests. Do not run the full repository test suite.

After the focused tests pass, make the fast official Maven Assembly package without cleaning:

cd C:\repos\clue-rc-20260926
.\mvnw.cmd -B -DskipTests package

Verify that this artifact exists:

C:\repos\clue-rc-20260926\assembly\target\clue-code-1.1.1-SNAPSHOT.tar.gz

Confirm that the archive contains:

deploy/clue_operational_wrapper.sh
docs/CLUE_OPERATIONAL_DEPLOYMENT.md
tests/clue/test_operational_wrapper.py

Confirm that the archive is rootless—there must be no leading Deliverables/ directory—and confirm the packaged wrapper has Unix mode 0755.

Report:

1. the exact three-file diff made by this task;
2. focused-test results;
3. Maven BUILD SUCCESS or the exact failure;
4. artifact path, byte size and SHA-256;
5. the exact final example command.

Do not stage, commit, push, upload to Nexus, open a PR or trigger CI.
