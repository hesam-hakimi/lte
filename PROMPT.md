Validate the existing deploy.md instructions against the newly published real Nexus artifact.

Actual artifact URL:

https://rp.td.com/repository/tdu-raw-release/W001CLUE/clue/clue-0.2.0-test-f676277-deploy.tar.gz

Important: this is a different artifact from release 0.2.0-a6f3ba4. Do not use the previous SHA-256 beginning with 10eb134e. Resolve the authoritative SHA-256 for this exact Nexus asset from one of these sources, in order:

1. Its uploaded .sha256 sidecar, if present.
2. Nexus asset metadata/checksum API for this exact URL.
3. The original local sidecar used by the uploader.

Do not accept a checksum calculated only after downloading as the expected checksum. If no independent checksum is available, report BLOCKED_NO_TRUSTED_SHA and identify the smallest required action.

Test requirements:

1. Read the existing deploy.md, deploy/clue-bootstrap.sh, and build/stage/generate_deploy_md.py.
2. Do not create another script, another delivery file, another framework, or another package.
3. Do not rebuild or upload the artifact.
4. From the actual DEV deployment host, verify the URL using TLS verification enabled. Do not use curl -k.
5. Download the real artifact into a fresh temporary staging directory.
6. Record the HTTP status, final URL, content type, byte count and calculated SHA-256.
7. Compare the calculated SHA-256 with the independently obtained expected checksum.
8. Verify that it is a readable gzip/tar archive, contains no unsafe paths or links, has exactly one expected clue-* root, and contains the expected installer and configuration templates.
9. Extract and syntax-check the exact bootstrap heredoc copied from deploy.md, not a rewritten substitute.
10. Rehearse Step 3 using:

* the real Nexus URL,
* the verified SHA-256,
* the current approved non-root test identity,
* a fresh isolated temporary application root,
* the system CA bundle,
* TLS verification enabled.

Do not use /opt/td/clue, modify an existing current link, invoke real Symcor/Tungsten, run a production batch, or execute rollback during this rehearsal. Preserve the temporary evidence for review.

The purpose is to prove that the commands copied from deploy.md perform this exact flow:

Nexus download → checksum verification → archive validation → extraction → configuration seeding → delegation to the packaged bin/clue-deploy.sh.

If the rehearsal succeeds, update only the existing deploy.md through its existing generator so its execution example contains the real Nexus URL and the verified checksum. Do not create a replacement delivery file. Keep the deployment-account placeholder unless the actual account has been confirmed.

Also correct the existing “After it finishes” section so that these are clearly separate operations:

* Status verification
* Intentional batch execution
* Recovery-only rollback

Rollback must not appear as part of the normal post-install sequence.

If a defect is found, make the smallest correction in the maintained deploy/clue-bootstrap.sh, regenerate the same deploy.md, and repeat only the focused test.

Return:

* Exact tested URL
* Authoritative and calculated SHA-256
* Host and non-secret identity used
* Whether the test used the exact deploy.md commands
* Exit code for every stage
* Final status as one of:
    * REAL_NEXUS_BOOTSTRAP_REHEARSAL_PASS
    * REAL_NEXUS_DOWNLOAD_PASS_BOOTSTRAP_FAIL
    * BLOCKED_NO_TRUSTED_SHA
    * BLOCKED_PLATFORM_PREREQUISITE
* Files modified, if any
* Confirmation that no new delivery/helper file was created
* Confirmation that operational /opt/td/clue deployment and live provider calls were not performed
