Continue the CLUE DEV installation rehearsal from the existing extracted package:

  /opt/clue/pr19-c70b121f

Goal:
Determine and execute the next safe installation-only step. Runtime AutoSys/HKV validation is explicitly out of scope for this step.

Rules:
- Do not retrieve or print any secret.
- Do not invoke salt-call, sudo, AutoSys, Symcor, or Tungsten.
- Do not use local TLS/certificate files as substitutes for HKV.
- Do not enable bash tracing.
- Do not delete, overwrite, rebuild, or edit the extracted package.
- Do not access the network.
- Do not rerun the full pytest suite.
- Do not invent an installation command.

Actions:

1. Read the complete deployment documentation and relevant scripts:
   - /opt/clue/pr19-c70b121f/deploy.md
   - /opt/clue/pr19-c70b121f/deploy/*.sh
   - /opt/clue/pr19-c70b121f/pyproject.toml

2. Identify:
   - the authoritative installation command;
   - the normal runtime entry point;
   - whether a documented dry-run option exists;
   - exactly which steps require runtime secrets.

3. Validate the existing installation state without changing it:
   - source tree and required deployment files exist;
   - .venv/bin/python is executable;
   - Python and pip versions;
   - pip check;
   - the external wheelhouse and SHA256SUMS exist;
   - bash syntax for all deploy/*.sh files;
   - previously generated test and prerequisite reports.

4. If a documented dry-run exists, inspect its implementation first.
   Run it only if it provably:
   - does not retrieve secrets;
   - does not call provider endpoints;
   - does not invoke AutoSys;
   - does not alter the installed tree.

5. If no safe documented dry-run exists, stop without modifying anything.

Return:
- authoritative installation command;
- runtime entry point;
- current installation checks with PASS/FAIL;
- whether the current artifact supports a safe dry-run;
- exact remaining steps for installation;
- one final status:
  INSTALLATION_READY_TO_COMPLETE
  INSTALLATION_ALREADY_COMPLETE
  INSTALLATION_BLOCKED_BY_PACKAGE_CHANGE

Do not report AutoSys or runtime validation as passed.
