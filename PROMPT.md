Continue from the new PEM validation results. Preserve the completed checks; do not repeat the certificate preparation.

Resolve the remaining trust configuration question and make the live-test command ready:

1. Trace the effective server trust configuration used by build_symcor_transport in the confirmed Python environment. Inspect the custom SSLContext, Requests settings, relevant environment overrides and pip_system_certs behavior. Report what is actually loaded, rather than inferring it from installed packages.
2. Reconcile the “item E” requirement with the project documentation. “Do not add a trust anchor without an authoritative reference” does not by itself establish that a separate CA bundle is mandatory. Identify whether an explicit approved CA file or pinning requirement exists, or whether the existing approved runtime trust store may be used. Cite the exact local evidence. Do not change a genuine policy or bypass a guard.
3. Review the earlier successful DEV control request and identify its actual trust settings and whether server verification was enabled. Do not reuse a configuration that succeeded only with verification disabled.
4. Correct the PowerShell wrapper:

* Use the exact Python interpreter validated in this report.
* Preserve all existing environment values and restore them in finally, including CLUE_ENV_FILE. Removing variables is not a full restore if they previously had values.
* Keep certificate overrides confined to the test process.
* Use the delivered combined PEM unchanged.
* Do not use the client PEM as a server CA bundle.

My previous request already authorizes one bounded, read-only DEV test; no additional general execution approval is needed. The certificate issuer’s deployment-only restriction remains a separate unresolved issue. Do not assert that it has been cleared.

Complete the investigation and prepare the command now. Once the issuer confirms this use is permitted and the applicable trust requirements are satisfied, run the existing known-good DEV control request once, with verification enabled, bounded timeout and no retry loop.

Return:

* The effective trust source and evidence.
* Whether a separate CA file is required, optional or still unresolved.
* The corrected command.
* Any exact remaining blocker.

Do not modify application authentication, disable verification, run the full batch, upload to Vault, commit or push. Keep secrets and response data out of chat.
