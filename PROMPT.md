For all_txions_20260922165027.xlsx, could you confirm whether each MON_INSTRUMENTS row represents an individual cheque or the entire POD transaction?

Our offline review found that account, processing date and credit/debit direction leave multiple matching documents for 10 of the 11 Credit rows. Amount is also insufficient because some rows share the same amount.

If each row represents one cheque, which source field authoritatively links it to Symcor’s document? In this sample, CIF_Number and Transaction_Event_Identifier both match an archive ItemSequenceNumber, but we have not found documentation confirming that mapping.

Please also confirm the additional scope required to identify the document uniquely: the saved responses contain repeated ISNs across different dates.

Please distinguish any convention specific to this test workbook from the intended production input contract.
