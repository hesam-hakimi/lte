set +x
set +e

sudo salt-call pillar.get "secrets:tungsten_primarykey" \
  --out=json 2>/tmp/clue-salt-error.$$ |
jq -r '
  if (.local | type) == "string" and (.local | length) > 0
  then "TUNGSTEN_PRIMARYKEY_PRESENT"
  else "TUNGSTEN_PRIMARYKEY_MISSING_OR_INVALID"
  end
'

SALT_STATUS=${PIPESTATUS[0]}
JQ_STATUS=${PIPESTATUS[1]}

echo "SALT_EXIT_CODE=$SALT_STATUS"
echo "JQ_EXIT_CODE=$JQ_STATUS"

if [ "$SALT_STATUS" -ne 0 ]; then
    sed -n '1,40p' /tmp/clue-salt-error.$$
fi

rm -f /tmp/clue-salt-error.$$
set -e
