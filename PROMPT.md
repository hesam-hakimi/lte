Perform a bounded, read-only post-merge Vault readiness check.

Repository: Alpha-Universe/W001CLUEinitialRepo
PR #6 is reported as merged.

Goal: determine whether the current remote main contains the required Vault-to-runtime configuration. Do not change anything yet.

Rules:

* Do not edit files.
* Do not create a branch or commit.
* Do not call Vault or retrieve any secret value.
* Do not print tokens, passwords, certificates, private keys, or secret contents.
* Do not rebuild or publish any artifact.
* Do not inspect or modify unrelated Nexus/deployment-generator work.

Steps:

1. Record the current branch and git status without changing them.
2. Fetch the latest remote references.
3. Record the exact origin/main commit SHA.
4. Inspect CD.yml directly from origin/main.
5. Inspect only the application configuration files needed to verify runtime compatibility.
6. Check these four declared Vault keys:
    * tungsten_primarykey
    * tungsten_secondarykey
    * symcor_cert_privatekey
    * symcor_certpublickey
7. Determine whether current origin/main provides compatible runtime injection:
    * Tungsten secrets must reach the application as:
        * CLUE_TUNGSTEN_PRIMARY_KEY
        * CLUE_TUNGSTEN_SECONDARY_KEY
    * Symcor certificate and private-key contents must be materialized as files.
    * The application must receive the resulting file paths through:
        * CLUE_SYMCOR_CLIENT_CERT
        * CLUE_SYMCOR_CLIENT_KEY
    * Raw certificate or private-key bodies must not be passed where the application expects filesystem paths.
    * Check whether any repository-managed .env behavior would override injected runtime values.
8. Do not assume undocumented CD/Salt behavior. Mark it as an unresolved platform question when repository evidence is insufficient.

Return:

* exact origin/main SHA;
* whether the merged PR6 application changes are present;
* a four-row evidence table containing:
    * Vault key;
    * declaration location;
    * injection target;
    * compatibility: YES, NO, or UNKNOWN;
    * supporting file and line references;
* one final verdict:
    * READY_FOR_SECRET_POPULATION_AND_DEV_DEPLOY
    * CD_CONFIGURATION_CHANGE_REQUIRED
    * PLATFORM_CONFIRMATION_REQUIRED
* the smallest next action required;
* final git status, confirming the working tree was left unchanged.

Do not implement the fix in this task.
