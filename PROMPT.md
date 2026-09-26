Work only in the current C:\repos\clue-rc-20260926 worktree.

Rewrite only these three untracked files:

Deliverables/deploy/clue_operational_wrapper.sh
Deliverables/docs/CLUE_OPERATIONAL_DEPLOYMENT.md
Deliverables/tests/clue/test_operational_wrapper.py

Do not modify any existing POM, Maven, Assembly, CI/CD, application or deployment-script file.

1. Fixed operational values

Hardcode these values in both the wrapper and Operational Playbook:

DEV_HOST=crcluesbdzwnk0.dev.vmc2.td.com
ENVIRONMENT=dev
NPID=tclue999devs
OWNER_GROUP=users
APP_ROOT=/app/clue
WRAPPER_PATH=/app/clue/bin/clue_operational_wrapper.sh
BOOTSTRAP_WRAPPER=/tmp/clue_operational_wrapper.sh
PYTHON=python3.12
NEXUS_HOST=https://rp.td.com
NEXUS_REPOSITORY=td-maven-snapshots
MAVEN_GROUP_ID=com.td.clue
MAVEN_ARTIFACT_ID=clue-code
MAVEN_EXTENSION=tar.gz

Explicitly prohibit using unix_sudo_svc_clue as the filesystem-owner group.

The public wrapper interface must accept only:

clue_operational_wrapper.sh --release VERSION
clue_operational_wrapper.sh --release VERSION --dry-run
clue_operational_wrapper.sh --help

Do not expose options for NPID, group, host, environment, root, Nexus repository, Maven coordinates or Python. Those values are fixed.

2. Write the Operational Playbook exactly in this format

Rewrite:

Deliverables/docs/CLUE_OPERATIONAL_DEPLOYMENT.md

Keep it short. Do not add architecture history, decision registers, release-manager alternatives or long background explanations.

The document must contain only the following sections.

Prerequisites

List exactly:

1. Connect to crcluesbdzwnk0.dev.vmc2.td.com.
2. The operator must have sudo access.
3. tclue999devs and group users must already exist.
4. tclue999devs must be a member of users.
5. sudo, getent, install, curl, sha256sum, tar, gzip, file and python3.12 must be installed.
6. The approved wrapper must be copied to:
   /tmp/clue_operational_wrapper.sh
7. The requested release must already be published in:
   https://rp.td.com/repository/td-maven-snapshots

A1 — Become Root

Document exactly:

sudo -i

State that the operator may be prompted for their sudo password.

A2 — Validate the fixed DEV identity

Document exactly:

set -Eeuo pipefail
umask 027
test "$(hostname -f)" = "crcluesbdzwnk0.dev.vmc2.td.com"
test "$(id -u)" -eq 0
getent passwd tclue999devs
getent group users
id tclue999devs
id -nG tclue999devs \
  | tr ' ' '\n' \
  | grep -Fx users
test -f /tmp/clue_operational_wrapper.sh
test ! -L /tmp/clue_operational_wrapper.sh
bash -n /tmp/clue_operational_wrapper.sh

Any failure must stop the procedure.

A3 — Prepare /app/clue and install the wrapper

Document exactly:

if [[ -L /app ]] || [[ -e /app && ! -d /app ]]; then
  echo "STOP: /app is not a normal directory"
  exit 3
fi
if [[ ! -d /app ]]; then
  install -d -o root -g root -m 0755 /app
fi
if [[ -L /app/clue ]] || [[ -e /app/clue && ! -d /app/clue ]]; then
  echo "STOP: /app/clue is not a normal directory"
  exit 3
fi
install -d \
  -o tclue999devs \
  -g users \
  -m 2750 \
  /app/clue
install -d \
  -o tclue999devs \
  -g users \
  -m 2750 \
  /app/clue/bin
install \
  -o tclue999devs \
  -g users \
  -m 0750 \
  /tmp/clue_operational_wrapper.sh \
  /app/clue/bin/clue_operational_wrapper.sh
stat -c '%F %U:%G %a %n' \
  /app/clue \
  /app/clue/bin \
  /app/clue/bin/clue_operational_wrapper.sh
sudo -u tclue999devs -- \
  test -r /app/clue/bin/clue_operational_wrapper.sh
sudo -u tclue999devs -- \
  test -x /app/clue/bin/clue_operational_wrapper.sh

Root must not download, verify, extract or execute the CLUE application.

A4 — Leave the Root shell

Document exactly:

exit

B1 — Execute the wrapper as the NPID

For release 1.1.1-SNAPSHOT, document exactly:

sudo -u tclue999devs -- \
  /app/clue/bin/clue_operational_wrapper.sh \
  --release 1.1.1-SNAPSHOT

The operator may be prompted for their sudo password.

Also provide this reusable form:

read -r -p 'CLUE release version: ' CLUE_RELEASE
sudo -u tclue999devs -- \
  /app/clue/bin/clue_operational_wrapper.sh \
  --release "$CLUE_RELEASE"

State that this is the only release value entered by the operator.

3. Implement the NPID wrapper

Rewrite:

Deliverables/deploy/clue_operational_wrapper.sh

The wrapper must immediately enforce:

test "$(id -u)" -ne 0
test "$(id -un)" = "tclue999devs"

It must also verify:

id -nG tclue999devs \
  | tr ' ' '\n' \
  | grep -Fx users
test -d /app/clue
test ! -L /app/clue
test -r /app/clue
test -w /app/clue
test -x /app/clue

The wrapper must reject every option except:

--release
--dry-run
--help

Validate the release with a strict format supporting values such as:

1.1.1-SNAPSHOT
1.1.1

4. Nexus resolution performed automatically by the wrapper

