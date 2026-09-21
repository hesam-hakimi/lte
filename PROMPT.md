Continue the current CLUE session. Prepare the diagnostic scripts our colleagues can run on the DEV server to determine how certificates and TLS are configured for CLUE.

Create the actual script files and concise execution instructions. All responses, scripts, comments and reports must be in English.

1. Inspect the existing implementation first

Read the current repository instructions, handoff, application configuration loader, provider transport code, and actual CD/deployment/launch files available in this checkout.

Known Windows locations:

* Application: C:\repos\fcrm_clue
* Reference assets: C:\repos\FCRM
* Handoff: C:\repos\fcrm_clue\docs\handoff\clue

Resolve current locations from the workspace if these differ. Reuse existing diagnostic helpers where suitable. Preserve unrelated changes and other active work.

Trace configuration through to its actual consumer. A reference file, example pipeline or Java truststore property is not proof that the Python application uses it. Distinguish intended deployment settings from observed server state.

2. Incorporate these reported DEV observations

Our colleagues have shell access to:
crcluesbdzwnk0.dev.vmc2.td.com

The documented IP is 10.53.154.102.

Their command outputs show:

* /etc/certs was not found on this host.
* /etc/pki and /etc/ssl exist.
* A search under /etc and /opt, limited to depth 4, found:
    /opt/springboot/security/truststore.jks
* Several directories could not be searched because of Permission denied, including /etc/secrets. The search was incomplete.
* Matches under /etc/geoclue belong to the Linux GeoClue location service and are unrelated to CLUE.
* A curl HEAD probe to:
    https://penhubpat.td.com/aws/services/AwsService
    failed with curl error 35 and:
    SSL routines::sslv3 alert handshake failure
* Its output included http_code=000, http_connect=000 and ssl_verify_result=1.
* That curl command did not explicitly specify a client certificate or private key. It was not a test of the supplied CLUE client certificate.

Earlier reference evidence:

* TLSCERT0227647 was reported completed.
* Crypto reportedly shared a certificate file and password.
* A laptop reference artifact was named clue.dev.td.com.jks.
* Its relationship to the discovered springboot truststore is unknown.

Do not infer the root cause from these observations or assume that a missing /etc/certs directory means no certificate is installed.

3. Build a small diagnostic package

Prefer one Bash script and a short README, unless existing project tooling provides a better solution. Use ASCII shell syntax and LF line endings so colleagues can run the file without copying long commands through Teams.

The script should collect:

* UTC timestamp, hostname, executing account and relevant tool versions.
* Targeted certificate/configuration paths, ownership and permissions.
* Safe certificate metadata and keystore entry types where accessible.
* Available evidence of the CLUE launch mechanism, runtime identity and configuration sources.
* Bounded TLS diagnostics using the intended endpoint and network route.
* Per-check results, exit codes and a concise summary of unresolved questions.

Derive application-specific settings from the repository. Parameterize unknown server paths or identities rather than inventing them. Clearly separate a colleague-login probe from a probe using the actual application environment.

Inspect the discovered truststore as a candidate. Do not automatically select it for CLUE. Preserve the distinction between trusted certificate entries, private-key entries and actual application use.

4. Keep execution bounded

Generate the files locally; do not connect to DEV or execute remote probes yourself.

Server checks should leave application files, certificates, permissions and services unchanged. Write diagnostic reports only to a separate output directory with restrictive permissions.

Use existing permissions. Report inaccessible paths and missing tools accurately, and continue independent checks. Avoid broad filesystem scans, automatic privilege escalation, package installation and password guessing.

Keep TLS verification enabled. Preserve any required proxy route. Apply timeouts and avoid repeated identical network attempts.

Do not expose passwords, tokens, private-key contents, full environment dumps or unredacted launch arguments. Do not convert or export private keys. Handle unavailable keystore passwords without hanging unattended execution.

A successful TLS or HTTP check must not be reported as successful Symcor SOAP authentication. Any application-level probe must use an existing documented diagnostic and approved test input; do not invent a SOAP request or run a full processing job.

5. Deliver concrete files

Validate the scripts with appropriate local syntax or safe smoke checks. Report exactly what was checked; do not claim DEV execution.

Return:

* The exact paths of the generated scripts and README.
* One command for colleagues to perform the initial run.
* Any optional follow-up command that depends on confirmed runtime settings.
* The report location and the specific non-secret results they should return.
* Only the questions that remain unanswered after repository inspection.

Do not start a broad architecture review, rerun acceptance suites, deploy, commit, push or create another PR for this task. Complete the diagnostic package using the available evidence.
