# CLUE — EDP and Nexus evidence update

Recorded: 2026\-09\-24 UTC\. Checkpoint: CLUE\-2026\-09\-24\-NEXUS\-POM\-OBSERVED\-BUNDLE\-UNVERIFIED\.

This addendum updates deployment evidence alongside the frozen CLUE\-REF\-2026\-09\-23\-R5 business baseline\. Read it with the root 01\_CURRENT\_STATE\.json\. The R5 archive does not contain this update\. Findings come from supplied screenshots, the deployment meeting transcript and reported agent results\. No corporate repository, EDP run or Nexus service was accessed from this reference task\.

## Current conclusion

**The CD\-only Maven POM is visibly published in Nexus\. Publication and location of a deployable Python CLUE bundle remain unverified\.** A successful GitHub caller and its HTTP 200 response do not establish downstream build or deployment success\.

The operator starts after SSH login with no Git checkout, copied application files, deployment script or configuration template already present\. Application payloads must come from Nexus\. Initial instructions must cover the approved interactive sudo/account transition, exact download, verification and extraction before invoking anything inside the bundle\.

## Newly received evidence

|Item              |Observation                                                                                                                                                                                               |Limit                                                                                                                                                                         |
|------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|Repository / merge|TD-Universe/W001CLUEinitialRepo, PR #4, feature/edponboard to main; user attributes merge to Natasha. Payload shows merge commit a6f3ba4b107104337a5c7b327edd7b6d9586076b, merged at 2026-09-23T18:20:42Z.|Screenshot evidence; current refs and native merge contents not read here.                                                                                                    |
|Change size       |Payload reports 8 changed files, 772 additions, 50 deletions, 2 commits. Seven distinct paths were visible in supplied diffs.                                                                             |Eighth file and collapsed wrapper bodies were not inspected.                                                                                                                  |
|POM               |com.td.clue:clue-cd-only:1.0.5-SNAPSHOT, packaging pom; parent com.td.pipe:pipeline-parent-pom:LATEST; description refers to CD-only infrastructure onboarding.                                           |Inherited execution and actual EDP stages require inspection. Local POM alone cannot rule out downstream packaging.                                                           |
|CI                |deployableArtifact type pom; Maven wrapper and JDK 21. Python matrix/install/test/build commands were removed from this particular file.                                                                  |Does not prove Python checks disappeared from all workflows or establish Java as the application’s target runtime.                                                            |
|CD                |Existing DEV host crcluesbdzwnk0.dev.vmc2.td.com, custom app type, VMC infrastructure reuse and an AutoSys salt state declared.                                                                           |Does not prove application installation, a CLUE AutoSys job or service-account readiness.                                                                                     |
|Vault             |Four static names: tungsten_primarykey, tungsten_secondarykey, symcor_cert_privatekey, symcor_certpublickey.                                                                                              |Provisioning, PEM packaging, CA delivery, runtime paths and application variable mapping remain unverified. Secret values and inline notification webhooks are not reproduced.|
|GitHub caller     |EDP XL Pipeline Caller, run 35901809407, job 107319618610, succeeded in 11 seconds.                                                                                                                       |This is the caller’s result, not a downstream build result.                                                                                                                   |
|Trigger           |Log selects https://release.td.com/webhooks/start-edp-vmc; HTTP 200 with empty body at 2026-09-23T18:20:57Z.                                                                                              |No downstream EDP run ID or Python artifact URL appears in the supplied excerpt. Do not replay the webhook to investigate.                                                    |
|Nexus             |td-maven-snapshots / com.td.clue / clue-cd-only / 1.0.5-SNAPSHOT; format maven2.                                                                                                                          |Only the selected component’s visible assets were reviewed.                                                                                                                   |
|Visible assets    |clue-cd-only-1.0.5-20260923.184900-2.pom and its .pom.md5 and .pom.sha1 files.                                                                                                                            |No Python wheel or deployment archive is visible here. This does not establish absence elsewhere.                                                                             |
|Endpoint          |Banner says cutover to rp.td.com is complete and EDP uploads there.                                                                                                                                       |Discover the exact asset URL; the Nexus homepage or UI URL is not an artifact download.                                                                                       |

Visible asset path:
`com/td/clue/clue-cd-only/1.0.5-SNAPSHOT/clue-cd-only-1.0.5-20260923.184900-2.pom`

