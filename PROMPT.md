اول باید منشأ خروجی مشخص شود؛ هنوز ثابت نشده که این مقادیر را Tungsten واقعی تولید کرده است. در عکس، تصاویر تقریباً خالی‌اند و خروجی‌ها synthetic: دارند؛ تولید مستقل تصویر و پاسخ ساختگی یک احتمال جدی است.

این پرامپت را در همان سشن Copilot بفرست:

Continue the current CLUE session. Investigate and fix the mismatch between the embedded cheque images and the corresponding Tungsten metadata.

The observed workbook contains images showing mostly a document ID and front/back labels, while metadata contains “synthetic:” values and repeated confidence 93. Treat these as symptoms, not a confirmed diagnosis.

1. Reproduce the output using the existing application command. Identify the effective Symcor and Tungsten provider modes separately: fixtures, local simulator, or real service.
2. Trace two distinct cheques from input row through document identity, image generation/retrieval, conversion, Tungsten request payload, raw response, parsed metadata, and final Excel image anchors and cells. Find exactly where the image content and metadata diverge. Provide code references and execution evidence.
3. Implement the correction after establishing the cause:
    * If synthetic images and responses are generated independently, create coherent fixtures from one deterministic cheque record. Images must visibly contain the fictional field values returned by the simulated response.
    * If images, requests, responses, or workbook rows are associated incorrectly, fix the association using the actual cheque/document identity.
    * Never replace real Tungsten results with expected fixture values or silently fall back to simulated responses.
4. Preserve the accepted workbook contract: original A:W input fields, actual embedded front/back images in X:Y, and the eight metadata/confidence pairs in Z:AO. Preserve leading zeros, missing-image behavior, and multiple-cheque handling.
5. Run the existing application pipeline and regenerate the workbook. Verify both content and row association. Include different cheques sharing the same account/date. Deliberately swap an image or response and confirm that the verification detects the mismatch. Reuse existing helpers and focused tests.
6. Report the confirmed root cause, changes, executed checks, and regenerated workbook path. Report simulated consistency separately from real Tungsten OCR validation. If the real service was not called, explicitly mark real OCR validation NOT RUN.

Complete the diagnosis, implementation, and local verification. Do not stop at a proposed fix. Preserve unrelated changes; do not modify infrastructure or CI/CD, deploy, commit, or push.
