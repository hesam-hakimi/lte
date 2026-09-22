Hi Nitasha,

For the current CLUE DEV verification, we packaged a specific Git commit as a .tar.gz source archive using git archive. An application wheel/sdist build was not part of this delivery. I need to verify the build backend configured in pyproject.toml before confirming whether it uses setuptools.

The manual deployment steps performed were:

1. Create the source archive and collect Linux-compatible dependency wheels.
2. Transfer them from the laptop to DEV using SSH/SCP and verify SHA-256 checksums.
3. Extract the source into a separate directory for that release.
4. Create a Python virtual environment and install dependencies offline using pip --no-index --find-links.
5. Run the source-tree tests using:
    PYTHONPATH=src .venv/bin/python -m pytest tests/clue

Environment-specific settings and mTLS credentials are handled separately from the application archive. Authenticated live-service verification is still pending.

One prerequisite needs resolving for the CADP template: the project declares Python 3.10+, while the current DEV interpreter is 3.9.25. The source-tree test execution does not establish a supported package installation.

We also need to confirm the application execution command, runtime account, configuration paths, and logging locations for the template. No scheduled job or service activation has been performed.
