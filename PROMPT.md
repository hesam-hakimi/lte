Continue the same CLUE session. Complete the operator handoff by automating the first-install steps with one small Bash bootstrap.

Read the existing runbook section 2A, the actual deployment archive, and the existing shell scripts. Reuse the current verified bundle unless a concrete change requires rebuilding it.

The operator starts immediately after SSH login, with no Git checkout, copied files, configuration templates or deployment scripts on the server. The approved sudo/account transition can remain one explicit manual step. After that, provide one copy-paste Bash block that completes the bootstrap and invokes the existing installer.

Implement this narrow flow:

1. Accept the exact Nexus archive URL, expected SHA-256 and required environment values once, at the beginning.
2. Download into a fresh writable staging directory with TLS verification enabled. Stop on download or checksum failure.
3. Validate and extract the archive, then locate its existing installer and configuration templates.
4. Create missing configuration from those templates and populate the required non-secret values automatically. Do not require vi or overwrite existing configuration. Point CLUE_ARTIFACT_FILE at the archive just downloaded and verified, avoiding another download.
5. Invoke the bundled bin/clue-deploy.sh release –config . Let that existing script perform installation, virtual-environment setup, dependency installation, validation and activation. Preserve its exit status and show the resulting deployment status.

Reuse an existing bootstrap if available; otherwise add only one short .sh file. Do not introduce another deployment framework, helper scripts, or duplicate the installer’s logic.

The bootstrap must be usable before the package is extracted: include its copy-paste invocation and complete Bash content in the existing runbook, generated from the same script. Do not assume clue-bootstrap.sh already exists on the server or make its only copy available inside the archive.

Keep Python installation, account provisioning and required directory permissions as clearly stated platform prerequisites. Use the approved non-root deployment identity. Keep credentials and certificates external.

Perform focused checks of bootstrap failure handling, preservation of existing configuration and delegation to the bundled installer. Do not rerun broad application suites or live provider calls.

Return the absolute Windows path to the bootstrap and the exact short operator instructions. Update the existing runbook. An unpublished Nexus URL or unresolved deployment account must remain explicitly identified; they must not prevent delivering the script, but must not be reported as a successful end-to-end deployment.
