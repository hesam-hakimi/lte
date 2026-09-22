Before asking Symcor for a getDocs example, thoroughly check whether the existing project documentation already contains the example or field definitions we need.

Continue the current CLUE session. This is a documentation review only. Do not modify application code, configuration, dependencies, deployment, or runtime state. Do not make live service calls or contact anyone. All responses and artifacts must be in English.

Context:

* The diagnosis reported a mismatch between CLUE’s getDocs request and the saved PAT XSD.
* The successful Debit execution obtained images through search with docsFetchLimit=10; it did not validate getDocs.
* Credit remains blocked at getDocs.
* Before requesting additional information from Symcor, we must establish what our existing documents already answer.

1. Locate and inventory the available sources.

Start from the current workspace, previously shown as:
C:\repos\fcrm_clue

Read the documentation index and follow references to the original Symcor guides, specifications, appendices, attachments, sample XML, SOAP/Postman collections, sample client code, and saved WSDL/XSD files.

Inspect relevant document tables, code blocks, embedded attachments, and archives where accessible. Use programmatic text/document extraction; no screenshots, OCR, or vision.

List the actual filenames, versions/dates, and locations reviewed. Identify inaccessible, image-only, or missing referenced documents explicitly.

2. Search for the operation and its field semantics.

Search case-insensitively, including naming variations:

* getDocs / AwsGetDocsRequest
* getDocsWithSuppData
* docIDList / AwsDocID
* siteSpecificDocID / universalDocID
* imageFormat / imageMask
* deliveryMethod / deliveryDetail
* schedulePolicy / schedulePriorityLevel
* synchronous retrieval / delivery / scheduling

Read surrounding sections, footnotes, tables, and cross-references. A search result alone is not sufficient.

Prioritize provider-supplied documentation and samples. Clearly distinguish them from CLUE-generated requests, mocks, tests, and handoff summaries. Our own known-invalid request is not an authoritative example.

3. Determine what is actually documented.

For each required field, find:

* Supported values and their meanings.
* Any documented default.
* Whether empty, nil, omitted, and explicit values are treated differently.
* Applicability to synchronous image retrieval.
* The exact document/page/section or XML location supporting the finding.

Check whether examples match the saved PAT namespace/schema and service version. Distinguish an old or related-operation example from a directly applicable getDocs example.

If getDocsWithSuppData explains shared fields, identify which semantics are explicitly shared; do not assume its entire request can be reused.

Do not invent values or treat an XSD type declaration as proof of the correct operational value.

4. Return a focused evidence report.

Provide:
A. Whether a provider-supplied getDocs example was found, with its exact location.
B. A table:
Field | Documented value/meaning | Source/version/page | PAT applicability | Remaining uncertainty
C. A sanitized excerpt or path to the applicable example.
D. Any conflict between the guide, sample, and saved PAT XSD.
E. Only the specific information still missing after this review.

If no complete example is found but the field definitions are sufficient, state that clearly. A complete example is not automatically required if authoritative documentation already resolves the request.

Do not claim “the documentation has no example” unless the inventory supports that conclusion. Otherwise say “not found in the accessible sources reviewed” and identify the coverage gaps.

Finish by stating whether the existing documentation is sufficient to prepare a corrected request in a later task, or exactly which unresolved question requires Symcor clarification. Preserve the current test-only boundary; do not implement or execute a correction.
