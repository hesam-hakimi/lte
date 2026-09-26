CLUE — apply the authorized 1.1.1-SNAPSHOT candidate realignment and rerun local gates

Continue the active CLUE engineering work. This is not a project restart.

All responses, implementation notes, code comments, test summaries, and
documentation in the development environment must be in English. Do not use
personal names unless an identity is technically required.

Read these documents completely, in this order, before taking repository
action:

1. CLUE_Implementation_Reference_2026-09-26.md, R3
2. CLUE_Implementation_Phases_and_Acceptance_2026-09-26.md, R3
3. CLUE_Implementation_Journal_2026-09-26.md, R4
4. CLUE_Deployment_Package_Truth_and_Stepwise_Validation_2026-09-25.md,
   R7 controlling checkpoint only; older sections are historical evidence

Current source checkpoint

- Isolated worktree: clue-rc-20260926
- Candidate branch: release-candidate/clue-app-clue-20260926
- The merge was last reported uncommitted.
- The earlier local artifact was
  clue-code-1.1.0-SNAPSHOT.tar.gz, 676,308 bytes, SHA-256
  8873CF22535AF5E5B620CF9A9E05492D1ED89B972B15FD8494E8C00849CD2BC3.
- That artifact remains valid only for its recorded pre-realignment source
  state. Do not rename or reuse it as 1.1.1-SNAPSHOT evidence.

Superseding owner decision

The uncommitted candidate must use 1.1.1-SNAPSHOT. This is an intentional
candidate-identity decision that separates the new build from the existing
1.1.0-SNAPSHOT Nexus lineage. Do not state that Nexus technically requires a
logical version bump for each Snapshot build.

Authorization boundary for this run

Authorized:

- read-only live Git and repository checks;
- local uncommitted version alignment described below;
- the already authorized active CD basename /app/clue;
- local tests, official Maven build, archive validation, and documentation.

Not authorized:

- commit or push;
- PR creation, update, or merge;
- CI/XLR execution or Nexus publication;
- server access, deployment, or promotion;
- any endpoint-host change;
- any CI.yml edit, including deployableArtifact.type;
- credentials, repository, owner, environment, packaging-plugin, or unrelated
  configuration changes.

Step 1 — re-establish live state before editing

1. Confirm the exact repository, sanitized remote, worktree, branch, HEAD,
   origin/main, merge state, and upstream state.
2. Fetch without merging or pruning, then confirm whether remote movement
   invalidates the recorded integration.
3. Run git status and report staged, unstaged, and untracked paths.
4. Identify the two pending-file changes previously visible in the UI, if they
   still exist. Do not keep, discard, or overwrite them without identifying
   their exact paths and relation to the candidate.
5. Before the version edit, prove CI.yml, pom.xml, assembly/pom.xml,
   assembly.xml, and .gitignore match current origin/main byte-for-byte.
   Prove CD.yml differs from origin/main only by the active /opt/clue to
   /app/clue basename change.
6. Confirm no generated, cache, credential, secret, key, .env, target/,
   archive, or package-output path is staged.

If these gates fail, stop without changing repository state and report the
exact failure.

Step 2 — apply only the authorized version alignment

1. Inspect all active and historical occurrences of 1.1.0-SNAPSHOT,
   1.1.1-SNAPSHOT, and 0.2.0-test-f676277 before editing.
2. Change the authoritative Maven version in the root pom.xml from
   1.1.0-SNAPSHOT to 1.1.1-SNAPSHOT.
3. Inspect assembly/pom.xml and the effective Maven reactor. Change only an
   exact parent/reactor version reference that must match the root version.
   Do not change packaging, plugins, repositories, groupId, artifactId, or any
   unrelated POM content.
4. In the active CD.yml batch_url, change both the logical version directory
   and artifact filename from 1.1.0-SNAPSHOT to 1.1.1-SNAPSHOT.
5. Retain the active basename /app/clue.
6. Retain the configured CD host and repository exactly as they are. Do not
   replace repo.td.com with rp.td.com.
