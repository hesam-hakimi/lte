Make the deployment-guide generator change durable in Git.

Current evidence:
- build/stage/generate_deploy_md.py is release-independent and its focused tests pass.
- The file is currently ignored by Git.
- deploy.md is generated, artifact-specific, and currently untracked.
- The validated Nexus artifact must not be rebuilt, replaced, or uploaded again.

Tasks:

1. Inspect .gitignore, repository conventions, build scripts, handoff documents, and existing tracked tooling to determine the canonical tracked location for the deployment-guide generator.
2. Do not force-add an ignored build/stage file unless repository evidence explicitly identifies it as maintained source.
3. If build/stage is generated workspace:
   - move or reproduce the generator in the appropriate tracked source/tooling directory;
   - update the existing build/deployment caller to use that canonical generator;
   - move the focused tests to the corresponding tracked test location.
4. Preserve these behaviors:
   - no hardcoded artifact URL, filename, release commit, or SHA-256 in generator source;
   - explicit --artifact-url and --artifact-sha256 inputs;
   - HTTPS and 64-hex SHA-256 validation;
   - both-or-neither input semantics;
   - documented unresolved placeholders when inputs are omitted;
   - bootstrap heredoc remains byte-identical to deploy/clue-bootstrap.sh.
5. Decide from repository evidence whether generated deploy.md belongs in version control:
   - if it is a release-specific delivery document, leave it untracked and explain why;
   - if it is an official tracked document, regenerate it through the canonical generator and include it.
6. Run the focused tests from the tracked locations and inspect git diff/status.
7. Commit only the intended generator, caller, tests, and documentation changes. Do not use `git add .`.
8. Do not rebuild or upload an artifact, modify the Nexus asset, run providers, merge the PR, or touch unrelated work.

Return:
- canonical generator and test paths;
- files committed;
- commit SHA;
- exact test command and results;
- whether deploy.md is tracked or intentionally delivery-only;
- proof that tracked generator source contains no f676277, a516a21, Nexus URL, artifact filename, or release SHA literal;
- final git status, including unrelated changes left untouched.
