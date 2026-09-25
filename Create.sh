ROOT=/opt/clue/pr19-c70b121f
WRAPPER="$ROOT/deploy/clue_with_runtime_secrets.sh"
INTEGRATION="$ROOT/deploy/clue_dev_integration.sh"

bash -n "$WRAPPER" &&
echo "WRAPPER_SYNTAX_OK"

echo "=== WRAPPER INVOCATION AND HKV CONTRACT ==="
nl -ba "$WRAPPER" |
sed -n '1,100p;145,205p;215,290p'

echo "=== INTEGRATION REQUIRED VARIABLES ==="
nl -ba "$INTEGRATION" |
sed -n '35,75p'
