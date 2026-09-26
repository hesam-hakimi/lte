Proceed from the Phase 6 approval gate using staged authorization.

The objective is to obtain the official release-candidate artifact through the
existing EDP/XLR pipeline and Nexus. Do not deploy it yet.

Authorized actions:

1. Reconfirm and report:
   - current isolated worktree path;
   - current release-candidate branch;
   - exact `git status --short`;
   - the complete list of files that will be committed;
   - the exact diff for CD.yml.

2. Verify before committing:
   - the only intentional protected-contract difference from origin/main is:
       basename: "/app/clue"
   - CI.yml, all pom.xml files, assembly descriptors, GitHub workflow files,
     and other EDP contract files remain byte-for-byte identical to origin/main;
   - no target/, Maven-site output, evidence directory, temporary file,
     artifact, cache, credential, certificate, secret, or local environment
     file is staged.

3. Commit the pending merge on the release-candidate branch with this message:

   Merge origin/main EDP deployment contract; set java_batch install root to /app/clue

4. Push normally to the release-candidate branch.
   - Never force-push.
   - Do not push directly to main.

5. Open a Draft PR to main.
   Include:
   - the exact source and target branches;
   - the six-file net-change summary;
   - local test results;
   - artifact filename and size;
   - the full, untruncated local SHA-256;
   - CLUE-FLAKY-001;
   - the JRE 18 versus declared JDK 21 limitation;
   - the unresolved archive-root and DEV owner-group questions.

6. Run the existing official EDP/XLR CI exactly as configured.
   Do not change CI.yml, CD workflow logic, any pom.xml, assembly.xml,
   Maven version, parent POM, or workflow reference to make the run pass.

7. If CI fails:
   - capture the exact run ID, failed stage, command, and error;
   - do not retry repeatedly;
   - do not patch CI/CD/POM files;
   - stop and report.

8. If CI succeeds and the official pipeline publishes the artifact to Nexus:
   record:
   - CI/XLR run ID;
   - commit SHA;
   - Maven GAV;
   - immutable Nexus URL;
   - exact artifact filename;
   - exact byte size;
   - full SHA-256 obtained independently of the downloaded file;
   - Nexus repository name and publication timestamp.

9. If Nexus publication requires a separate manual upload or additional
   credentials, stop before publishing and report the required operation.
   Do not manually upload a locally built artifact.

10. Do not merge the PR, deploy to DEV, promote to PAT/PROD, change sudoers,
    create /app/clue, change ownership, or begin NPID validation in this phase.

End with exactly one marker:

PHASE_7_OFFICIAL_CI_AND_NEXUS_VERIFIED

or

PHASE_7_BLOCKED

Provide the complete text report, not screenshots alone.
