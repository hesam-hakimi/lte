Time-box this work. The immediate objective is to produce one reviewable CLUE DEV deployment candidate and two clearly separated installation documents. Do not expand the scope.

Required deliverables:

1. A new local deployment candidate:
    * clue-<release-id>-deploy.tar.gz
    * matching .sha256
    * generated from the current intended source changes
    * includes the CLUE application wheel, complete offline dependency wheelhouse, lock file, manifests, installer scripts and both documents below
2. CLUE_OPERATIONAL_DEPLOYMENT.md
    * short, administrator/operator-facing
    * approximately two pages of happy-path instructions
    * exact commands to verify and extract the archive
    * exact command to prepare the host
    * exact command to install
    * status and rollback commands
    * concise PASS/FAIL examples and remediation
    * no design history, test logs, Nexus investigation, Maven/PyPI research or long explanations
3. CLUE_DEPLOYMENT_ENGINEERING_REFERENCE.md
    * preserve useful technical design, security controls, failure semantics, dry-run contract and advanced troubleshooting
    * link to the operational guide
    * do not duplicate the operational happy-path commands
    * move/rename the existing long runbook using git mv where appropriate to preserve history

Operator contract:

* The operator logs in using an approved sudo-capable account.
* The downloaded archive is verified before any packaged script is executed.
* After extraction, the operator invokes only simple scripts from the package.
* Keep the existing clue-deploy.sh as the non-root deployment engine.
* Add only the smallest necessary privileged host-preparation script if an equivalent does not already exist.
* Do not redesign unrelated deployment code.

The privileged preparation script must:

* verify TCLUE999DEVS resolves
* verify vmc2_clue_dev resolves and validate membership
* create only /opt/td/clue/releases, /opt/td/clue/conf, /opt/td/clue/logs, and /opt/td/clue/work
* never recursively chown or chmod /opt/td/clue
* never alter archive, clue_staging, outputs, or rejects
* render only non-secret configuration
* reject unresolved placeholders
* print named PASS/FAIL stages and an actionable failure reason

The deployment engine must continue to:

* verify the artifact and internal checksums
* create a release-specific virtual environment
* install the exact CLUE wheel and all dependencies offline using --no-index --find-links
* never install the unrelated public PyPI package named clue
* run pip check
* validate both entry points
* run the existing smoke validation
* activate only after all checks pass
* remain idempotent and fail closed

Minimum candidate verification:

* outer SHA-256 matches
* all internal SHA256SUMS entries pass
* archive path-safety checks pass
* required scripts and both documents are present
* complete installation succeeds in a clean temporary application root with network access disabled and pip cache disabled
* pip check exits 0
* expected package versions and entry points are present
* removing one required wheel causes installation to fail before activation
* dry-run remains zero-mutation and zero-network

Do not deploy to DEV, retrieve runtime secrets, call AutoSys, Symcor or Tungsten, publish to Nexus, commit, or push.

If the artifact generator requires a clean Git commit, do not bypass provenance checks or invent a commit. Stop with READY_TO_COMMIT_AND_BUILD and list the exact intended files.

At completion report:

* exact artifact and checksum paths
* release ID and SHA-256
* archive contents summary
* dependency/wheel count
* verification results
* the two documentation paths
* changed-file list
* any blocker preventing generation of the candidate
