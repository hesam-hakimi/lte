Correct the first-install instructions in the existing CLUE deployment runbook.

The operator starts immediately after SSH login. There is no CLUE checkout, deployment script, installed release, or application configuration on the server. Git, SCP, and laptop file transfers are unavailable. Application artifacts must be downloaded from Nexus.

Add one self-contained “First installation from Nexus” section that can be pasted into the change ticket before the package is downloaded:

1. Show the approved interactive sudo transition and actual deployment account. A failed sudo -n check does not establish that an authorized operator cannot use interactive sudo.
2. Using only existing host tools, create a staging directory and download the exact versioned deployment archive from Nexus. Establish the approved READ authentication and TLS trust under the post-sudo identity. Do not confuse Nexus publishing credentials with download access.
3. Verify the archive against the expected release SHA-256, then extract it. Stop on download, verification, or extraction failure.
4. Inspect the actual archive and show the exact extracted installer path. Explain how to create the required configuration from the bundled template and obtain externally provisioned secrets. Do not reference scripts or configuration files that do not exist yet.
5. Invoke the bundled deployment script to perform the installation at the agreed target location. Reuse the existing implementation.

Return one short operator command sequence covering sudo → download → verify → extract → configure → deploy.

Resolve values from native project and environment evidence. Clearly identify any missing account, published artifact URL, checksum, or download prerequisite; do not invent them. If publication remains blocked, document the precise action needed to make the bundle downloadable.

Validate the bootstrap from an empty staging directory through the actual Nexus route when available. Direct transfer is not evidence for this workflow.

Update the existing runbook and relevant report status. Do not create another deployment framework or additional diagnostic scripts.
