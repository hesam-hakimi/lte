The DEV-to-Symcor test confirmed DNS resolution, TCP connectivity to penhubpat.td.com:443, and successful server certificate chain verification.

The authenticated request remains blocked: /etc/certs/client.crt is readable, but tag5916 cannot read the private key at /etc/certs/client.key. The WSDL request failed during TLS, before receiving an HTTP response.

Could you run a verified GET to https://penhubpat.td.com/aws/services/AwsService?wsdl using the client certificate and matching private key under an authorized account? Please also confirm the intended CLUE runtime account and arrange the required restricted key access for it.

We need this authenticated retest to confirm service access.
