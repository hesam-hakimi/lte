Hi Nitasha — I completed a read-only check of the latest main after PR #6 and PR #8.

The four Vault keys are declared in CD.yml, but main currently has no salt_grains injection mapping, so the secrets are not yet delivered to the CLUE runtime. The newer EDP branch contains a draft mapping, but it should not be merged as-is because the Tungsten variable names and the Symcor certificate handling do not match the application contract.

Could you please confirm:

1. For app_type: custom with states: [autosys], should we use salt_grains.environment_variables, and will an AutoSys-launched process inherit those variables?
2. For symcor_cert_privatekey and symcor_certpublickey, should the supported mapping use files or encoded_files?
3. What approved absolute paths, owner/group and file modes should be used for those two files?
4. Should vaultEnv: dev1 be included in CD.yml?
5. Please also confirm when the four Vault values are populated. We only need presence confirmation and do not need the secret contents.

The application expects:

* CLUE_TUNGSTEN_PRIMARY_KEY
* CLUE_TUNGSTEN_SECONDARY_KEY
* CLUE_SYMCOR_CLIENT_CERT containing a certificate file path
* CLUE_SYMCOR_CLIENT_KEY containing a private-key file path

Once these platform details are confirmed, we can prepare the minimal CD.yml change.
