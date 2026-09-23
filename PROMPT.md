# CLUE Laptop Development and Endpoint Testing Guide

23 September 2026 \| Windows team runbook \| Symcor PAT and Tungsten DEV

Run the existing CLUE clients on a team laptop, use the supplied JKS and password through the project’s credential loader, retrieve a small Symcor test sample, and submit an eligible test image to Tungsten\. A login to the VMC2 server is not required for this approach\. The laptop still needs an allowed network path and the required authorization to each service\.

This guide covers real endpoint testing\. Local simulators remain useful for development and failure testing between live checks\. The command names and configuration for a team’s source revision must be confirmed as described below before the first request\.

## 1 What each developer needs

|Item             |Required preparation                                                                                                                                   |
|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
|Source code      |Obtain the current team-approved CLUE revision, its dependency instructions and local handoff. Record the commit and any local changes.                |
|Python           |Use the version approved for that revision. The reference declares Python >=3.10; the historical DEV use of 3.9.25 is not a supported-runtime baseline.|
|JKS              |Obtain the project-supplied binary keystore through the internal credential delivery process. The owner’s recorded filename is `clue.dev.td.com.jks`.  |
|Passwords        |Make the store password and, if different, the key password available through the existing protected local configuration or interactive input.         |
|Java tools       |An approved JDK with `keytool` is useful for inspecting the JKS. It is not a requirement to migrate CLUE from Python to Java.                          |
|Endpoint access  |Corporate network or VPN, applicable proxy configuration, DNS and gateway authorization for the selected routes.                                       |
|Tungsten settings|The working DEV URL, required API credential/header, Config and session-related values from the existing successful client configuration.              |
|Test data        |A known non-production source case, expected search criteria and a permitted image for Tungsten. Keep original identifiers as text.                    |

The JKS password opens a keystore\. It is not automatically an API password\. A keystore can contain client identity, trusted certificates, or both\. Tungsten’s credential must be established independently; do not assume the Symcor JKS authenticates both services\.

Use a separate checkout and local output/state directory for each developer\. Do not distribute another developer’s runtime state, private response captures or `.env` as part of a source ZIP\. Provide the credential material separately through the existing internal process\.

## 2 Prepare the project on the laptop

The recorded owner locations are `C:\repos\fcrm_clue` for the application and `C:\repos\FCRM` for reference assets\. Teammates can use different locations; configure their actual paths\.

From the application root, inspect the revision and follow its dependency instructions:

```powershell
git status --short
git rev-parse HEAD
python --version
```

Use the approved Python executable to create a virtual environment\. The path below is a placeholder to replace with the installed, approved interpreter:

```powershell
$ClueBasePython = 'C:\REPLACE_ME\python.exe'
& $ClueBasePython -m venv .venv
$CluePython = Join-Path (Get-Location) '.venv\Scripts\python.exe'
& $CluePython --version
```

Run the dependency installation command documented by that revision using `$CluePython -m pip`\. Do not guess a requirements filename or install unrelated latest package versions\. If package downloads are restricted, use the team’s approved package source or prepared dependency bundle\. Calling the virtual environment’s Python directly does not require changing PowerShell execution policy\. &#91;R6&#93;

Read the current `docs\handoff\clue` and the existing diagnostic instructions\. The historical Symcor diagnostic lead is `tools/symcor_probe.py`; verify that it exists in this checkout before inspecting its help:

```powershell
Test-Path .\tools\symcor_probe.py
& $CluePython .\tools\symcor_probe.py --help
& $CluePython -m clue.batch --help
```

These commands discover the current interface\. They are not a live test recipe\. Do not reuse an old branch or release solely because its filename appears in a historical report\.

## 3 Inspect and load the JKS

Set the actual local keystore path and inspect it without putting a password on the command line:

```powershell
$ClueJks = 'C:\REPLACE_ME\clue.dev.td.com.jks'
Test-Path -LiteralPath $ClueJks
keytool -list -v -keystore "$ClueJks"
```

Enter the store password at the local prompt\. This lists entries and certificate metadata; it does not export a private key\. Inspect the selected alias, entry type, certificate validity and certificate chain\. A `PrivateKeyEntry` is relevant to client identity; a store containing only trusted certificates does not provide a private key for client authentication\. Successfully listing the store does not prove that the application can unlock the selected private key\. &#91;R4&#93;

