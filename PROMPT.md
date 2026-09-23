Locate and prepare the existing JKS files used by our CLUE Symcor integration so I can securely provide them to DevOps.

1. Read the current local handoff and trace the active Symcor certificate configuration to identify the original JKS file paths. Start with the configured locations and documented certificate folders; do not collect unrelated keystores from the machine.
2. Identify which files are actually required:
    * Client keystore used for Symcor authentication.
    * Separate JKS truststore, only if our implementation requires one.
        Label each file’s role and environment using available evidence. Mark anything uncertain as unverified. Do not assume a test certificate is suitable for production.
3. Create a dedicated handoff folder outside the Git repository with access restricted to the current user. Copy the required original JKS files into it, preserving their contents and leaving the source files unchanged.
    Do not generate replacement certificates, convert formats, extract private keys, or change passwords.
4. Verify that each copy matches its source using SHA-256. Create a short English manifest containing:
    * Filename and size.
    * Purpose and supported environment.
    * SHA-256.
    * Evidence linking the file to the current configuration.
5. Keep all passwords, tokens, .env files, and extracted private keys out of the handoff folder, manifest, console output, and chat. State only the existing configuration variable names used for passwords. Password values will be transferred separately through the approved channel.
6. Return the exact handoff folder path and file paths. If this session supports secure file downloads, provide downloadable attachments; otherwise provide the local paths.

Prepare the files for me to send. Do not email, upload to a public location, commit, or push them. Do not run new Symcor calls or change application settings.

If a referenced JKS is missing or inaccessible, report its expected location and the specific blocker. Do not substitute an unrelated keystore or reconstruct one from extracted keys.