[GitHub run shown](https://github.com/TD-Universe/W001CLUEinitialRepo/actions/runs/35901809407/job/107319618610)\.

The merge, trigger and snapshot timestamps are search keys, not independent proof that this build produced this asset\. Maven wrapper distribution downloads are build tooling\. Do not substitute POM version 1\.0\.5\-SNAPSHOT for application release 0\.2\.0\-\*\.

Seven visible paths: \.mvn/wrapper/MavenWrapperDownloader\.java, \.mvn/wrapper/maven\-wrapper\.properties, CD\.yml, CI\.yml, mvnw, mvnw\.cmd, pom\.xml\.

## Reconciliation with earlier reports

- The deployment agent reported successful developer\-account DEV rehearsal using /usr/bin/python3\.12, version 3\.12\.14, while /usr/bin/python3 remained 3\.9\.25\. Installation under /opt/td/clue, service\-account validation and live provider checks were not established by this rehearsal\.
- sudo \-n requiring a password does not establish that a human operator lacks approved interactive sudo\. Verify the real deployment identity and permissions\.
- Scope the earlier “Nexus publication blocked” statement: the CD\-only POM is now observed; the Python bundle’s publication remains unknown\. Historical upload\-credential restrictions do not establish download restrictions\.
- Earlier comparison reported a provisional exporter in fcrm\_clue@2a2603f and the business workbook implementation in W001CLUEinitialRepo@5ac9541d\. Both were reported rehearsed with fixtures\. The subsequent source\-alignment prompt has no completion result here; verify current source and artifact provenance\.
- Preserve original worksheets plus one result sheet, 41 columns A:AO, source values A:W, images X:Y, eight field/confidence pairs Z:AO and no added clue\_\* business columns\. The reported front/back versus cheque\_front/cheque\_back header discrepancy and confidence\-scale gaps remain open\.
- R5 historical acquisition, Debit preparation and laptop PAT results remain separate evidence\. This update changes neither their outcomes nor existing authorization\. No new provider calls, application tests, build, publication or deployment occurred in this reference task\.

## Next task and completion evidence

Use CLUE\_Find\_Nexus\_Deployment\_Bundle\_2026\-09\-24\.txt in the corporate agent session\. Inspect the current source, historical parent/effective build configuration, existing downstream EDP run and Nexus metadata\. Resolving the parent LATEST today may not reproduce the parent’s version used in that run\.

Record source/ref/commit, producing build ID, package name/version/type/classifier, repository, exact asset URL, reported checksum and locally calculated download checksum\. Inspect candidate contents without executing code\. Establish the application payload, deployment entry point and required dependency installation route\.

Use bounded conclusions: FOUND\_VALID\_DEPLOYMENT\_BUNDLE, CANDIDATE\_UNVERIFIED, ONLY\_CD\_POM\_CONFIRMED, NOT\_FOUND\_WITHIN\_SEARCHED\_SCOPE, or ACCESS\_BLOCKED\. Empty keyword results, missing access and HTTP 200 returning HTML have different meanings\.

If found, complete the existing runbook’s first\-install section from SSH and approved sudo through download, verification, extraction, configuration and execution of the extracted script\. If not found, identify the smallest missing build/publish linkage and the owner only where evidenced\. This investigation updates documentation; it does not implement a new deployment framework or publish/deploy an application\.

## Evidence register

All image observations refer to supplied screenshots, not corporate files retrieved natively\.

|Evidence                        |Supplied source                                                                             |
|--------------------------------|--------------------------------------------------------------------------------------------|
|POM                             |IMG_3A9EBC3B-26F8-418E-9282-4AEA8AA6F70E.jpeg                                               |
|CD                              |IMG_21133CDB-7356-4766-AA1A-D5B326243F44.jpeg                                               |
|CI                              |IMG_90C6ABBA-2F4D-4D66-9B0E-818B018F27DD.jpeg                                               |
|Caller                          |IMG_E1808ECC-CFFF-4FFD-949F-9A5A6C72EC2D.jpeg                                               |
|PR size / merge                 |IMG_10FD8DC9-EEF7-4AA9-A7A8-F1B6C389AED6.jpeg; IMG_3D1785BC-58E8-4D50-9324-FD249CCF39CA.jpeg|
|HTTP response                   |IMG_34C2ACAA-06EC-4624-A7D6-6AB207DAB590.jpeg                                               |
|Nexus                           |IMG_3AE26287-FEBC-4584-B446-8446B60A4F79.jpeg                                               |
|Earlier source/deployment report|IMG_D9180550-536B-4BE9-84AD-88068E996698.jpeg; IMG_B6FD2935-1BBA-49E4-96C3-26201DBC1E78.jpeg|

Root entry\-point/current\-state files link this addendum\. R5 and prior prompts remain historical\. The new prompt is prepared; corporate\-agent delivery and execution are not yet confirmed\.
