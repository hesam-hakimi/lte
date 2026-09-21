Continue from the completed mTLS work. Prepare the evidence needed to resolve the remaining TLS failure, using the existing code and saved reports. Keep this bounded; do not repeat the handshake matrix or the successful test suite.

1. Reconcile the conclusions with the evidence.
    Distinguish:

* Client-certificate transmission verified by the local test server.
* Client identity configured for the live PenHub attempt.
* Any direct evidence that PenHub received that identity.

Identify the existing log or trace supporting each claim. If live certificate transmission is not directly demonstrated, mark it unconfirmed. Do not conclude that all client-side issues are excluded.

2. Review the certificate-verification failure recorded at 15:01:48Z.
    From existing logs, identify the runtime, transport, effective CA bundle, proxy route and verification error details. Compare them with the later reset attempts. Report what explains the difference and what remains unknown. Keep TLS and hostname verification enabled; do not add trust anchors without an authoritative source.
3. Prepare a concise message for the internal PenHub/gateway owner.
    Include the endpoint, exact UTC attempt timestamps, resolved destination IP, known source/egress information, public client-certificate SHA-256 fingerprint and observed errors. Mark unavailable fields explicitly.

Ask the owner to confirm whether the gateway received this certificate, whether its registration and trust configuration are correct for PAT, and what the correlated logs show as the failure reason. Request the expected server certificate chain/CA reference as needed.

Prepare the message only; do not send it. Include only the relevant sanitized evidence files.

4. Reconcile the SOAP configuration separately.
    Search the existing native provider documents, shared examples, configuration and handoff for the assigned clientID and applicable componentName. Record source references and distinguish documented examples from assigned PAT values. Do not invent values or describe them as never supplied solely because they are absent locally.

Return the short gateway message, evidence paths, unresolved client-side findings and any exact configuration question still requiring an owner. Preserve current changes and update the existing local handoff with this qualified status.
