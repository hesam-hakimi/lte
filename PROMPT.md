Hi team — quick heads-up: the revised CLUE project, build, and deployment structure is currently being finalized in PR #19, while several open PRs and active branches are still based on the previous structure.

For now, please do not merge any PR that depends on the old structure or modify shared files such as pom.xml, CI/CD YAML files, packaging/deployment scripts, configuration files, or application entry points. Independent feature work may continue, but please coordinate before changing these shared areas.

Please reply with your PR number, owner, current status, and the main files affected. Once PR #19 is approved and merged, each PR owner should update their branch from the latest target branch, migrate the changes to the new structure, resolve conflicts, rerun the required tests/build, and add the validation results to the PR. Please do not close or recreate existing PRs unless migration in the same branch is not practical.
