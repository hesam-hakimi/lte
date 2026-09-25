One remaining acceptance check only. Do not add unrelated features.

Verify whether Muhammad's confirmed AutoSys/Salt runtime contract is
actually present in the newly built bundle.

The contract is:

- AutoSys runtime account: TCLUE999DEVS
- Expected group: vmc2_clue_dev
- Secrets are retrieved only at runtime through:

  sudo -n salt-call pillar.get "secrets:<name>" --out=json

- Approved secret names:

  tungsten_primarykey
  tungsten_secondarykey
  symcor_certpublickey
  symcor_cert_privatekey

Perform the following:

1. Inspect bin/clue-batch-run.sh and every packaged shell script.
2. Identify the exact packaged runtime wrapper used by AutoSys.
3. Show evidence that it:
   - retrieves all four approved secret names;
   - uses sudo -n;
   - rejects missing/empty/null values;
   - creates private 0600 temporary certificate/key files;
   - cleans those files on exit and signals;
   - never logs secret values;
   - passes the child command exit status unchanged.
4. Show the exact AutoSys command that invokes the wrapper.
5. Confirm there is no .env or packaged-secret fallback.

If bin/clue-batch-run.sh already implements the complete contract,
do not create another wrapper. Add only the missing operational
documentation and evidence.

If the contract is absent, implement the smallest runtime wrapper,
include it in the bundle and operational guide, add focused tests,
and rebuild the release candidate with a new SHA-256.

Do not call Salt/HKV, deploy, commit, push or publish.

Return a concise PASS/FAIL report with:
- wrapper path inside the archive;
- four secret names;
- AutoSys command;
- final release ID and SHA-256.
