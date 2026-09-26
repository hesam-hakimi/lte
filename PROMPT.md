
Authoritative deployment flow

The complete deployment implementation, documentation and wrapper must be included inside the Maven-produced CLUE package.

There is no separately transferred bootstrap wrapper.

The flow is:

1. CI builds the complete CLUE tar.gz from Deliverables/.
2. CI publishes that package to Nexus.
3. On the DEV server, Root downloads the package from Nexus into /tmp.
4. Root performs all existing integrity and archive-safety checks.
5. Root safely extracts the rootless package into /app/clue.
6. Root assigns the extracted installation to the supplied NPID and approved group.
7. Root exits.
8. The packaged wrapper is executed as the NPID from:

/app/clue/deploy/clue_operational_wrapper.sh

The archive itself remains in /tmp; the extracted application files go into /app/clue.

Remove the incorrect design

Remove all active documentation, code and tests that assume any of the following:

/tmp/clue_operational_wrapper.sh
/app/clue/bin/clue_operational_wrapper.sh
a separately copied bootstrap wrapper
a wrapper that downloads or extracts its own containing archive
manual use of /opt/clue

Do not restore any previously reverted implementation.

Allowed files

Create or update only:

Deliverables/deploy/clue_operational_wrapper.sh
Deliverables/docs/CLUE_OPERATIONAL_DEPLOYMENT.md
Deliverables/tests/clue/test_operational_wrapper.py

Everything must remain under Deliverables/ so the existing Maven Assembly packages it automatically.

Do not modify:

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

Do not alter the existing Maven/POM/Assembly structure. Do not stage, unstage, commit, push, upload to Nexus or open a PR.

Fixed DEV contract

Host: crcluesbdzwnk0.dev.vmc2.td.com
Example NPID: tclue999devs
Owner group: users
Application root: /app/clue
Archive staging root: /tmp
Packaged wrapper source: Deliverables/deploy/clue_operational_wrapper.sh
Installed wrapper: /app/clue/deploy/clue_operational_wrapper.sh
Nexus host: https://rp.td.com
Nexus repository: td-maven-snapshots
Maven group: com.td.clue
Artifact ID: clue-code
Extension: tar.gz
Release example: 1.1.1-SNAPSHOT

The two operator-selected values are:

RELEASE
NPID

The exact Nexus asset URL and trusted SHA-256 must come from Nexus/CI evidence for that release. They must never be guessed or derived from the downloaded archive itself.

Rewrite the runbook in this order

Phase 0 — Producer prerequisite

Document that CI must:

