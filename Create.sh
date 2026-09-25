
NEXUS_PYPI='https://rp.td.com/repository/tdu-pypi-group/simple'

for pkg in pytest cryptography; do
  status=$(curl -sS --proto '=https' --tlsv1.2 \
    --cacert /etc/pki/ca-trust/extracted/pem/tls-ca-bundle.pem \
    -o /dev/null -w '%{http_code}' \
    "$NEXUS_PYPI/$pkg/")
  printf '%-15s HTTP %s\n' "$pkg" "$status"
done
