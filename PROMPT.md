The evidence now proves a real strict-idempotency defect.

Do not rerun or modify the DEV installation. Preserve all DEV evidence.
Do not patch the staged or installed scripts directly.

Work only in the authoritative source repository and make the smallest
possible source-and-test correction. Do not include temporary rehearsal
scripts or unrelated working-tree changes.

Confirmed behavior:

- Initial offline deployment succeeded.
- Second `release` returned exit 0 and did not change `releases/`,
  `current`, or `conf/`.
- However, the second `release` itself reran deploy/validate/activate and
  created three deployment logs plus a new fixture-smoke workspace under
  `work/`.
- Therefore the documented strict zero-mutation contract is not met.
- `status` displays the correct healthy active release but returns exit 1
  when there is no previous rollback target.
- A separate manual command removed
  `/opt/clue/clue-code-1.0.5-SNAPSHOT.tar.gz`; record this as operator/test
  activity and do not attribute it to the deployment script.

Required correction:

1. Inspect the current implementation and tests before editing.

2. Add an early idempotent-release gate before any log file, temporary
   directory, staged copy, fixture smoke, deploy, validate, or activate
   action.

3. The early gate may return success only when all of these are true:
   - the requested release directory exists;
   - `current` resolves to that exact release;
   - `.deploy_complete` exists;
   - recorded artifact SHA-256 matches the requested SHA-256;
   - recorded release identity matches the requested release.

4. When those conditions hold:
   - print a concise “already installed and active; nothing to do” message;
   - exit 0;
   - create or modify absolutely no filesystem path, including logs and
     work directories.

5. Do not treat a same-name release with a different digest or incomplete
   marker as idempotent. Preserve the existing fail-closed behavior.

6. Correct `status` semantics:
   - a healthy active first release with no previous rollback target must
     return exit 0;
   - report rollback availability as `none` or a warning;
   - use nonzero status only for an unhealthy or inconsistent deployment.
   First verify this expectation against the operational guide and update
   the guide consistently.

7. Add regression tests that prove:
   - a byte-for-byte and metadata snapshot of the complete app root is
     unchanged after a second identical release;
   - no new log or work path is created;
   - different-digest reuse still fails closed;
   - incomplete releases do not take the no-op path;
   - healthy first-release `status` returns 0;
   - broken current/release state returns nonzero.

8. Run the focused tests and relevant full deployment tests.

Do not rebuild, upload, deploy, commit, or push yet. Report changed source
files, exact diffs, test results, and whether the repository state is safe
for producing a new candidate.
