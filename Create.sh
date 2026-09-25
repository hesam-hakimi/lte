DL_VENV=/opt/clue/pr19-downloader-venv-c70b121f
WHEELHOUSE=/opt/clue/pr19-wheelhouse-c70b121f
TOOLS_PART="${WHEELHOUSE}.tools-part"

if [ ! -d "$WHEELHOUSE" ] || [ -e "$TOOLS_PART" ]; then
  echo "STOP: wheelhouse is missing or tools partial directory exists"
else
  mkdir -m 700 "$TOOLS_PART" &&

  env -u PIP_INDEX_URL -u PIP_EXTRA_INDEX_URL \
    PIP_CONFIG_FILE=/dev/null \
    "$DL_VENV/bin/python" -m pip download \
      --no-cache-dir \
      --only-binary=:all: \
      --dest "$TOOLS_PART" \
      --index-url 'https://rp.td.com/repository/tdu-pypi-group/simple' \
      --cert '/etc/pki/ca-trust/extracted/pem/tls-ca-bundle.pem' \
      pip setuptools wheel &&

  find "$TOOLS_PART" -maxdepth 1 -type f -name '*.whl' \
    -exec mv -n -t "$WHEELHOUSE" -- {} + &&
  rmdir "$TOOLS_PART" &&

  printf 'WHEEL_COUNT=' &&
  find "$WHEELHOUSE" -maxdepth 1 -type f -name '*.whl' | wc -l &&
  find "$WHEELHOUSE" -maxdepth 1 -type f -name '*.whl' \
    -printf '%f\n' | sort
fi
