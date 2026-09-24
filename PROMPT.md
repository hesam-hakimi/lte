HIGH PRIORITY — Establish the CLUE Vault runtime contract while secret population is pending.

Repository:
Alpha-Universe/W001CLUEinitialRepo

Current confirmed status

The authoritative DEV Vault endpoint from the latest edited platform-owner message is:

https://dev.vault.alpha.com

Do not use the earlier vault-e.dev.azure.alpha.com address unless tracked corporate documentation explicitly proves that it is a required API endpoint or redirect.

Vault configuration:

* KV engine: v2
* Mount: clue
* Logical path: dev/w001clue/w001clueinitialrepo
* API path: /v1/clue/data/dev/w001clue/w001clueinitialrepo

Expected keys:

* tungsten_primarykey
* tungsten_secondarykey
* symcor_cert_privatekey
* symcor_certpublickey

The platform owner has confirmed:

* the Vault structure/path has been created;
* the secret values are not currently showing;
* she is investigating and will confirm when they become available.

Therefore, all four keys currently have this operational status:

NOT_READY_PENDING_POPULATION

Objective

Determine exactly how the corporate CD framework delivers these Vault secrets to the CLUE application on the DEV VMC2 host.

This is a read-only investigation. Do not implement or modify anything yet.

Safety rules

* Never print, copy or retrieve any secret value.
* Do not open the Secret tab through automation.
* Do not use a browser session token in scripts or terminals.
* Do not modify Vault, CD.yml, source code or deployment configuration.
* Do not install hvac or another Vault library.
* Do not disable TLS verification.
* Do not use curl -k, verify=False or VAULT_SKIP_VERIFY.
* Do not create, rotate or overwrite a secret.
* Do not access PAT or Production.
* Do not stage, commit, push, reset, clean, restore or stash files.
* Leave all unrelated working-tree changes untouched.

Tasks

1. Record the native Git state:
    * repository root;
    * current branch;
    * current HEAD;
    * origin URL;
    * porcelain status;
    * latest remote head of application PR #6.
2. Fetch remote references without changing the working tree.
3. Inspect the tracked CD.yml and report exact line references for:
    * deploymentParameters.dev.operation_secrets.vault;
    * the four expected secret names;
    * type: static;
    * skip_modify_secrets;
    * salt_formula;
    * autosys/runtime configuration.
4. Search the application source and tracked documentation for:
    * tungsten_primarykey
    * tungsten_secondarykey
    * symcor_cert_privatekey
    * symcor_certpublickey
    * Tungsten API-key environment variables
    * Symcor client-certificate paths
    * Symcor private-key paths
    * secret-loading helpers
    * operation_secrets
    * Vault or HashiCorp references
5. Determine how the existing application currently receives each value:
    * environment variable;
    * file path;
    * YAML/job configuration;
    * direct application-to-Vault call;
    * not currently implemented.
6. Inspect available internal corporate documentation and tracked repositories using the same CD.yml schema.
7. Establish the documented behavior of:
    * operation_secrets.vault;
    * type: static;
    * skip_modify_secrets: False.
8. Determine whether the CD framework:
    * reads the Vault KV v2 secret;
    * authenticates using a deployment identity;
    * writes secrets to environment variables or files;
    * controls target ownership and permissions;
    * refreshes values after rotation;
    * requires an application restart.
9. For every conclusion, provide the supporting repository/document path and line reference. Clearly label unsupported assumptions as UNKNOWN.
10. Classify the runtime design as exactly one of:
    A. CD-managed Vault retrieval and runtime injection
    B. Direct application-to-Vault retrieval
    C. Not yet established
11. Do not choose A or B without direct corporate evidence.
12. If design A is established, produce a mapping table with:
    * Vault key;
    * injected environment-variable or file name;
    * existing application consumer;
    * expected Linux owner/group;
    * expected permission mode;
    * missing application wiring.
13. If design B is established, report—but do not implement:
    * authentication method;
    * runtime role or service identity;
    * token lifecycle;
    * CA trust source;
    * namespace, mount and path;
    * retry/fail-closed behavior;
    * audit requirements.
14. Prepare, but do not execute, a safe post-provisioning validation procedure that will report only PRESENT, MISSING or ACCESS_DENIED for the four key names without displaying their values.

Required output

Return:

1. Repository, branch, HEAD and PR #6 remote head.
2. Final Git status proving no files were changed.
3. CD.yml evidence with exact line references.
4. Current application secret-consumer mapping.
5. Corporate CD-framework evidence.
6. Runtime classification: A, B or C.
7. Exact injection variables/files, if established.
8. Runtime identity/role, if established.
9. Remaining questions for the platform owner.
10. Minimal implementation plan to execute after the secrets are populated.
11. Safe post-provisioning validation procedure, not executed.
12. Explicit status:
    VAULT_PATH_CREATED
    SECRET_VALUES_PENDING
    REAL_SECRET_READ_NOT_RUN
