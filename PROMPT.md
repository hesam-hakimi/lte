Continue in the current C:\repos\clue-rc-20260926 worktree and correct the existing operational runbook. Perform the edits; do not merely propose them.

Scope

Primary file:

Deliverables/docs/CLUE_OPERATIONAL_DEPLOYMENT.md

You may modify these supporting files only if required to keep the documented command identical to the real wrapper interface:

Deliverables/deploy/clue_operational_wrapper.sh
Deliverables/tests/clue/test_operational_wrapper.py

Do not modify, restore, stage or unstage any POM, Maven Assembly, CI/CD, Git configuration or workflow file. Do not commit, push, upload, open a PR, run deployment commands or change the DEV server.

Defect to correct

The current runbook checks for:

/tmp/clue_operational_wrapper.sh

without first explaining how that bootstrap wrapper reaches /tmp.

Do not solve this by extracting the complete application archive before A3. That would duplicate the wrapper’s responsibility and break the Root/NPID boundary.

The correct lifecycle is:

1. The operator or Orchestrator stages only the reviewed bootstrap wrapper in /tmp.
2. Root validates the host, identity, group and wrapper.
3. Root prepares /app/clue and installs the bootstrap wrapper.
4. Root exits.
5. The wrapper runs as the supplied NPID.
6. The wrapper resolves the requested release from Nexus, downloads it, verifies SHA-256, inspects it, extracts it and continues the validated application sequence.

Fixed DEV contract

Use these current DEV values:

Host: crcluesbdzwnk0.dev.vmc2.td.com
Operator account: tag5916
Runtime NPID example: tclue999devs
Owner group: users
Application root: /app/clue
Installed wrapper: /app/clue/bin/clue_operational_wrapper.sh
Bootstrap wrapper: /tmp/clue_operational_wrapper.sh
Nexus host: https://rp.td.com
Repository: td-maven-snapshots
Maven group: com.td.clue
Artifact: clue-code
Extension: tar.gz
Release example: 1.1.1-SNAPSHOT

The only variable operational inputs are:

--release
--npid

The wrapper must verify that id -un exactly equals the supplied --npid. It must never switch identity internally.

Required runbook structure

Rewrite the preparation and execution sequence in this exact order.

A0 — Stage the bootstrap wrapper

Add a Windows PowerShell section that transfers only:

Deliverables/deploy/clue_operational_wrapper.sh

to:

/tmp/clue_operational_wrapper.sh

Use scp with tag5916 and the fixed DEV hostname.

The instructions must:

* calculate the local SHA-256;
* transfer the wrapper;
* calculate the remote SHA-256;
* require the hashes to match;
* confirm it is a regular file and not a symlink;
* run bash -n remotely;
* stop on any mismatch.

State explicitly that A0 uses the wrapper from the exact release-candidate source being tested.

A1 — Become Root

Keep:

sudo -i

Immediately prove Root with:

test "$(id -u)" -eq 0

The runbook must tell the operator not to continue unless the prompt and id -u confirm Root.

A2 — Validate DEV identity and bootstrap input

Validate:

* exact hostname;
* Root identity;
* tclue999devs exists;
* group users exists;
* tclue999devs belongs to users;
* /tmp/clue_operational_wrapper.sh exists;
* it is a regular file;
* it is not a symbolic link;
* it passes bash -n.

Any failure must stop the procedure.

A3 — Prepare /app/clue and install the wrapper

Root may perform only these mutations:

* create /app as root:root mode 0755 when absent;
* refuse /app or /app/clue if either is an unsafe symlink or non-directory;
* prepare /app/clue as tclue999devs:users mode 2750;
* prepare /app/clue/bin as tclue999devs:users mode 2750;
* install the bootstrap wrapper as:

/app/clue/bin/clue_operational_wrapper.sh

with owner tclue999devs, group users and mode 0750.

If /app/clue already exists, inspect it first. Do not delete or overwrite existing application content. Stop if unexpected content is present.

Verify ownership, group and modes after installation.

Root must not download, verify, extract or execute the CLUE application archive.

A4 — Leave Root

Add an explicit:

exit

Then confirm the interactive operator is no longer Root.

B1 — Execute the wrapper as the runtime NPID

Use this exact current example:

sudo -H -u tclue999devs -- \
  /app/clue/bin/clue_operational_wrapper.sh \
  --release 1.1.1-SNAPSHOT \
  --npid tclue999devs

Also provide the parameterized Orchestrator form:

CLUE_RELEASE='1.1.1-SNAPSHOT'
CLUE_NPID='tclue999devs'
sudo -H -u "$CLUE_NPID" -- \
  /app/clue/bin/clue_operational_wrapper.sh \
  --release "$CLUE_RELEASE" \
  --npid "$CLUE_NPID"

State clearly that the wrapper, while running as the NPID, owns the following sequence:

1. resolve the exact Nexus asset for the requested release;
2. obtain an independently trusted SHA-256;
3. download into a fresh staging directory under /app/clue;
4. verify the digest before reading archive contents;
5. inspect every archive member;
6. reject unsafe paths, links, devices, credentials and prohibited content;
7. validate the rootless Maven Assembly layout;
8. extract under /app/clue;
9. validate ownership, group, modes and required files;
10. continue only through the execution chain proven by the packaged scripts.

Do not document any unimplemented wrapper option.

Legacy/manual artifact warning

Add a concise warning:

* /opt/clue is a superseded rehearsal location.
* The manually copied /opt/clue/clue-code-1.1.1-SNAPSHOT.tar.gz is outside this deployment flow.
* It must not be moved, extracted, renamed or treated as release evidence.
* The known local archive was created before the current wrapper/runbook changes because Maven could not rebuild without JDK 21.
* The production flow must obtain the artifact through Nexus.
* Do not delete existing /opt/clue content as part of this runbook.

Documentation consistency

Inspect the real wrapper usage/help text. The document and wrapper must agree exactly on:

--release <version>
--npid <runtime-account>
--dry-run
--help

If the required --release and --npid interface is not yet implemented, make only the minimum supporting wrapper and focused-test changes required to implement it. Do not expand deployment scope.

Verification

Run only focused, non-destructive checks:

* Markdown command review;
* wrapper bash -n if Bash is available;
* the focused operational-wrapper test;
* a search confirming the active instructions never use /opt/clue;
* a search confirming no manual full-archive extraction occurs before A3;
* a check that every /tmp/clue_operational_wrapper.sh reference is preceded by A0.

Do not run Maven packaging because this workstation currently has no JDK 21. Do not install a JDK or change JAVA_HOME.

Final report

Report:

1. exact files changed;
2. exact runbook sections added or corrected;
3. focused verification results;
4. whether wrapper help and runbook now agree;
5. any remaining external dependency, without claiming it was verified.

Finish with exactly one status:

RUNBOOK_BOOTSTRAP_FLOW_CORRECTED

or:

RUNBOOK_CORRECTION_BLOCKED: <exact reason>
