The CLUE code has been merged into main, and a manual live run has succeeded on Linux DEV. We now need the deployment process automated.

Could your team help with these items?

1. Deployment template and artifact format
    Confirm the artifact format CADP expects and configure the deployment template. The project uses setuptools; application wheel packaging and clean-install verification are our next development task.
2. Python runtime
    Provide an approved Python version meeting the project’s requirement of >=3.10, with an application virtual environment. DEV currently has Python 3.9.25.
3. Deployment and runtime accounts
    Confirm the deployment identity and provision the CLUE runtime service account. Agree on installation, input, output, state, and log directories and their required permissions.
4. Dependency delivery
    Configure an approved internal package source or an offline wheelhouse. The current DEV setup could not reach a package index.
5. Configuration and credentials
    Provision environment-specific settings, client certificates, private-key access, and secrets in managed locations accessible to the runtime account. Keep TLS verification enabled. For Tungsten on DEV, the tested CA setting is:
    CLUE_TUNGSTEN_CA_BUNDLE=/etc/pki/tls/certs/ca-bundle.crt
6. Validation and rollback
    Deploy an identified artifact version, run the agreed post-deployment smoke test, retain deployment logs, and provide a rollback procedure. The initial scope is a manual DEV deployment.
7. Pipeline test coverage
    Coordinate with the CI/EDP owner to run Python tests and package validation in the approved pipeline. Currently, the EDP caller check passes, but the Python test workflow is not active.

We can provide the build/install/run commands and docs/handoff/clue/CADP_DEPLOYMENT_HANDOFF.md. Please confirm the owners, prerequisites, and anything else needed from development.
