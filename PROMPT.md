Continue from the immediately preceding instruction in Agent mode.

Execute only the authorized local steps. Do not merely restate the plan.

First, prove the provenance and current diffs of the two existing changed files shown in the UI:

* CLUE_Implementation_Journal_2026-09-26.md
* inspect_archive.py

Do not accept, discard, overwrite, or stage either file until you identify:

* whether each change predates this run;
* its exact diff;
* whether it belongs to the candidate;
* whether retaining it would violate the protected-file or authorized-change boundary.

Then rerun the live Git, merge-state, staged/unstaged/untracked, and protected-file gates.

If and only if every gate passes, apply the authorized candidate realignment from 1.1.0-SNAPSHOT to 1.1.1-SNAPSHOT only where technically required:

* the authoritative version in root pom.xml;
* exact parent/reactor version references in assembly/pom.xml that must match it;
* both the logical version directory and artifact filename in the active DEV batch_url in CD.yml.

Preserve:

* the active /app/clue basename;
* CI.yml byte-for-byte;
* the configured CI and CD endpoint hosts;
* groupId, artifactId, packaging, repositories, plugins, credentials, owner settings, and unrelated configuration;
* commented historical blocks without rewriting their old versions;
* all existing Git history.

Do not add a version to CI.yml and do not hardcode a timestamped Nexus Snapshot filename.

After the exact semantic diff is proven:

1. Run the targeted layout, version, CD-contract, and affected-module tests.
2. Run the complete applicable test suite.
3. Run the official clean Maven Assembly build.
4. Require the artifact clue-code-1.1.1-SNAPSHOT.tar.gz.
5. Record its exact byte count and SHA-256.
6. Repeat all archive-member, path-safety, permission, secret, cache, generated-output, tracked-input, and extracted-content checks.
7. Confirm all five packaged deploy shell scripts remain mode 0755 and pass shell syntax validation.
8. Confirm testing and building did not add prohibited staged files.
9. Update CLUE_Implementation_Journal_2026-09-26.md with sanitized commands, exit codes, diffs, test counts, artifact identity, and unresolved external evidence.

Stop after the local report.

Do not commit, push, create or update a PR, trigger CI/XLR, publish to Nexus, access a server, deploy, promote, or change an endpoint.

End with exactly one of:

LOCAL_1_1_1_CANDIDATE_VERIFIED

or

LOCAL_1_1_1_CANDIDATE_BLOCKED
