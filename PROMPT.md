Application source decision:

Use option B:

C:\repos\W001CLUEInitialRepo
commit a516a21

Use it as the clean application source because it contains the required
top-level src/, tests/, config/, and config/environments files and
matches the previously validated bundle lineage.

Use the current deployment tooling from C:\repos\fcrm_clue, including
the newer clue_with_runtime_secrets.sh.

Do not copy CD.yml, unrelated dirty workspace changes, or files from
the Deliverables-only source tree.

In the isolated rehearsal copy, update pom.xml to the approved manual
test version before building. Verify and report the Maven version,
Python package version, deployment release ID, and artifact filename.
Do not silently package the old POM version.

Privileged DEV decision:

Do not treat an installation under $HOME owned by tag5916 as the full
deployment rehearsal. That would bypass the exact runtime identity,
group-membership, sudo, and /opt/td filesystem restrictions that this
test is intended to validate.

Continue with:

1. Build and locally verify the test-only package.
2. Upload it to crcluesbdzwnk0.dev.vmc2.td.com.
3. Verify its checksum and archive structure on DEV.
4. Run the exact-target preflight and zero-mutation dry-run against
   /opt/td/clue.
5. Report MANUAL_REHEARSAL_BLOCKED at the privileged preparation gate
   if the verified conditions remain unchanged.

You may additionally run a clearly separated package smoke test under
$HOME on the DEV server to exercise:

- archive extraction;
- Python 3.12 venv creation;
- offline wheel installation;
- pip check;
- application entry points.

Label that result only as:

DEV_UNPRIVILEGED_PACKAGE_SMOKE

It must not be reported as MANUAL_REHEARSAL_PASS.

The full rehearsal remains blocked until:

- TCLUE999DEVS is an approved member of vmc2_clue_dev, or the platform
  team provides a different approved owner group and the configuration
  is updated consistently;
- an administrator runs the packaged clue-prepare-host.sh for the
  isolated /opt/td rehearsal root;
- deployment is executed as the canonical runtime account
  tclue999devs.

Do not run useradd, usermod, groupadd, or bypass the membership check.
The account appears centrally managed, so report the required identity
remediation for the platform/AD team.

Also print the exact administrator preparation command, but do not run
it yet.

Keep these results separate:

- PACKAGE_BUILD_RESULT
- DEV_EXACT_TARGET_DRY_RUN
- DEV_UNPRIVILEGED_PACKAGE_SMOKE
- PRIVILEGED_RUNTIME_REHEARSAL

Do not claim the last item passed unless it actually runs under
tclue999devs with the approved group and prepared /opt/td rehearsal
root.
