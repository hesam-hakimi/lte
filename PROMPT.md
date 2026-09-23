Continue from the existing Debit preparation and the successful laptop PAT test. Reuse the prepared artifacts.

First, complete the previously requested offline handoff: preserve existing edits, record the five prepared cases and unresolved inputs, and provide paths to the existing report/CSV and request files. Do not regenerate completed work.

I authorize exactly ONE read-only PAT request for arm A_account_representation:

* Endpoint: https://penhubpat.td.com/aws/services/AwsService
* Operation: awsSearchRequest
* Folder: ALL1
* ProcessingDate: 20260717..20260717
* Account: EQ 05224077
* No ItemSequenceNumber or DebitCreditIndicator criterion.

Inspect the prepared A request offline and confirm these fields before sending. Reuse the existing CLUE transport, delivered combined PEM, and the explicit CA bundle from the successful laptop test. Keep certificate and hostname verification enabled and preserve all existing guards.

Use one attempt, a 20-second timeout, no retries, redirects or separate TLS preflight. Do not run the other arms, full batch or Tungsten.

Report TLS, HTTP and SOAP outcomes separately, including actualSize, sorryFlag presence/value, and whether any returned candidate’s ItemSequenceNumber matches the source value 4850040009. Do not assume actualSize must equal 1.

A zero result does not prove the account representation is invalid; a hit is a candidate until validated against authoritative expectations.

Keep secrets and response contents out of chat. Save native evidence locally, restore temporary settings, and update the handoff with the actual result. No production-code changes, Vault upload, commit or push.
