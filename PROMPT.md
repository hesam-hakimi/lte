Hi Siva, I checked our previous setup report. These PEM files were already available on my laptop and were copied to DEV:

* clue.dev.td.com.chain.pem
* clue.dev..com.key.pem — encrypted private key
* clue.dev..com.ca-bundle.pem

That explains why the Python setup asks for PEM even though we also have the JKS. If you only have the JKS and password, we need to check the project’s certificate preparation steps.

Could you send me the exact error or configuration setting asking for PEM? Please don’t include passwords or private-key contents.
