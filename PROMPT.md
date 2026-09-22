Continue the current CLUE checkout. Finalize the versioned DEV deployment changes and prepare the CADP handoff using the saved successful Linux run. All responses and artifacts must be in English.

1. Review the current branch, working-tree changes, pyproject.toml, requirements files, README, deployment scripts, and latest run evidence. Preserve existing work.
2. Review and commit the reusable deploy/*.sh scripts, the CA configuration change in .env.example, and the relevant deployment documentation. The user has already authorized committing and pushing the completed CLUE DEV setup changes. Use the existing feature branch and a normal push; verify the remote commit afterward. Stage explicit reviewed files only. Exclude real environment files, secrets, certificates/private keys, cheque data, captures, and generated outputs.
3. Preserve the successful DEV Tungsten configuration:
    CLUE_TUNGSTEN_CA_BUNDLE=/etc/pki/tls/certs/ca-bundle.crt
    Keep the override and readability check. Confirm that configuration precedence preserves the intended CA path and keeps TLS verification enabled, without displaying secret values.
4. Produce a concise CADP handoff from the actual repository:
    * Configured build backend, including whether setuptools is used.
    * Current delivered artifact and packaging command.
    * Exact installation and application execution commands, with working directory.
    * Configuration, credential-path, input/output, and log requirements.
    * Runtime-account requirements and unresolved deployment prerequisites.
    Distinguish the Git source archive, dependency wheels, and any application wheel/sdist. Label commands as executed, documented-only, or blocked. Do not present a proposed packaging process as already verified.
5. Keep the declared Python >=3.10 requirement unchanged. Record the successful Python 3.9.25 run as evidence for that scenario only. Do not bypass installation checks or remove dependencies based on this single execution.
6. Correct the validation wording: live integration succeeded; positive OCR accuracy remains NOT EVALUATED. Treat the Tungsten profile/configuration concern as unresolved until supported by configuration or contract evidence. Equal workbook sizes alone do not establish identical contents.

Use focused checks for the changed scripts and configuration, plus any required repository gate. Reuse the saved live evidence; do not repeat service calls for this handoff.

Return the changed files, checks performed, published commit, and a short build/deployment summary suitable for Nitasha and the CADP team.
