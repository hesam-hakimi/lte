We have reviewed the available documentation and integration guidance. We would appreciate clarification on these three remaining points:

1. Front and back image identification
    We understand the AvailableSegments values and how Content-ID links SOAP references to attachments. For our TIFF/multipart getDocs response, which documented field or rule identifies each image or TIFF page as the front or back of the cheque? An annotated response example would help confirm the mapping.
2. Retrieving all results when a limit is reached
    We understand the count-only and over-limit outcomes. When a search or item-enumeration response withholds identifiers because a limit has been reached, what supported procedure should we use to retrieve every relevant UTI, item and document? If continuation is unavailable, how should we subdivide the request without losing results, particularly when a single date or transaction exceeds the limit?
3. SOAP timeStamp representation
    The specification defines timeStamp as milliseconds since the Unix epoch, but some examples appear inconsistent with that definition. For our active interface, should we follow the epoch-millisecond definition and treat those examples as illustrative, or is another representation required? Please point us to the applicable rule or an accepted request example.
