Review the saved evidence for this exact end-to-end run before making additional service calls.

The workbook displays front/back images, but the eight metadata fields appear blank and several confidence cells show zero. The front image itself has blank payor/payee/address/memo areas, so empty extraction results may be legitimate.

Verify:

1. The displayed images came from the live Symcor response for the selected document.
2. Those same images reached the real Tungsten service and processing completed successfully.
3. For each of the eight output fields, show: raw response key, raw value, raw confidence, parsed value/confidence, and exported Excel cells.
4. Identify whether every zero was returned by Tungsten or introduced by parsing/export defaults. Distinguish missing, null, explicit zero, and processing failure.
5. Check these representations against the accepted response and workbook contracts.

Do not populate blank fields merely to make the output look complete.

Conclude separately whether the live pipeline completed correctly, whether export preserved the provider response, and which OCR fields this mostly blank test cheque can actually validate.
