Continue CLUE after the completed merge of PR #1. Prepare and verify an installable application package for the CADP handoff. All responses, code, documentation, and reports must be in English.

Known baseline—verify locally:

* Repository: TD-Universe/W001CLUEinitialRepo
* PR #1 merged into main; reported merge commit begins 66806b56.
* Build backend: setuptools.build_meta.
* Declared Python requirement: >=3.10.
* Previous DEV execution used a Git source archive and PYTHONPATH=src.
* No application wheel or sdist has yet been demonstrated.
* DEV currently has Python 3.9.25; its successful scenario does not change the declared Python requirement.

1. Establish the build source.
    Read repository instructions, pyproject.toml, README, deployment scripts, and docs/handoff/clue/CADP_DEPLOYMENT_HANDOFF.md. Use a clean checkout or worktree of the verified merged revision, preserving existing work. Record the full source SHA. Put any necessary packaging fixes on a new feature branch.
2. Build the application distributions.
    Use the existing setuptools configuration and a Python interpreter satisfying the declared requirement. Build an sdist and build the application wheel from that sdist, so missing source-distribution files are detected. Preserve the existing package version unless repository release policy requires a change.

Inspect both artifacts for required modules, entry points, and runtime resources. Exclude real environment files, credentials, keys, certificates, customer input, cheque images, provider captures, generated outputs, and runtime state. Keep the application wheel distinct from dependency wheels and the existing source-release ZIP.

3. Prove installation independently of the checkout.
    Create a fresh virtual environment and install the generated wheel normally, including its declared runtime dependencies. Do not use an editable install, PYTHONPATH=src, or dependency/Python-version bypasses.

Run from a directory outside the source checkout with PYTHONPATH unset. Confirm the imported CLUE modules come from the installed distribution. Check the declared console entry points and python -m clue.batch using their supported help commands. Run pip check.

4. Exercise the installed application.
    Reuse one existing small synthetic DAT input and the existing local provider simulator or documented offline fixtures. Execute the installed application through its normal batch entry point and verify the resulting workbook and relevant image/field associations.

Do not silently fall back to the source checkout. If simulator tooling needs the checkout, run it separately while the application under test remains the installed wheel. Fix demonstrated packaging/resource-path defects and repeat only affected checks. Avoid rebuilding the test framework or repeating unrelated acceptance suites.

5. Address the Linux installation boundary.
    Record the Python version, OS, and architecture actually tested. Reuse an available supported Linux environment if one exists. If DEV still only provides Python 3.9, complete the build and available installation checks, and mark Linux installation on a supported interpreter as pending.

Prepare offline installation instructions for the confirmed target interpreter and architecture. Do not assume the previously downloaded cp39 dependency wheels suit a newer interpreter. Preserve requires-python >=3.10.

6. Update the CADP handoff.
    Document the actual build, installation, and launch commands; package version and source SHA; dependency delivery method; external configuration and credential locations; and configurable input/output/state/log paths. Preserve the DEV CA-bundle setting and enabled TLS verification.

Clearly distinguish executed checks from instructions awaiting execution. Keep the existing Credit-path, image-side, and positive OCR validation limitations accurate.

7. Return the deliverables.
    Provide:

* Wheel and sdist paths, sizes, and SHA-256 hashes.
* Source revision and any packaging-fix diff.
* Clean-install and installed-application test results.
* Updated CADP handoff path.
* Exact remaining deployment prerequisites.

Keep generated packages outside Git. Do not activate or modify platform-owned CI, deploy to shared environments, enable scheduled jobs, make live provider calls, or change existing credentials as part of this packaging task.
