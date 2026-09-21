Search our internal Confluence for documentation that can help diagnose the CLUE DEV → PenHub PAT TLS failure, especially how to access and interpret the relevant F5 logs.

This is read-only research supporting our pending coordinated DEV test. Use existing authorized Confluence access.

Context:

* Source: crcluesbdzwnk0.dev.vmc2.td.com, reported IP 10.53.154.102.
* Destination: penhubpat.td.com:443.
* Observed error: TLS connection reset by peer.
* Firewall requests NETP0235844 and NETP0235853 were reported completed in Teams; their effective coverage has not been independently verified.
* Client certificate: CN=clue.dev.td.com, issuer TDIssuing01CA_Dev, with clientAuth usage. Receipt and acceptance by the destination remain unconfirmed.
* The shared F5 mapping shows names containing CertWhitelist and Clientcert. It also references penhubsys and a penhubdev virtual server. Do not assume this is incorrect or that F5 caused the reset.

Research:

1. Start with the CLUE/Symcor architecture page in Confluence space EETSARCH, page ID 3944365826, and its relevant linked runbooks.
2. Search across accessible spaces using focused combinations of:
    PenHub, penhubpat.td.com, penhubsys.td.com, penhubdev.td.com, F5, BIG-IP, CertWhitelist, Clientcert, client SSL, mTLS, TLS handshake, connection reset, certificate onboarding, and the firewall ticket IDs.
3. Find documented answers to:
    * Where are TLS, client-certificate and iRule logs collected?
    * How can developers view them, or which support team can review them?
    * What access group or request process is required?
    * How should one DEV connection attempt be correlated using timestamp/timezone, observed source/NAT IP, destination, virtual server and certificate fingerprint?
    * What runbook covers certificate allowlisting, trusted issuer/chain, SNI/profile selection and handshake rejection?
    * Is the relationship between the PAT, SYS and DEV endpoint names documented?
4. Prefer current operational documentation. Identify outdated or conflicting guidance. Distinguish network firewall access from certificate acceptance.

Return:

* A concise table of relevant page titles, direct links, last-updated dates where available, and the specific question each page answers.
* The documented log-access method and responsible support team.
* A short, evidence-based debugging sequence for the coordinated DEV test.
* Remaining unknowns and one concise question for the owner if documentation does not answer them.

Clearly distinguish documented facts from hypotheses. If access is unavailable or a page cannot be read, report that limitation; do not claim no documentation exists.

Do not modify code or infrastructure, run live probes, rerun tests, create tickets or send messages. Do not expose credentials or customer data.
