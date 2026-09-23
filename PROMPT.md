Proceed with one additional, read-only TLS diagnostic connection to penhubpat.td.com:443 to investigate the server-verification failure.

Reuse tools/symcor_probe.py check_tls after inspecting its implementation and supported options. The objective is to capture the peer’s presented certificate chain, without sending a client certificate, private key, credentials, or any HTTP/SOAP business request.

Requirements:

* Use the same network/proxy route as the failed application request and SNI penhubpat.td.com. Report any route difference; do not silently change proxy, VPN or network settings.
* One connection, a 20-second deadline, no retries.
* Capture public certificate metadata: subject, issuer, SANs, validity dates and SHA-256 fingerprints for each certificate actually presented.
* Report an incomplete chain accurately; do not assume the peer sends its root certificate.
* If the existing helper only captures the leaf, use an already-installed suitable diagnostic tool if available. Do not claim a full-chain capture when only the leaf was obtained.
* Treat any unverified capture strictly as diagnostic evidence. Do not change application verification, install certificates, add trust anchors, or rerun the authenticated request.
* Compare captured fingerprints with existing local trust stores and authoritative references read-only. Do not trust a certificate merely because the peer supplied it.

Assess whether the evidence supports an origin-server chain, corporate TLS inspection, or an unresolved classification. Do not infer permanent inability to use mTLS from this laptop merely from evidence of inspection; the network team must confirm the supported route.

Return the exact command executed, sanitized findings, local evidence paths, and the specific question or approved CA reference needed from the gateway/network owner. Include a short English message I can send them.

The earlier certificate-use confirmation remains recorded; do not reopen that question. Complete this diagnostic without another general approval request.
