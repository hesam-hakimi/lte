Continue the existing CLUE test from the successful Arm A result.

I confirm that this is a test environment containing synthetic test data and no real cheques. Business/BSA sign-off is not a prerequisite for continuing this technical test. Proceed with the single-document flow below.

1. Reuse the saved Arm A response, the verified production parser, and its single returned universalDocID. Reuse the working PAT endpoint, client identity and explicit CA bundle, keeping certificate and hostname verification enabled.
2. Retrieve this document’s images through the existing CLUE document-retrieval implementation. Validate the returned document association and decode the image payloads. Preserve the provider’s front/back labels when available; report unknown sides explicitly.
3. Process the retrieved images through the existing Tungsten test integration, using its configured authentication and supported response/job handling. Preserve existing technical guards. If a concrete configuration or capability is missing, complete the preceding stages and report the exact missing requirement.
4. Generate a separate Excel output using the established contract: preserve the original worksheets and write results into the existing 41-column result sheet. Keep the source workbook unchanged.

Preserve the distinction between source Account 5224077 and the Arm A request/returned Account 05224077. Do not introduce a general padding rule.

Scope execution to this one candidate. Reuse completed search and parser checks; do not rerun the full batch. Use existing bounded timeout/retry behavior and avoid duplicate OCR submissions.

Report document retrieval, image decoding, OCR completion and Excel generation separately. Do not count empty OCR fields as successful extraction or claim OCR accuracy without expected values.

Save evidence, images and the output workbook locally, provide their paths, and update the handoff with the actual outcome. Keep credentials and raw payloads out of chat.
