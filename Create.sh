NAS_FQDN='<FQDN_FROM_WINDOWS>'

getent hosts "$NAS_FQDN"

timeout 5 bash -c ">/dev/tcp/$NAS_FQDN/445" \
  && echo "PASS: SMB port 445 is reachable" \
  || echo "FAIL: SMB port 445 is not reachable"
