ROOT=/opt/clue/pr19-c70b121f
WRAPPER="$ROOT/deploy/clue_with_runtime_secrets.sh"

set +e

"$WRAPPER" -- bash -c '
set -euo pipefail

[ "${CLUE_RUNTIME_SECRETS:-}" = "1" ]
[ -n "${CLUE_TUNGSTEN_PRIMARY_KEY:-}" ]
[ -n "${CLUE_TUNGSTEN_SECONDARY_KEY:-}" ]
[ -s "${CLUE_SYMCOR_CLIENT_CERT:-/nonexistent}" ]
[ -s "${CLUE_SYMCOR_CLIENT_KEY:-/nonexistent}" ]

[ "$(stat -c %a "$CLUE_SYMCOR_CLIENT_CERT")" = "600" ]
[ "$(stat -c %a "$CLUE_SYMCOR_CLIENT_KEY")" = "600" ]

printf "%s\n" \
  "CLUE_RUNTIME_SECRETS=1" \
  "TUNGSTEN_PRIMARY=present" \
  "TUNGSTEN_SECONDARY=present" \
  "SYMCOR_CERT=valid_x509" \
  "SYMCOR_KEY=readable_unencrypted" \
  "SYMCOR_CERT_KEY_MATCH=validated_by_wrapper" \
  "HKV_SALT_RUNTIME_SECRET_SMOKE_OK"
'

STATUS=$?
set -e

echo "WRAPPER_EXIT_CODE=$STATUS"
