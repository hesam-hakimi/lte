Continue from the existing STOPPED report. Do not repeat the completed audit.

The objective is now explicitly to test the complete release process:

source commit -> CI build -> RC publication -> download -> DEV deployment

Decisions and authorization

1. Target repository:
   TD-Universe/fcrm_clue

2. PR base:
   Use the GitHub default branch returned by:

   gh repo view TD-Universe/fcrm_clue --json defaultBranchRef

   Do not guess the branch name. If GitHub cannot return it, stop and report the exact failure.

3. GitHub credential:
   I confirm that the exact variable named GH in the repository-local ignored .env file contains the GitHub token.

   You are authorized to read only that exact key and map it transiently in the current process to GH_TOKEN for gh CLI authentication.

   Requirements:
   - never print, echo, log, diff, or persist the value;
   - never put it in a Git URL or Git configuration;
   - never commit .env;
   - unset the process variable after GitHub operations;
   - do not read any other .env values.

4. Divergence:
   Integrate the upstream-only commit before creating the PR.
   Do not force-push.

5. Existing dirty worktree:
   Another session owns the currently staged deletion of
   .github/workflows/ci.yml
   and modifications to .gitignore, pyproject.toml, requirements.txt,
   CLUE_HANDOFF.md, and CLUE_SOLUTION_REVIEW.md.

   Do not alter, unstage, commit, restore, or overwrite any of those
   entries in the original worktree.

Isolation procedure

Create a separate Git worktree and a new release branch so the original
working tree and its index remain byte-for-byte unchanged.

Base the isolated worktree on the latest:

origin/feature/clue-durable-core

Then bring in the four local-ahead commits in chronological order using
cherry-pick. This is the selected divergence resolution.

If a cherry-pick conflicts:
- do not guess;
- show the conflicting files and both commit subjects;
- stop without aborting or discarding either side.

Transfer only the deployment files owned by this session from the
original worktree into the isolated worktree. Before copying, print the
path-only ownership list.

Do not copy the other session's files listed above. Preserve executable
modes, additions, deletions, and renames.

Release version

pom.xml is an authoritative version source and MUST be updated.

Inspect:
- root pom.xml;
- module/parent POMs;
- pyproject.toml and Python package metadata;
- deployment bundle generator;
- MANIFEST.json generation;
- CI/CD release variables;
- Nexus artifact naming.

Follow the repository’s existing RC/test-version convention. If no
convention exists, use:

0.2.0-rc.1

Update only the CLUE project version. Do not change dependency versions
or an external parent version accidentally.

Prove that these values agree:

- Maven effective project version;
- Python distribution version;
- application wheel version;
- deployment release ID;
- MANIFEST.json version;
- archive filename;
- Nexus version/path.

Use Maven’s effective value where applicable, for example:

mvn help:evaluate -Dexpression=project.version -q -DforceStdout

CI/CD release integration

Because the purpose is to test the full release process, inspect and
make the minimum necessary changes to the existing GitHub CI/CD
workflows.

The pipeline must:

- build from a committed, clean checkout;
- reject a dirty source state;
- run deployment and runtime-wrapper tests;
- run shell syntax and archive-safety checks;
- build the application wheel;
- include the complete offline wheelhouse;
- build the deployment archive;
- generate the SHA-256 sidecar and MANIFEST.json;
- include both deployment documents;
- publish an RC only to the existing approved DEV/test Nexus location;
- record the Git commit SHA and Maven/project version;
- retain the published artifacts as CI run artifacts where supported.

Do not delete or replace the existing CI workflow merely to create a
special deployment workflow. Preserve existing CI behavior and add the
smallest release integration required.

Do not bypass branch protection. If publication requires PR approval,
merge, a tag, or manual workflow approval, stop at that gate and report
the exact human action required.

Validation

Run all applicable checks, including:

- deployment dry-run tests;
- runtime-secret wrapper tests;
- bash syntax;
- outer and internal checksum verification;
- archive member/path safety;
- version-consistency validation;
- Linux CPython 3.12 clean-room offline installation;
- missing-wheel negative test.

A deferred test must remain DEFERRED, not PASS.

Commit and PR

Before committing, show:

git status --short
git diff --check
git diff --stat
git diff -- pom.xml
git diff -- .github/workflows

Confirm explicitly that none of these are included:

- .env or tokens;
- certificates or private keys;
- generated handoff directories;
- locally generated archives;
- unrelated files from the other session.

Commit the isolated release branch, push it without force, and open a PR
to the verified default branch.

PR title:

CLUE: add operational deployment and RC release workflow

After PR creation, run the repository’s approved RC release workflow
only as permitted by its normal gates. Do not locally upload an artifact
to bypass CI/CD.

The old candidate containing ".dirty" is superseded and must not be
published.

Final report

Return:

- isolated branch name;
- commit SHA;
- PR URL;
- changed files;
- old and new pom.xml versions;
- resolved Maven/Python/deployment versions;
- CI workflow used;
- CI run URL and result;
- clean RC release ID;
- Nexus artifact URL, if publication completed;
- artifact SHA-256;
- tests passed, failed, and deferred;
- any remaining approval, merge, tag, or runtime gate;
- confirmation that the original worktree and its staged index were not modified.
