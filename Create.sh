NAS_HOST='Nasoc01sdprs01'
NAS_SHARE='c01171_share_s_02'

getent hosts "$NAS_HOST"

timeout 5 bash -c ">/dev/tcp/$NAS_HOST/445" \
  && echo "PASS: SMB port 445 is reachable" \
  || echo "FAIL: SMB port 445 is not reachable"

command -v smbclient || echo "smbclient is not installed"

klist
