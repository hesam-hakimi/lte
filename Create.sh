CLUE_OLD_URL='https://rp.td.com/repository/tdu-raw-release/W001CLUE/clue/clue-0.2.0-test-f676277-deploy.tar.gz'
CLUE_OLD_FILE='/opt/clue/clue-0.2.0-test-f676277-deploy.tar.gz'
CLUE_OLD_PART="${CLUE_OLD_FILE}.part"
CLUE_OLD_SHA='1138cb0ec31d565af2a68050929b9c20ea348151b76b35fc0a7c3dfd0658a922'

if [ -e "$CLUE_OLD_FILE" ] || [ -e "$CLUE_OLD_PART" ]; then
  echo "STOP: target or partial file already exists"
else
  curl -fSL \
    --proto '=https' \
    --tlsv1.2 \
    --cacert /etc/pki/ca-trust/extracted/pem/tls-ca-bundle.pem \
    --connect-timeout 20 \
    --max-time 900 \
    --retry 3 \
    --retry-delay 5 \
    -o "$CLUE_OLD_PART" \
    "$CLUE_OLD_URL" &&
  printf '%s  %s\n' "$CLUE_OLD_SHA" "$CLUE_OLD_PART" | sha256sum -c - &&
  mv "$CLUE_OLD_PART" "$CLUE_OLD_FILE" &&
  echo "DOWNLOAD_AND_HASH_OK"
fi
