ROOT=/opt/clue/pr19-c70b121f
WRAPPER="$ROOT/deploy/clue_with_runtime_secrets.sh"

echo "=== CURRENT EXECUTION IDENTITY ==="
id

echo
echo "=== REQUIRED COMMANDS ==="
for cmd in sudo salt-call jq openssl mktemp shred; do
    if command -v "$cmd" >/dev/null 2>&1; then
        printf '%-12s FOUND %s\n' "$cmd" "$(command -v "$cmd")"
    else
        printf '%-12s MISSING\n' "$cmd"
    fi
done

echo
echo "=== SECRET FETCH IMPLEMENTATION — SOURCE ONLY ==="
nl -ba "$WRAPPER" | sed -n '100,145p'

echo
echo "=== NON-INTERACTIVE SUDO POLICY — NO SECRET RETRIEVAL ==="
set +e
sudo -n -l 2>&1 | sed -n '1,200p'
SUDO_STATUS=${PIPESTATUS[0]}
set -e

echo "SUDO_POLICY_EXIT_CODE=$SUDO_STATUS"
