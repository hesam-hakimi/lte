Correct the artifact-specific hardcoding introduced during the Nexus deployment rehearsal.

The real f676277 Nexus URL and SHA-256 may appear in an artifact-specific generated deployment guide, but they must not be literals embedded in the maintained build/stage/generate_deploy_md.py generator.

Refactor the existing generator with the smallest compatible change:

1. Remove the hardcoded Nexus URL, artifact filename and SHA-256 from generate_deploy_md.py.
2. Accept the artifact identity through explicit inputs:
   - --artifact-url
   - --artifact-sha256
   Alternatively, reuse an existing release-manifest input if the generator already has one. Do not introduce a second configuration mechanism unnecessarily.
3. Validate that:
   - the URL is HTTPS;
   - SHA-256 is exactly 64 hexadecimal characters;
   - required values are not silently replaced with stale defaults.
4. Preserve the ability to generate an artifact-specific deploy.md containing the immutable real URL and checksum.
5. When no artifact values are supplied, generate clearly named placeholders or fail with a useful message, according to the generator's existing contract. Never silently use f676277.
6. Regenerate the current deployment guide for the already-tested f676277 artifact by passing its URL and verified SHA explicitly.
7. Add focused tests proving:
   - another artifact URL and checksum are rendered correctly;
   - f676277 does not remain anywhere in the generator source;
   - missing or malformed values are rejected or rendered as documented placeholders;
   - the bootstrap heredoc remains byte-identical to deploy/clue-bootstrap.sh.
8. Do not rebuild or upload any artifact, modify the validated Nexus asset, run providers, or change deployment behavior.

Report the files changed, exact generator command used for f676277, focused test results, and whether the generic source is now release-independent.