Use the current CLUE certificate\-loading path that was used for the project\. Establish whether this route consumes the JKS directly, uses an existing conversion/helper, or uses a Java diagnostic\. Keep the original JKS intact and reuse the supplied password from the actual local configuration\. Do not create a new environment\-variable name and assume the client reads it\.

If the Python implementation uses a project helper to produce transport\-compatible certificate material, use that helper’s documented format, alias and protected\-key handling\. Do not rename JKS to PEM or pass JKS directly to Requests’ `cert` argument\. Standard Requests uses PEM certificate/key inputs; its basic certificate interface does not support encrypted private keys\. This is a compatibility fact, not a reason to export an unencrypted key as a shortcut\. Reuse the project’s supported adapter\. &#91;R5&#93;

If only the existing Java client can currently use the supplied JKS, it can establish Java laptop connectivity\. Record Python integration separately until the actual Python client succeeds\. Neither a successful `keytool` command nor a Java result proves Python connectivity\.

Keep certificate and hostname verification enabled\. The client identity and the CA chain used to trust the server are separate settings\. Installing a certificate in Windows or Java does not establish that the Python process consumes it\.

## 4 Select the correct endpoints and configuration

|Service              |Target and configuration source                                                                                                                                                                  |
|---------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|Symcor               |Recorded PAT endpoint: `https://penhubpat.td.com/aws/services/AwsService`. Reconcile with the current project endpoint file and effective client configuration. PAT is the environment name here.|
|Tungsten             |Use the exact current DEV URL from the successful project configuration or native Postman export. No complete Tungsten URL is supplied in this guide.                                            |
|Configuration loader |The recent application reports use `CLUE_ENV_FILE`. Confirm its precedence and use in the selected diagnostic before relying on it.                                                              |
|Tungsten server trust|Existing setting names are `CLUE_TUNGSTEN_TLS_VERIFY` and `CLUE_TUNGSTEN_CA_BUNDLE`; confirm the current implementation consumes them.                                                           |

For a client confirmed to consume `CLUE_ENV_FILE`, select the local file without displaying its contents:

```powershell
$env:CLUE_ENV_FILE = 'C:\REPLACE_ME\clue-laptop.env'
Test-Path -LiteralPath $env:CLUE_ENV_FILE
```

Use the actual existing setting names for JKS path/password/alias, Symcor client identification, Tungsten authentication, proxy, timeouts and trust\. Record presence and effective non\-secret settings, not credential values\. Do not import the owner’s absolute certificate paths onto a teammate’s laptop unchanged\.

The earlier Tungsten\-only TLS bypass was a bounded troubleshooting exception\. The team’s reproducible connection should use verified TLS and the appropriate trust chain\. Do not carry that exception into Symcor or make it a shared default\. &#91;R2&#93;

A configured proxy can change the network route\. Diagnose through the actual client transport; a failed direct TCP probe alone does not establish that a proxy\-routed request cannot work\. If the gateway is unreachable from the laptop, the JKS cannot replace the missing network route\.

## 5 Run one bounded Symcor test

Use the existing diagnostic or normal adapter with the verified configuration\. Keep the test serial and limited to one known source case\. Use finite timeouts and the existing bounded retry policy\. Record the exact secret\-free invocation from the current CLI; this guide does not invent unverified live flags\.

1. **Search\.** For a Credit sample, execute the supported `searchTransaction` request\. For Debit, use its documented document\-search operation\. Keep the input value, mapped search field and transmitted value traceable; do not widen dates or pad accounts to force a hit\.
2. **Evaluate the response\.** Check the native SOAP/application result, hit counts and limit indicators\. HTTP 200 alone is insufficient\. A valid empty result verifies search execution but leaves image retrieval untested\.
3. **Enumerate Credit items when appropriate\.** Inspect the UTI and child documents returned by the search\. Complete inline children may already provide the required document identities\. If enumeration is needed, call `getTransactionItems` with the returned UTI\.
4. **Optional route comparison\.** To test the green\-document sequence explicitly, make one separate `getTransactionItems` call for that same UTI and compare distinct document IDs with the inline list\. Keep criteria, limits and any incomplete result explicit\. Do not interpret an unfiltered UTI call as a source\-row selection rule\.
5. **Retrieve one representative document\.** Use its returned `universalDocID`, `siteSpecificDocID` and `AvailableSegments`\. Call the corrected `getDocs` implementation; retain one document per call\. Do not generate a replacement ID or hard\-code an image mask\.
6. **Validate the images\.** Check the returned document identity, `sorryFlag`, MIME/CID association, byte count and successful image decoding\. A placeholder or unavailable image is not a successful cheque retrieval\. Do not infer front/back solely from MIME order\.

