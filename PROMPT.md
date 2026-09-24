Implement the runtime-environment changes requested by Muhammad on the EDP onboarding branch.

Repository:
TD-Universe/W001CLUEinitialRepo

Muhammad’s remote branch:
feature/edponboard

Related closed PR:
#13

Important repository boundary:

* This task applies only to W001CLUEinitialRepo.
* Do not modify any fcrm_clue worktree or branch.
* Do not copy files from a dirty fcrm_clue worktree.
* Do not touch the separate deployment-tooling branch or fetch_wheelhouse.sh.

Meeting-backed requirements:

* Preserve Muhammad’s existing POM and CI/CD onboarding changes.
* EDP should build and copy one environment-independent tar.gz artifact.
* AutoSys will execute the runtime shell script later under the configured NPID.
* Python runtime configuration must be provided through environment variables.
* Secret values must never be committed, embedded in the artifact or printed.
* DEV does not currently have the same runtime NPID as PAT/PROD.
* Do not guess or hardcode TSTM, TSDM, directory ownership, sudo privileges or environment-specific values.

1. Verify repository and branch state

Report:

* repository root;
* origin URL;
* current branch and HEAD;
* complete porcelain Git status;
* all linked worktrees;
* current SHA of origin/main;
* current SHA of origin/feature/edponboard.

Fetch origin without modifying any working tree.

Confirm that the remote repository is exactly:

TD-Universe/W001CLUEinitialRepo

Confirm whether feature/edponboard still exists and whether PR #13 was closed without merging.

If the branch is missing, already merged, rewritten unexpectedly or the existing local worktree is dirty, stop and report. Do not overwrite or clean anything.

2. Create an isolated implementation worktree

Create a new clean linked worktree from the exact current SHA of:

origin/feature/edponboard

Use a new local branch such as:

work/clue-edponboard-runtime-env-20260924

Do not switch or modify another existing worktree.

Record the original remote branch SHA. It will be the expected remote tip before any later push.

3. Audit Muhammad’s changes before editing

Compare the branch with its merge base against origin/main.

Identify and report:

* pom.xml changes;
* CI and CD workflow changes;
* artifact build and naming logic;
* deployment destination and ownership configuration;
* shell scripts copied into the deployment;
* the actual shell entry point intended for AutoSys;
* the exact build command used by CI;
* the expected tar.gz output;
* whether the artifact is intended to be identical across DEV, PAT and PROD.

Do not rewrite Muhammad’s POM/CD implementation unless a directly related defect prevents the requested runtime configuration.

4. Derive the environment-variable contract from code

Search the tracked Python and shell code for all runtime configuration access, including:

* os.environ;
* os.getenv;
* Pydantic/BaseSettings configuration;
* Symcor endpoint and authentication settings;
* Tungsten endpoint and authentication settings;
* certificate, CA, JKS or trust-store settings;
* TLS verification settings;
* input/output/archive paths;
* logging and report paths;
* environment or job configuration paths.

Also inspect the EDP workflows, POM, deployment scripts and existing HashiCorp/Vault integration for the corresponding injected variable names.

Produce a matrix containing:

* environment-variable name;
* Python consumer;
* required or optional;
* secret or non-secret;
* environment-specific or common;
* expected runtime provider;
* shell mapping, if one name must be mapped to another.

Do not print secret values.

5. Confirm the runtime secret-delivery mechanism

EDP build-time variables do not automatically persist into a later AutoSys execution.

Determine from tracked repository evidence how AutoSys will receive the required runtime values:

* AutoSys job environment;
* HashiCorp/Vault runtime injection;
* NPID profile;
* a protected environment file created outside Git;
* or another documented mechanism.

If the branch contains only build-time secret configuration and does not establish how the later AutoSys process receives the values, stop before editing and return this exact blocker:

RUNTIME_ENV_INJECTION_CONTRACT_NOT_FOUND

In that case, list the exact variable names and the single question that must be answered by Muhammad/AutoSys:

“How will these variables be injected into the AutoSys process at runtime after the EDP deployment has completed?”

Do not solve this by hardcoding values or committing an .env file.

6. Implement the minimal shell integration

Only if the runtime injection contract is proven, update the actual AutoSys shell entry point and directly associated configuration example, if needed.

Requirements:

* consume the documented runtime variables;
* map and export them under the exact names expected by Python;
* fail early for missing required variables;
* do not provide fallback values for secrets;
* do not echo or log secret values;
* preserve existing command arguments and exit-code propagation;
* use safe quoting;
* keep shell files LF-only, BOM-free and executable;
* do not introduce sudo into the application script;
* do not hardcode PAT/PROD users into DEV;
* do not store secret values in POM, workflow YAML, shell files, examples or the artifact;
* do not commit .env, certificates, keys or JKS files.

Only placeholder names may be added to an example configuration file.

7. Preserve the deployment model

Confirm that:

* the same application artifact remains usable for all environments;
* environment differences are supplied at runtime;
* EDP performs file deployment;
* AutoSys performs scheduled execution;
* ownership and privilege configuration remain the responsibility of the documented EDP/AutoSys configuration;
* no manual Nexus artifact ID or hardcoded test-artifact URL is introduced.

Do not add wheel files or make wheelhouse handling mandatory in this task. Report the existing dependency-installation behavior without changing it.

8. Validate locally without calling providers

Run:

* bash -n on every changed shell script;
* ShellCheck if already available;
* focused configuration/runtime tests;
* the exact build command used by Muhammad’s CI/POM;
* a clean artifact build.

Use dummy non-secret values to simulate the AutoSys runtime environment and confirm:

* required variables reach the Python process;
* missing required variables fail safely;
* secret values are not printed;
* no Symcor, Tungsten, Nexus or external endpoint is called.

Safely inspect the generated tar.gz and verify:

* expected application and deployment files are present;
* the updated shell entry point is included with executable mode;
* no .env, secret value, private key, certificate, JKS, user-specific path or generated test evidence is included;
* no environment-specific secret makes the artifact different between environments.

9. Review the proposed change

The new work above Muhammad’s remote branch must be minimal.

Report:

* exact changed file list;
* diffstat;
* environment-variable matrix;
* runtime injection evidence;
* syntax and test results;
* build command and result;
* artifact filename, size and safe member summary;
* secret scan result.

Do not include unrelated source changes merely because PR #13 already contains many files.

10. Commit and safely update Muhammad’s branch

If and only if all validation gates pass, create one focused commit, for example:

fix(deploy): pass runtime configuration to CLUE batch

Immediately before pushing, confirm that remote feature/edponboard still resolves to the SHA recorded in step 1.

If it moved, stop without rebasing or force-pushing.

Otherwise perform a normal fast-forward push:

git push origin HEAD:refs/heads/feature/edponboard

Do not use force or force-with-lease.

Verify with git ls-remote that the remote branch resolves to the new commit.

Do not merge, reopen or create a PR in this task. Note explicitly that pushing to a branch belonging to closed PR #13 does not itself reopen the PR.

Return:

* old and new remote SHAs;
* exact implementation files;
* variable mapping;
* proven runtime secret-delivery mechanism;
* test and build evidence;
* artifact inspection result;
* push result;
* any action Muhammad must take to reopen PR #13 or create a replacement PR.
