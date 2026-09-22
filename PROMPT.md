Continue the existing CLUE session. The current priority is a real end-to-end DEV test of ALL supplied Debit and Credit cases. Pause unrelated packaging work.

This is a TEST AND DIAGNOSIS task only. Do not fix application code, change dependencies, rebuild/deploy the application, commit, or merge anything. All responses and artifacts must be in English.

1. Read the actual test data and existing input contract.

The workbook shown is:
C:\repos\fcrm_clue\test_data\Test Data_TDB.xlsx

It contains:

* Debit Items
* Credit Items

Verify the actual filename and sheets from the filesystem. Read the workbook programmatically, not through screenshots, OCR, or manually transcribed values. If the actual inputs are two separate files, use those and record their exact paths.

Inspect the current application’s CSV parser, documented input schema, routing rules, and existing runner before converting anything. Do not assume the workbook columns already match the application input contract.

2. Prepare two complete CSV inputs.

Create debit_items.csv and credit_items.csv in a dedicated run-specific input directory using the actual supported CSV schema.

* Include every populated data row from both sheets, including duplicate-looking rows.
* Preserve identifiers, leading zeros, dates, debit/credit indicators, and decimal amounts.
* Do not invent missing values, pad identifiers without documented rules, or silently replace source values.
* Verify how the application selects Debit versus Credit processing; do not assume a filename selects the route.
* Record source-to-input column mappings and any documented transformations.
* Keep a separate manifest linking every CSV record to its workbook, sheet, and original row number. Do not add unsupported columns to the application input.
* Reconcile source row counts with converted row counts.
* Validate the CSVs using the existing parser without making service calls.

If a row cannot be converted faithfully, record its exact missing or ambiguous field and mark it BLOCKED. Continue preparing other valid rows. Never silently drop a case.

Preserve the original workbook. Keep test data, manifests, captures, and outputs outside Git.

3. Reuse the established Linux DEV application and configuration.

Use the existing connection:
tag5916@crcluesbdzwnk0.dev.vmc2.td.com

Inspect the current deployed revision, interpreter, runner, and private configuration. Reuse the previously successful Python application execution method, Symcor client identity, secret-loading mechanism, and Tungsten configuration.

Keep TLS and hostname verification enabled. Preserve the successful Tungsten CA configuration:
CLUE_TUNGSTEN_CA_BUNDLE=/etc/pki/tls/certs/ca-bundle.crt

Use existing secrets securely without displaying them or requesting them again when already available. Do not alter shared credentials or infrastructure.

Record the actual source revision and Python version. If DEV still runs Python 3.9.25, label the run as diagnostic execution below the declared >=3.10 requirement; do not change or bypass package requirements.

Transfer the prepared inputs into a private run-specific DEV directory and verify integrity. Use separate output, capture, log, and state locations for Debit and Credit so earlier successful runs or deduplication state cannot silently suppress these cases. Do not clear existing shared state.

4. Provide the exact commands, then execute the tests.

Derive commands from the actual installed/deployed CLI and its supported options. Do not invent flags.

Show the exact working directory, input paths, and copy-paste commands for running:

* All Debit input rows.
* All Credit input rows.

Commands must contain no secrets. Execute both runs now using the existing Python application, real Symcor services, and real Tungsten services. Do not stop after producing commands or CSV files.

The objective is the full path:
CSV ingestion → routing → Symcor retrieval → cheque images → Tungsten processing → final application output.

For Credit cases, observe whether the actual application executes the required searchTransaction → getTransactionItems → getDocs sequence. Do not substitute the simpler Debit/search flow, manually fetch images to bypass a failing stage, or implement a separate service client.

Use existing bounded timeouts, polling, and retry behavior. Check for fetch limits or truncation; a limited subset must not be reported as complete retrieval.

5. Cover every case without modifying the application.

A failure in Debit must not prevent testing Credit, or vice versa.

If a batch aborts before processing all rows, preserve its failure evidence. Where supported by the existing runner, prepare isolated input subsets for the unattempted rows and run them separately. Avoid resubmitting cases that already completed successfully.

If a shared prerequisite blocks all remaining cases, record those cases as BLOCKED with the common cause instead of repeatedly making identical failing calls.

Do not patch code, weaken validation, change provider routing, or introduce mocks to obtain a pass. Input conversion and test orchestration helpers are permitted; replacement application logic is not.

6. Verify results and identify failure points.

For each original source row, report:

* Debit/Credit and source sheet/row.
* Input parsing and selected route.
* Symcor operations attempted and observed results.
* Transaction/item/document counts and any retrieval limits.
* Images retrieved and their association with the source case.
* Tungsten submission, completion status, and returned fields.
* Final output generation and provider-to-output fidelity.
* PASS / FAIL / BLOCKED / NOT RUN, elapsed time, first failing stage, and evidence paths.

Use source row references in the summary rather than exposing account numbers or raw customer data. Keep detailed captures private.

Do not infer front/back identity solely from image order. Record whether it is provider-confirmed or based on the existing configured assumption.

Distinguish:

* Technical end-to-end completion.
* Complete retrieval and correct case/image correlation.
* OCR accuracy against known expected values.

A successful exit code alone is insufficient. Empty provider OCR fields do not establish positive OCR accuracy. If expected values are unavailable, mark accuracy NOT EVALUATED.

7. Return a concise test report.

Include:

* Source workbook/sheets and actual row counts.
* Both generated CSV paths and conversion reconciliation.
* Exact DEV launch commands.
* Host/user, revision, Python version, and run timestamps.
* Separate Debit and Credit totals: passed, failed, blocked, not run.
* A result for every source row.
* Output and private evidence paths.
* Observed failure points, separating proven causes from hypotheses.
* Confirmation that application code and deployment were not changed.

Proceed with conversion and real DEV execution. The goal is to establish what works and where the current application fails across all supplied cases, without fixing it during this task.