1. use the repository’s existing Maven Assembly producer;
2. include all tracked Deliverables/ content;
3. produce clue-code-<release>.tar.gz;
4. preserve deploy/*.sh as executable;
5. verify package contents;
6. publish the exact bytes to Nexus;
7. publish or record an independently trusted SHA-256.

Deployment must stop if no Nexus asset and trusted SHA-256 exist.

This section documents the producer contract only. Do not modify CI or Maven files.

Phase 1 — Become Root and validate the target

The runbook must start server-side preparation with:

sudo -i
set -Eeuo pipefail
umask 027

Define:

RELEASE='1.1.1-SNAPSHOT'
NPID='tclue999devs'
OWNER_GROUP='users'
APP_ROOT='/app/clue'
ARCHIVE="/tmp/clue-code-${RELEASE}.tar.gz"

Then verify:

* the exact DEV hostname;
* effective UID is 0;
* NPID exists;
* group users exists;
* NPID belongs to users;
* /app is a normal directory and not a symlink;
* /app/clue is a normal directory and not a symlink;
* an existing /app/clue installation is not silently overwritten.

Phase 2 — Download the archive from Nexus into /tmp

Root downloads the exact Nexus asset to:

/tmp/clue-code-<release>.tar.gz.part

Requirements:

* HTTPS only;
* TLS verification enabled;
* no curl -k;
* no credentials embedded in the URL or printed in logs;
* redirects handled safely;
* HTTP failure is fatal;
* rename .part to the final archive name only after a complete successful download;
* reject HTML or other non-archive responses.

The final archive location is:

/tmp/clue-code-<release>.tar.gz

Do not download it into /app/clue, /app/clue/bin, /app/clue/deploy or /opt/clue.

Phase 3 — Integrity and archive validation

Before extraction, Root must:

1. compare the downloaded bytes with the independently trusted SHA-256;
2. run gzip -t;
3. inspect every archive member;
4. reject absolute paths and .. traversal;
5. reject backslash paths;
6. reject symlinks, hardlinks, devices, FIFOs and sockets;
7. reject setuid, setgid and world-writable members;
8. reject credentials, keys, .env, caches and build-output directories;
9. verify the archive is rootless;
10. verify required members exist, including:

deploy/clue_operational_wrapper.sh
deploy/clue_with_runtime_secrets.sh
pyproject.toml
requirements.txt
src/clue/__init__.py
environments/dev.yaml

11. verify required deployment scripts are packaged with executable mode 0755.

Any failure must stop before /app/clue is modified.

Phase 4 — Extract into /app/clue

Root prepares /app/clue as:

owner: <NPID>
group: users
mode: 2750

The package is rootless, so extract its contents directly from the archive in /tmp into:

/app/clue

After extraction:

* recursively assign ownership to <NPID>:users;
* preserve required executable modes;
* reject unexpected owners or groups;
* reject world-writable content;
* verify all required package members;
* run bash -n against packaged shell scripts;
* verify /app/clue/deploy/clue_operational_wrapper.sh exists and is executable.

Do not create or use /app/clue/bin.

Phase 5 — Leave Root

The runbook must explicitly execute:

exit

No application process may be started while Root is active.

Phase 6 — Execute the packaged wrapper as NPID

Use the current DEV example:

sudo -H -u tclue999devs -- \
  /app/clue/deploy/clue_operational_wrapper.sh \
  --release 1.1.1-SNAPSHOT \
  --npid tclue999devs

Also include the parameterized form:

RELEASE='1.1.1-SNAPSHOT'
NPID='tclue999devs'
sudo -H -u "$NPID" -- \
  /app/clue/deploy/clue_operational_wrapper.sh \
  --release "$RELEASE" \
  --npid "$NPID"

Packaged wrapper responsibilities

Implement a small post-extraction wrapper at:

Deliverables/deploy/clue_operational_wrapper.sh

It must:

* require --release and --npid;
* support --help;
* optionally support --dry-run;
* reject Root execution;
* verify id -un exactly equals the supplied NPID;
* validate safe argument syntax;
* verify /app/clue is a normal directory;
* verify the installed package layout;
* verify required packaged scripts are present and executable;
* use the existing packaged runtime-secrets boundary;
* execute only the application call chain proven by the existing scripts and repository evidence;
* fail closed if the supported entry point cannot be proven;
* never use sudo, su, runuser, chown, curl, tar or Nexus APIs;
* never download, verify or extract the archive;
* never create a second release-management implementation.

Before implementing the execution chain, inspect these existing scripts:

Deliverables/deploy/clue_dev_prereq.sh
Deliverables/deploy/clue_dev_probe.sh
Deliverables/deploy/clue_dev_integration.sh
Deliverables/deploy/clue_dev_run.sh
Deliverables/deploy/clue_with_runtime_secrets.sh

Do not invent arguments or commands. If the existing supported execution chain cannot be proven, implement all safe validation behavior but stop with a precise unresolved-contract error before application execution.

Tests

Create or update focused tests covering:

* wrapper is located under Deliverables/deploy;
* documentation invokes it from /app/clue/deploy;
* no bootstrap-wrapper path exists;
* no /app/clue/bin assumption exists;
* no active /opt/clue command exists;
* Root performs download, validation and extraction;
* wrapper refuses Root;
* wrapper requires --release and --npid;
* wrapper rejects an actual-user/NPID mismatch;
* wrapper contains no download or extraction implementation;
* archive checks occur before extraction;
* wrapper execution occurs only after Root exits;
* documentation and wrapper --help agree.

Run only focused non-destructive tests. Do not run a full test suite.

This workstation currently lacks JDK 21. Do not install a JDK, change JAVA_HOME or claim that a new Maven artifact was built. Statically confirm that the existing Assembly configuration includes Deliverables/ and gives deploy/*.sh executable mode, without modifying that configuration.

Final report

Report:

1. exact files created or changed;
2. exact final deployment sequence;
3. focused-test results;
4. whether the existing packaged script call chain was proven;
5. static evidence that the wrapper will be included by Maven Assembly;
6. limitations caused by the missing local JDK;
7. unresolved external Nexus/Salt evidence, if any.

Finish with exactly one status:

PACKAGED_OPERATIONAL_FLOW_IMPLEMENTED

or:

PACKAGED_OPERATIONAL_FLOW_BLOCKED: <exact reason>