The documented `getDocs` correction uses `docIDList`, both document identifiers and the document’s own segment mask\. The project’s reported wire format `imageFormat=0` means JPEG\. Use the current request builder rather than assembling an older SOAP example manually\. &#91;R1&#93;

Save the full required evidence in the project’s protected local diagnostic directory\. The shareable report should contain safe case labels, counts, operation names and sanitized outcomes\.

## 6 Test Tungsten and the combined flow

Tungsten can be tested independently with an existing approved sample image if Symcor is blocked\. Label that result as an independent service test; it is not evidence that Symcor retrieval worked\.

1. Recover the exact working request shape from the current client or native collection, including authentication header, Config, session values and image payload format\. Do not substitute guessed values\.
2. Use the current Tungsten adapter and verified TLS\. Submit one permitted test image or the minimum image set required by the documented operation\.
3. Record HTTP status and the native application response\. If it creates a job, retain the job/document identity and follow the supported completion/status flow where applicable\.
4. Evaluate extraction separately from submission\. A created job with empty fields is not proof of successful OCR\. A sparse test cheque may legitimately lack target fields; compare against the known sample content\.
5. If submission times out with an uncertain outcome, reconcile the existing job through the supported mechanism before resubmitting\. Avoid duplicate job creation\.

Once both clients work, run a small case through the real CLUE entry point so the ordinary request builders, parsers, image handling, state and Excel writer all execute\. Use a new test workspace and the established live\-execution guard\. A permitted diagnostic document choice must not silently become a production selection algorithm\.

Preserve the business template: sheet `in`, 41 columns A:AO, source columns A:W, images X/Y, and eight field/confidence pairs Z:AO\. Retain each legitimate source/document association\. The `.dat` extension describes serialization; it does not authorize replacing the A:W source contract with legacy `DAT_CSV_V1` fields\. &#91;R1, R3&#93;

Report source\-row linkage separately from transport success\. Shared account/date/direction can yield several documents\. Neither `RETURN_ALL_CHEQUES`, `applyFilter=false`, nor a successful UTI lookup proves that every returned cheque belongs to the intended source row\. Keep the current mapping investigation open until its authoritative rule is established\. &#91;R3&#93;

## 7 Diagnose and report the result

|Observation                |Interpretation and next action                                                                                           |
|---------------------------|-------------------------------------------------------------------------------------------------------------------------|
|JKS cannot open            |Check the actual file, store type and supplied store password. Do not guess passwords.                                   |
|No usable key entry        |Confirm whether this JKS is a truststore or the required client identity. Obtain the correct existing artifact if needed.|
|DNS or connection failure  |Check the intended VPN/proxy/route; identify the earliest failed layer.                                                  |
|TLS failure                |Separate CA trust, hostname, expiry, client identity and chain errors using the actual client error.                     |
|HTTP 401 or 403            |Check the service-specific authentication and authorization; JKS loading alone is insufficient.                          |
|HTTP 200 with SOAP fault   |The operation failed. Inspect the native fault and current request contract.                                             |
|Valid empty search         |Search worked for those criteria; document/image retrieval remains unverified.                                           |
|`sorryFlag` or placeholder |Record unavailable image; do not send a placeholder as a successful cheque sample.                                       |
|Tungsten job without fields|Submission and extraction are different outcomes; inspect completion and sample expectations.                            |

For every laptop, record: source revision and local changes; Python/Java version; exact commands without secrets; effective endpoint/profile; TLS verification mode; test\-case label; operation and attempt counts; native outcome; image/job counts; output/evidence paths; and the first unresolved prerequisite\.

Use precise completion statements: **Symcor search verified**, **Symcor image retrieval verified**, **Tungsten submission verified**, **Tungsten extraction verified for the sample**, and **small CLUE pipeline run verified**\. Mark each independently\. A server run, local simulator, saved\-response replay or another teammate’s result does not prove this laptop can connect\.

After the first live baseline, develop with the existing local\-service profile and targeted tests\. Repeat live calls when validating a changed provider boundary or the agreed integration case; avoid full provider batches for ordinary export or documentation changes\.

