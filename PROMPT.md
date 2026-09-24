Implement secure runtime secret retrieval from Salt pillar for the CLUE Python process.

Use only the existing isolated worktree created from PR #13’s remote branch:

* Worktree: clue-edponboard-runtime-env
* Local branch: work/clue-edponboard-runtime-env-20260924
* Expected starting HEAD: 471d6303840af92e8e0300f96d3ee0ffbe8ed1d8

Do not modify any other worktree or repository.

This task implements and validates the secret wrapper locally. Do not push, merge, reopen a PR or access real secrets in this task.

Confirmed Salt secret names:

* tungsten_primarykey
* tungsten_secondarykey
* symcor_cert_privatekey
* symcor_certpublickey

Confirmed application mappings:

Salt pillar	Application contract
secrets:tungsten_primarykey	CLUE_TUNGSTEN_PRIMARY_KEY value
secrets:tungsten_secondarykey	CLUE_TUNGSTEN_SECONDARY_KEY value
secrets:symcor_certpublickey	securely materialized certificate file; export its path as CLUE_SYMCOR_CLIENT_CERT
secrets:symcor_cert_privatekey	securely materialized private-key file; export its path as CLUE_SYMCOR_CLIENT_KEY

1. Reconfirm state

Verify:

* exact repository and origin;
* branch and HEAD;
* worktree is clean;
* the four secret names are still declared in the PR #13 CD/Vault configuration;
* Python still consumes the exact CLUE_* names above.

If the worktree is not clean or the contract changed, stop.

2. Implement a command wrapper

Create a narrowly scoped runtime wrapper under the tracked deployment directory, following existing naming conventions. A suitable name is:

Deliverables/deploy/clue_with_runtime_secrets.sh

The wrapper must be called like:

clue_with_runtime_secrets.sh -- <python command and arguments>

It must retrieve the secrets, export the application variables, run the supplied command as a child process, preserve its exit code and securely remove temporary certificate files afterward.

Do not use eval.

3. Implement safe Salt retrieval

Use the equivalent of:

sudo -n salt-call pillar.get "secrets:${secret_name}" --out=json

Parse it with jq using normal ASCII quoting and require .local to be a non-empty string.

Requirements:

* use $(...), not backticks;
* use set -Eeuo pipefail;
* disable shell xtrace before any retrieval;
* verify sudo, salt-call and jq are available;
* use sudo -n so AutoSys fails instead of hanging for a password;
* treat missing, null, non-string and empty values as errors;
* never print a secret;
* never include a secret in an error message;
* never write a secret to the repository;
* never create or update .env;
* do not use command arguments to pass secret values.

Only secret names may appear in safe status or error output.

4. Handle the Tungsten keys

Retrieve:

* secrets:tungsten_primarykey
* secrets:tungsten_secondarykey

Export them only as:

* CLUE_TUNGSTEN_PRIMARY_KEY
* CLUE_TUNGSTEN_SECONDARY_KEY

Do not export the lowercase Vault names to the child process unless existing documented code requires them.

5. Materialize Symcor files securely

Create a private temporary directory using mktemp -d with umask 077.

Retrieve the certificate and key directly into files without printing their contents:

* symcor_certpublickey → symcor-client-cert.pem
* symcor_cert_privatekey → symcor-client-key.pem

Requirements:

* temporary directory mode must be 0700;
* secret files must be mode 0600;
* no predictable fixed filename outside the private temporary directory;
* export only their paths as:
    * CLUE_SYMCOR_CLIENT_CERT
    * CLUE_SYMCOR_CLIENT_KEY;
* securely remove the temporary directory on normal exit, errors and handled signals;
* guard cleanup so an empty or unexpected path can never cause a broad deletion;
* do not store raw PEM content in environment variables.

If OpenSSL is available, validate without printing certificate or key content:

* the public secret is a valid X.509 certificate;
* the private secret is a readable private key;
* the certificate and private key public components match.

If the private key is encrypted and requires a password, stop with:

SYMCOR_PRIVATE_KEY_PASSWORD_PROVIDER_REQUIRED

Do not invent a password or add a fifth secret.

If symcor_certpublickey is merely a public key and not an X.509 certificate, stop with:

SYMCOR_PUBLIC_SECRET_IS_NOT_CLIENT_CERTIFICATE

6. Run the child process safely

Require the literal -- separator followed by at least one command argument.

Run the command using an argument array:

"$@"

Do not use eval, bash -c or string concatenation.

Capture and return the child process exit code. Ensure cleanup occurs after the child exits.

Do not use exec, because cleanup must run after Python completes.

7. Add deterministic tests with mocked secrets

Do not call real Salt, Vault, Nexus, Symcor or Tungsten.

Add focused tests that place mocked sudo and/or salt-call executables earlier in PATH and return synthetic JSON.

Tests must prove:

* correct four pillar paths are requested;
* the two exact uppercase Tungsten variables reach the child process;
* lowercase Vault variable names are not required by Python;
* the certificate and key paths reach the child;
* the files exist with safe permissions while the child runs;
* the temporary directory is removed afterward;
* missing/null/empty secrets fail closed;
* Salt failure propagates;
* malformed JSON fails closed;
* absent jq or non-interactive sudo failure does not hang;
* no synthetic secret appears in stdout or stderr;
* the child exit code is preserved;
* no real provider call occurs.

Tests must inspect values internally but report only pass/fail, never secret-like content.

8. Preserve Linux behavior

Ensure:

* the wrapper is LF-only;
* it has no UTF BOM;
* bash -n passes;
* Git mode is 100755;
* a narrow .gitattributes rule enforces LF for this script if no existing rule already does.

Do not renormalize unrelated files.

9. Validate the artifact

Run the existing Maven package command used by PR #13.

Safely inspect the resulting tar.gz and confirm:

* the wrapper is included at the expected deployment path;
* its content matches the committed source;
* no real or synthetic secret is included;
* no .env, temporary PEM, private key or certificate is included;
* no actual wheel files are introduced;
* no existing POM or CD behavior is changed unnecessarily.

If the archive loses the executable mode, report it explicitly and propose the smallest assembly configuration fix. Do not make a broad packaging rewrite.

10. Review and commit locally

The proposed change should contain only:

* the secure secret wrapper;
* directly associated focused tests;
* a narrow .gitattributes change only if required;
* the smallest packaging-mode correction only if proven necessary.

Do not modify the existing pytest harness to become the production entry point.

Do not modify the four Vault secret names.

Do not modify the fixed DEV Nexus URL or solve other CD issues in this task.

If all focused tests and artifact checks pass, create one local commit:

feat(deploy): load CLUE runtime secrets from Salt pillar

Do not push it yet.

Return:

* exact changed files and modes;
* Salt-to-application mapping;
* security controls;
* test commands and results;
* Maven build result;
* artifact inspection;
* local commit SHA;
* the exact future AutoSys invocation pattern;
* confirmation that no secret was read, printed, committed or packaged;
* remaining open item: the actual Python production command that AutoSys must place after --.
