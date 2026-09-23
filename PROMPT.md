CLUE Debit search: account representation and operation comparison

Recorded: 2026-09-23.
Status: evidence review and open questions; no implementation change or provider call performed here.
Baseline reference: CLUE-REF-2026-09-23-R2, reconciled with later implementation, blocked-run and manual-search reports received in the current conversation.

New evidence and its limits

The owner supplied photographs of a Teams conversation with Yasim. This is colleague-reported diagnostic evidence, not a newly reviewed provider contract or independently reproduced result.

• The displayed source table contains five Debit rows (Excel rows 2-6). Historical searches returned no documents for accounts 5224077, 5224050, 5224042 and 5224026. Account 5224069 returned one document; its later extraction outcome was extraction_fields_blank.
• The displayed date evidence identifies Processing_Transaction_Date = 2026-07-17 and serialized ProcessingDate bounds 20260717, 20260717 with BW. This supports the mechanical conversion in that historical request. It does not resolve whether the supplied bank processing date is the correct archive capture date under CP-D03.
• Yasim first reported no return using account, transaction date and debit/credit indicator. He then said he added one zero before 5224077 and used awsSearchTransactionRequest for Debit. He wrote that the displayed XML was giving a response.
• The displayed new request uses Account = 05224077, ProcessingDate BW 20260717..20260717, DebitCreditIndicator EQ D, documentFolder ALL1, transactionType POD, hitListFetchLimit 10 and applyFilter false.
• No corresponding response body, document list, limit indicators or selected cheque images were supplied in these screenshots. A reported response alone does not establish successful retrieval of the intended cheque.
• Yasim’s wording about adding zero was based on recollection and explicitly proposed clarification with Symcor. It is not an authoritative universal padding rule.

Why the cause is not isolated

|Dimension          |Historical application path / prior report                                                   |Yasim’s displayed request                    |
|-------------------|---------------------------------------------------------------------------------------------|---------------------------------------------|
|Account            |5224077                                                                                      |05224077                                     |
|Operation          |awsSearchRequest                                                                             |awsSearchTransactionRequest                  |
|Date bounds        |20260717..20260717                                                                           |20260717..20260717                           |
|Hit-list limit     |100 in the reported current application/manual-search profile                                |10                                           |
|Transaction options|Not the transaction-search shape                                                             |POD; applyFilter false                       |
|Debit criterion    |Inspect the actual saved request; do not infer it from a chat description or source direction|Explicit DebitCreditIndicator EQ D           |
|Response evidence  |Historical no matching document for this source                                              |Response reported; native result not supplied|

At least the account representation and operation changed together. The result therefore cannot be attributed to the leading zero alone. Transaction search may return a parent/group with multiple children; those candidates still need their own document indexes and identity checked. In particular, applyFilter false does not establish that every returned child matches the source row.

The previous explanation of Debit search described the implemented path. It must not be interpreted as proof that Symcor forbids transaction search for Debit. The applicable operation and its semantics require the client contract and response evidence.

Controlled comparison to prepare

First reuse available saved requests/responses; do not resend cases whose evidence already answers the question. This table is an investigation design, not a record of four completed calls or authorization to send them.

|Case|Operation                  |Account |Current evidence                                                           |
|----|---------------------------|--------|---------------------------------------------------------------------------|
|A   |awsSearchRequest           |5224077 |Historical zero-document result                                            |
|B   |awsSearchRequest           |05224077|Not supplied                                                               |
|C   |awsSearchTransactionRequest|5224077 |Exact request/response pair not supplied                                   |
|D   |awsSearchTransactionRequest|05224077|Displayed request and colleague report of a response; response body missing|

Use the same client/environment, folder, date bounds, applicable criteria and comparable limits. Preserve each operation’s valid schema; do not insert transaction-only members into a flat search. Check the actual saved flat request before adding or assuming a DebitCreditIndicator criterion. Keep POD/applyFilter consistent between the transaction-search cases.

For each case record: case ID, evidence timestamp, operation, source account, account sent, all criteria/operators, HTTP/SOAP status, provider trace ID, parent/UTI count, child/document count, universalDocID, siteSpecificDocID, returned Account/ProcessingDate/DebitCreditIndicator/ItemSequenceNumber indexes, truncation indicators and evidence-file location. Preserve unknown values explicitly. A total count alone is insufficient to validate a business match.

Identifier correction

Yasim identifies the long Transaction_Details value as a UTI. Do not derive an ISN by taking an arbitrary suffix of that value. A provider-returned UTI identifies transaction scope; it is not an individual cheque identifier. Existing equality observations between source CIF_Number/Transaction_Event_Identifier and archive ItemSequenceNumber remain observations, not an approved mapping.

The current baseline has five Debit sources and one returned document, not six Debit sources. Preserve the distinction between one document returned and successful OCR extraction.

Focused questions for Yasim / the Symcor interface owner

|ID|Question                                                                                                                                                                         |Evidence needed                                                                                                                                                    |
|--|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|D1|What is the authoritative Account representation for these Debit records in ALL1? Is 05224077 canonical, and what explains the historical hit for 5224069 without a leading zero?|Client-specific format rule and archive indexes for the relevant test records; specify whether formatting depends on length, product, folder or archive population.|
|D2|For this client and Debit data, when should awsSearchRequest versus awsSearchTransactionRequest with POD be used, and how should applyFilter affect parent/child results?        |Applicable specification/client supplement or interface-owner confirmation tied to this use case.                                                                  |
|D3|Can we inspect the exact request and response for the successful-looking 05224077 case and any existing comparison cases?                                                        |Native XML, relevant transport status, trace ID, limit indicators, returned DocIDs and document indexes, shared through the existing controlled project location.  |
|D4|Which authoritative source field identifies ItemSequenceNumber for this input, if any?                                                                                           |Explicit source-to-archive mapping. Do not substitute a UTI suffix or infer the mapping from the CIF_Number label.                                                 |

Do not request the whole Symcor contract again; general request/XSD evidence already exists. These questions concern the specific account/operation/item-mapping gaps exposed by the new comparison.

Implementation and integration boundary

Do not add automatic zero-prefix retry, universally pad Debit accounts, or reroute every Debit request on the strength of these screenshots. First isolate the operation/account effect and establish the applicable rule. Any later approved request normalization must retain the original Excel A:W values and record the actual submitted account separately.

Retain the existing live guard, matching behavior and prior deliverables. The latest push/merge prompt is already authorized and its result has not been received in this conversation; these screenshots do not establish that a merge occurred. Keep this new investigation separate from that completed-work integration unless an actual defect or approved change is established.

Supplied evidence

• IMG_70D8F73F-D984-45D1-BF10-829A5E3574E0.jpeg: historical row table, raw source dates/identifiers and initial conversation.
• IMG_042A46DA-35F7-43B1-AE26-19D7D885D4C4.jpeg: zero-prefix statement and awsSearchTransactionRequest example.
• IMG_30B2F47C-CFA9-477F-8958-98128FDC8FE3.jpeg: full displayed request and tentative advice to clarify account formatting with Symcor.

Only the visible supplied photographs and already-read project references were reviewed here. No raw provider response or current application checkout was inspected for this comparison.