## 8 Resolve the exact commands in the native checkout

The owner or a teammate can paste the following into the existing VS Code agent\. It completes the checkout\-specific command details using the files already supplied\. It also provides a bounded execution scope for both endpoints\.

> Continue the existing CLUE project on this Windows laptop. Prepare and execute a reproducible laptop test for the real Symcor PAT and Tungsten DEV endpoints using the supplied JKS and its password from existing protected local configuration. All engineering output must be English. Inspect native code, files and structured logs; do not use screenshots or vision.
> 
> Read the current handoff, branch, working-tree status, configuration loader and successful diagnostic evidence. Reuse the current application clients and helpers. The recorded source/reference roots are C:\repos\fcrm_clue and C:\repos\FCRM; resolve actual paths here. Inspect the supplied clue.dev.td.com.jks, the selected alias and the existing password source without displaying secrets. Establish how the current Python transport loads the certificate and trust chain. Do not invent environment-variable names, export an unencrypted private key as a shortcut, or assume the JKS authenticates Tungsten.
> 
> Use the recorded Symcor PAT URL https://penhubpat.td.com/aws/services/AwsService after reconciling current configuration. Recover the exact Tungsten DEV URL, authentication, Config and session requirements from the existing working client or native collection. Keep TLS and hostname verification enabled. Preserve the current live-execution guard; use its intended explicit test path rather than removing it. No server login is required, but verify the actual laptop network path.
> 
> Resolve and record the exact install, credential-loading, Symcor diagnostic, Tungsten diagnostic and small pipeline commands for this revision. Use one known non-production source case, serial requests and bounded attempts. Run a Symcor search, retrieve one returned document using the corrected getDocs contract, and validate its images. For Credit, inspect inline children; if testing the explicit enumeration route, compare one getTransactionItems call for the same UTI with the inline document IDs. Preserve limits and filtering context. This comparison must not change business document selection.
> 
> Execute one Tungsten test with the retrieved eligible image or a separately identified approved fixture. Distinguish submission, completion and extraction. Reconcile an uncertain job submission before repeating it. When prerequisites permit, execute one small normal-application case in a new workspace and inspect its saved workbook and lineage. Preserve A:W and the 41-column layout. Do not change production mapping/filtering rules, historical outputs or other sessions’ work.
> 
> Save a concise LAPTOP_TEST_COMMANDS.md and sanitized result report in the existing project documentation/diagnostic locations. Include actual commands with no passwords, required configuration key names with no values, prerequisite files, expected outcomes, observed exit codes and protected evidence paths. If blocked, finish independent checks and state the exact missing prerequisite. Do not fabricate a passed test or make a broad batch call. No publishing or deployment is part of this task.

## References

- **R1:** CLUE\-REF\-2026\-09\-23\-R1, especially `docs/02_Symcor_Contract_Correction.md`, `docs/03_Business_Output_and_Source_Mapping.md`, `docs/04_Open_Items_and_Decisions.md` and `docs/05_Environment_and_Evidence_Paths.md`\. Records reported application behavior and evidence limits\.
- **R2:** `CLUE_Symcor_PAT_and_JKS_Followup.md`, `CLUE_Tungsten_Configurable_TLS_Test.md`, and `CLUE_Meeting_Laptop_Connectivity_and_Data_Contract_2026-09-21.md`\. Historical instructions and connectivity context; not proof of a new laptop run\. The current request extends the earlier Symcor\-only diagnostic scope to Tungsten\.
- **R3:** Latest owner\-supplied continuation, prompts 53726, 68412 and 91864 and the discussion of `getTransactionItems`\. These later statements preserve the A:W contract and keep source\-to\-document linkage unresolved\. They supersede conflicting older fixture assumptions\.
- **R4:** Oracle, [The keytool Command](https://docs.oracle.com/en/java/javase/17/docs/specs/man/keytool.html), keystore listing and entry semantics\.
- **R5:** Requests, [Advanced Usage](https://requests.readthedocs.io/en/latest/user/advanced/), certificate verification and client certificates\.
- **R6:** Python, [venv](https://docs.python.org/3/library/venv.html), and pip, [Local project installs](https://pip.pypa.io/en/stable/topics/local-project-installs/)\.

External documentation checked 23 September 2026\. Project references establish reported history; each team member’s current execution report establishes that laptop’s result\.
