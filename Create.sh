ROOT=/opt/clue/pr19-c70b121f

printf '\n=== CONFIG AND DEPLOY FILES ===\n'
find "$ROOT/config" "$ROOT/deploy" \
  -maxdepth 3 -type f -print 2>/dev/null | sort

printf '\n=== TLS / ENV / INPUT CONTRACT ===\n'
grep -RInE \
  'TLS|mTLS|CLUE_[A-Z0-9_]+|client.?cert|private.?key|CA.?bundle|\.env|one.?row|test.?input|\.pem|\.p12|\.jks' \
  "$ROOT/config" "$ROOT/deploy" "$ROOT/docs" "$ROOT/src" \
  2>/dev/null | sed -n '1,250p'

printf '\n=== CREDENTIAL CANDIDATES: METADATA ONLY ===\n'
find "$HOME" -maxdepth 5 -type f \
  \( -iname '*.pem' -o -iname '*.crt' -o -iname '*.cer' \
     -o -iname '*.key' -o -iname '*.p12' -o -iname '*.pfx' \
     -o -iname '*.jks' \) \
  -printf '%m %u %g %s %p\n' 2>/dev/null | sort