7. Do not add a version to CI.yml and do not hardcode a timestamped Nexus
   member.
8. Do not rewrite commented historical blocks merely to remove old versions.

Step 3 — prove the exact semantic diff

1. Show sanitized git status, staged/unstaged path lists, diffstat, and diffs
   for pom.xml, assembly/pom.xml, CD.yml, and CI.yml.
2. Prove CI.yml, assembly.xml, and .gitignore remain byte-identical to current
   origin/main.
3. Prove POM differences are limited to the required 1.1.1-SNAPSHOT version
   alignment.
4. Prove active CD.yml differences are limited to:
   - /opt/clue to /app/clue; and
   - 1.1.0-SNAPSHOT to 1.1.1-SNAPSHOT in the logical directory and filename.
5. Prove active effective coordinates are
   com.td.clue:clue-code:1.1.1-SNAPSHOT and that no rehearsal ID or timestamped
   Snapshot name entered the Maven/CI/CD contract.

Step 4 — rerun local qualification

1. Rerun the targeted layout, version, CD-contract, and affected-module tests.
2. Rerun the complete applicable test suite and record commands, exit codes,
   pass/skip/fail counts, and duration.
3. Use the repository Maven wrapper and official Assembly path to run a clean
   package build.
4. Require BUILD SUCCESS and the output
   clue-code-1.1.1-SNAPSHOT.tar.gz.
5. Record the new artifact path, exact byte count, and SHA-256.
6. Repeat all safe archive-member, path, type, permission, secret, cache,
   generated-output, tracked-input, and extracted-content smoke checks.
7. Confirm the five packaged deploy shell scripts retain mode 0755 and pass
   syntax checks.
8. Confirm tests and the build did not add prohibited staged files.

Step 5 — record, but do not change, the EDP artifact-type issue

1. Extract the literal current deployableArtifact.type from CI.yml.
2. Record the meeting evidence separately: the observed deployment remained
   pom, the expected application package was stated to be tar.gz, and the
   intended automated server deployment did not occur.
3. Do not infer the current correct value solely from the historical meeting.
4. If current CI.yml is pom, classify the publication/deployment contract as
   BLOCKED_EXTERNAL_EVIDENCE pending current EDP/XLR template or platform-team
   confirmation. Do not edit CI.yml in this run.

Step 6 — endpoint evidence rule

The supplied rp.td.com screenshot shows only:

  wget https://rp.td.com/ -O file.tar.gz
  HTTP 200
  Length: 8172 (8.0K) [text/html]

This is a web-root HTML response saved under a misleading filename. It is not
artifact-download evidence. Do not use it to change CD.yml.

Because 1.1.1-SNAPSHOT is not published yet, its exact candidate URL cannot be
proven before publication. If authorized Nexus read access already exists,
validate the configured resolver contract using an existing known logical
Snapshot path or Maven metadata on repo.td.com, with TLS verification enabled.
Record requested URL, final URL, redirects, HTTP status, content length/type,
and checksum metadata without displaying credentials. After a separately
authorized candidate publication, the exact 1.1.1-SNAPSHOT URL must be tested
again before claiming NEXUS_DOWNLOADABLE_BUILD_VERIFIED.

Documentation and stop condition

Update CLUE_Implementation_Journal_2026-09-26.md with every sanitized command,
exit code, literal value, changed path, test/build result, artifact size/hash,
and unresolved external item.

Stop after the local report. Do not commit, push, open or merge a PR, trigger
XLR, publish, access a server, or deploy.

End with exactly one of:

LOCAL_VERSION_REALIGNMENT_PASS

or

LOCAL_VERSION_REALIGNMENT_BLOCKED

PASS requires all live gates, tests, official build, archive checks, and exact
1.1.1-SNAPSHOT POM/CD alignment to pass. The EDP artifact-type and endpoint
questions may still block Phase 7 even when the local realignment passes.
