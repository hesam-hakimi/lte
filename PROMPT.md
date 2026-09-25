Continue with Stage 1: safe archive inspection only.

Package:

/opt/clue/clue-code-1.0.5-SNAPSHOT.tar.gz

Expected evidence:

* Source commit: c70b121f397736e4a0e65f903f80547fd1f1ab16
* Size: 666434 bytes
* SHA-256: 9c7aab5dbd71f735c592c3d025b0f1943f2e07a9a46c2519c4f65a07d23d2723

Perform only read-only inspection:

1. Reconfirm the file size and SHA-256. Stop immediately if either differs.
2. Test gzip and tar integrity without extracting the archive.
3. List and inspect all archive entries.
4. Check for:
    * Absolute paths
    * .. path traversal
    * Unsafe symbolic or hard links
    * Device files, FIFOs, sockets, or other special entries
    * Duplicate destination paths
    * Unexpected executable files
5. Report:
    * Total entry and file counts
    * Top-level directory structure
    * Deployment/install scripts and their archive permissions
    * Documentation, configuration templates, dependency files, and application entry points included
    * Any expected files defined by the repository’s assembly.xml or package documentation that are missing
    * Names only of any .env, key, certificate, password, or credential-like files; do not display their contents
6. Confirm whether the archive is safe and complete enough for controlled extraction.

Do not run tar -x, extract any file, execute scripts, install dependencies, modify permissions, change server configuration, access provider endpoints, or modify repository files.

Return one final status:

* ARCHIVE_INSPECTION_PASS
* ARCHIVE_INSPECTION_PASS_WITH_GAPS
* ARCHIVE_INSPECTION_BLOCKED

Include exact evidence and stop for the next instruction.