The wrapper must use the supplied release to query the Nexus REST search API with these fixed coordinates:

Host:       https://rp.td.com
Repository: td-maven-snapshots
Group ID:   com.td.clue
Artifact ID: clue-code
Extension:  tar.gz
Version:    value supplied by --release

The operator must not supply an artifact URL or checksum.

The wrapper must:

1. query Nexus for assets matching the fixed coordinates and requested release;
2. select the exact .tar.gz asset;
3. for a Snapshot with multiple builds, select the newest asset by Nexus metadata;
4. read the exact asset download URL;
5. read its Nexus-provided SHA-256 checksum;
6. fail if Nexus returns no asset, more than one equally current asset, or no SHA-256;
7. never use the Nexus web-root URL as the artifact;
8. never use curl -k;
9. never put credentials in the URL or command line;
10. download first to a .part file.

If the Nexus REST response does not provide SHA-256, exit nonzero with:

STOP: Nexus did not provide an independent SHA-256

Do not weaken this check by trusting a checksum calculated only after download.

5. Wrapper execution sequence

After resolving the exact asset, the wrapper must perform these operations automatically as tclue999devs:

1. Create a fresh staging directory under /app/clue.
2. Download the exact Nexus asset into a .part file.
3. Require curl success and HTTP 200.
4. Compare the downloaded bytes with Nexus SHA-256.
5. Atomically rename the .part file after the checksum passes.
6. Verify file type and gzip integrity.
7. Inspect every tar member before extraction.
8. Extract the rootless archive into a fresh empty directory.
9. Verify owner tclue999devs and group users.
10. Reject world-writable content.
11. Run bash -n on every deploy/*.sh file.
12. Validate the Python import with python3.12.
13. Determine the real packaged execution chain.
14. Run only the execution chain proven by the packaged scripts.

Archive validation must reject traversal, absolute paths, duplicate normalized names, backslashes, symlinks, hardlinks, devices, FIFO, sockets, setuid/setgid, world-writable members, credentials and caches.

Require these exact members:

pyproject.toml
requirements.txt
config/environments/dev.yaml
src/clue/__init__.py
deploy/clue_dev_prereq.sh
deploy/clue_dev_probe.sh
deploy/clue_dev_integration.sh
deploy/clue_dev_run.sh
deploy/clue_with_runtime_secrets.sh
deploy/clue_operational_wrapper.sh
docs/CLUE_OPERATIONAL_DEPLOYMENT.md

If any exact required member is not present in the tracked Deliverables tree, stop before changing the requirement and report the actual filename.

6. Determine the exact packaged execution command

Before finalizing the wrapper, inspect these five scripts directly:

Deliverables/deploy/clue_dev_prereq.sh
Deliverables/deploy/clue_dev_probe.sh
Deliverables/deploy/clue_dev_integration.sh
Deliverables/deploy/clue_dev_run.sh
Deliverables/deploy/clue_with_runtime_secrets.sh

Run:

bash -n Deliverables/deploy/clue_dev_prereq.sh
bash -n Deliverables/deploy/clue_dev_probe.sh
bash -n Deliverables/deploy/clue_dev_integration.sh
bash -n Deliverables/deploy/clue_dev_run.sh
bash -n Deliverables/deploy/clue_with_runtime_secrets.sh

Read their argument parsing, help text and call graph.

Record one exact execution chain in the Operational Playbook and wrapper tests.

Do not invent options.

Do not edit these five existing scripts.

If clue_dev_run.sh still assumes that the archive contains one enclosing top-level directory, do not execute it. Stop after extraction and print:

ARTIFACT_VALIDATED_BUT_PACKAGED_RUNNER_IS_INCOMPATIBLE_WITH_ROOTLESS_ARCHIVE

If the tracked scripts prove a compatible command, execute that exact command as tclue999devs, using clue_with_runtime_secrets.sh as the runtime-secret boundary.

7. Dry run

This command:

sudo -u tclue999devs -- \
  /app/clue/bin/clue_operational_wrapper.sh \
  --release 1.1.1-SNAPSHOT \
  --dry-run

must:

* validate the user, group, path, release and tools;
* show the Nexus request and planned operations;
* redact credentials;
* create nothing;
* download nothing;
* extract nothing;
* run no application script.

8. Focused tests only

Rewrite:

Deliverables/tests/clue/test_operational_wrapper.py

Test:

1. Only --release, --dry-run and --help are accepted.
2. Root is rejected.
3. Any user other than tclue999devs is rejected.
4. Any owner group other than users is rejected internally.
5. /app/clue is the only accepted application root.
6. Nexus coordinates are fixed.
7. Exact asset and Nexus SHA-256 are required.
8. Wrong checksum stops before extraction.
9. Unsafe archive members are rejected.
10. Rootless archive is supported.
11. Dry run performs no mutation.
12. Existing packaged scripts are called only through the proven call chain.
13. An incompatible clue_dev_run.sh causes the explicit stop marker.
14. No activation or success is reported after a failed gate.

Run only:

bash -n Deliverables/deploy/clue_operational_wrapper.sh
python -m pytest -q Deliverables/tests/clue/test_operational_wrapper.py
bash Deliverables/deploy/clue_operational_wrapper.sh --help

Do not run Maven yet. Do not run the full test suite.

9. Stop and report

Report:

1. The exact final A1–A4 commands.
2. The exact B1 command.
3. The wrapper’s complete --help output.
4. The exact packaged script execution chain found.
5. Whether clue_dev_run.sh is compatible with the rootless archive.
6. Focused-test result.
7. The exact three files changed.

Do not stage, commit, push, publish, access Nexus or access the DEV server. Stop after the report.
