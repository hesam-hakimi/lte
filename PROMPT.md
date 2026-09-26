VERSION AND NEXUS ENDPOINT DECISION — EVIDENCE-BASED AUDIT

Before committing, pushing, opening a PR, or triggering CI/XLR, perform this read-only audit.

1. Identify the historical wrapper commit

Find the exact historical commit where this file was first added:

Deliverables/deploy/wrapper.sh

Search all available local and remote Git refs. The meeting evidence shows that it was pushed from a feature branch, but obtain the exact branch spelling and commit SHA from Git rather than relying on the screenshot.

Report:

* Exact commit SHA
* Exact branch/ref name
* Commit timestamp
* Commit subject
* Whether the commit is reachable from origin/main

Do not checkout, reset, merge, cherry-pick, stage, or modify anything during this audit.

2. Inspect the historical CI/CD contract

Using git show <commit>:<path> or an equivalent read-only command, inspect these files exactly as they existed in the historical wrapper commit:

* CI.yml
* CD.yml
* pom.xml
* assembly/pom.xml, if present
* assembly.xml, if relevant to artifact naming
* .github/workflows/edp_xl_caller.yml

First report the literal values without interpretation.

Historical producer configuration

From CI.yml and the POM files, extract:

* Nexus publish endpoint and hostname
* Repository name
* groupId
* artifactId
* Packaging/type
* Effective Maven version
* Expected artifact filename
* distributionManagement source, including inherited values when applicable

Historical consumer configuration

From CD.yml, extract:

* Complete batch_url
* Download endpoint and hostname
* Repository name
* Logical SNAPSHOT version in the URL
* Expected artifact filename
* basename or installation root
* Batch name

3. Correlate the historical configuration with Nexus evidence

The known historical Nexus artifact is:

Group: com.td.clue
Artifact: clue-code
Logical version: 1.0.5-SNAPSHOT
Stored artifact:
clue-code-1.0.5-20260924.233625-2.tar.gz

Determine:

1. Which historical file supplied 1.0.5-SNAPSHOT.
2. Which endpoint was configured to publish it.
3. Whether CI.yml contained a literal version or obtained it from pom.xml.
4. Whether CD.yml used repo.td.com or rp.td.com.
5. Whether the CD download URL was actually exercised or only the CI upload is proven by the Nexus artifact.

Do not conclude that the historical CD endpoint worked merely because the artifact reached Nexus. Upload and download are separate paths.

4. Compare with the current release candidate

Compare the historical values with both current origin/main and the staged release candidate.

Produce this exact table:

Field	Historical wrapper commit	Current origin/main	Current staged candidate
CI publish host			
CD download host			
Repository			
groupId			
artifactId			
Maven version			
CD logical version			
Artifact filename			
basename			

The expected current version is:

1.1.0-SNAPSHOT

The previous 1.0.5-SNAPSHOT was a valid historical pipeline version. The required version increase from 1.0.5-SNAPSHOT to 1.1.0-SNAPSHOT has already occurred.

Do not increment the candidate to 1.1.1-SNAPSHOT.

The rehearsal identifier:

0.2.0-test-f676277

belongs only to the separate manual rehearsal artifact. It must not be treated as the official Maven or CI version.

5. Verify version alignment

Confirm all of the following:

* Effective root POM version is 1.1.0-SNAPSHOT.
* Effective assembly POM version is compatible with the root POM.
* Local artifact is clue-code-1.1.0-SNAPSHOT.tar.gz.
* CD.yml references the logical version 1.1.0-SNAPSHOT.
* Artifact coordinates are com.td.clue:clue-code.
* No current official contract file was reverted to 1.0.5-SNAPSHOT.
* No official contract file contains 0.2.0-test-f676277.
* Nexus-generated timestamps or build numbers are not hardcoded in the repository.

Preserve CI.yml from origin/main unless direct evidence proves an authorized correction is required.

6. Classify the endpoint evidence

The current Nexus banner states that the cutover from:

repo.td.com

to:

rp.td.com

has completed and that EDP pipelines now upload artifacts to rp.td.com.

Classify every endpoint conclusion as one of:

* HISTORICALLY_CONFIGURED
* HISTORICALLY_PROVEN_FOR_UPLOAD
* CURRENTLY_CONFIGURED
* CURRENTLY_PROVEN_FOR_DOWNLOAD
* UNRESOLVED

If historical CI used rp.td.com while historical or current CD.yml uses repo.td.com, report this as an upload/download endpoint mismatch.

Do not silently treat the two hostnames as aliases. Alias behaviour must be proven through configuration, redirect evidence, or an authorized platform source.

Do not modify CI.yml, CD.yml, or any POM during this audit.

7. Safely validate the configured download URL

If the environment already has authorized Nexus read access, validate the exact current CD.yml URL without changing it.

1. Attempt a HEAD request or equivalent metadata request.
2. If HEAD is unsupported, perform a controlled GET without displaying binary content.
3. Record:
    * Requested URL
    * Final URL after redirects
    * HTTP status
    * Redirect chain
    * Content length
    * Content type
    * Checksum header, if supplied
4. Do not display credentials, cookies, tokens, or authorization headers.
5. Do not manually upload or replace any artifact.
6. Do not weaken TLS validation.

Test the exact configured URL first. Do not silently substitute a different hostname.

If the configured URL fails but the equivalent rp.td.com URL succeeds, report both results and stop for authorization before editing CD.yml.

If Nexus access is unavailable, record the validation as UNRESOLVED; do not claim failure or success.

8. Confirm the publication trigger before opening a PR

Inspect the repository workflow in read-only mode and determine whether:

* A branch push triggers anything.
* Opening a normal or Draft PR triggers XLR.
* The XLR process performs build/publish only or may continue into DEV deployment.
* A documented build-only control exists.

Repository evidence may prove the GitHub trigger but may not reveal downstream XLR behaviour. Clearly separate documented facts from unresolved platform behaviour.

Do not open a PR until the trigger boundary is known and separately authorized.

9. Final report

End with exactly one of:

VERSION_AND_ENDPOINT_CONTRACT_PASS

or:

VERSION_AND_ENDPOINT_CONTRACT_BLOCKED

PASS requires:

* Version alignment at 1.1.0-SNAPSHOT.
* Correct coordinates for com.td.clue:clue-code.
* Historical and current endpoints reported separately.
* CI upload evidence and CD download evidence not conflated.
* Exact current download URL proven reachable, or the platform-owned resolution mechanism documented with evidence.
* PR/XLR trigger boundary understood.
* No unauthorized file modification.

If blocked, report:

* Exact unresolved item
* Evidence already collected
* Smallest required decision
* Responsible team or system owner, without naming individuals unless technically necessary

Stop after producing the report.

Do not commit, push, open a PR, trigger CI/XLR, publish, deploy, promote, change a version, or change an endpoint.
