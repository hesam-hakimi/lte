DL_VENV=/opt/clue/pr19-downloader-venv-c70b121f
WHEELHOUSE=/opt/clue/pr19-wheelhouse-c70b121f
WHEELHOUSE_PART="${WHEELHOUSE}.part"

if [ -e "$WHEELHOUSE" ] || [ -e "$WHEELHOUSE_PART" ]; then
  echo "STOP: wheelhouse or partial directory already exists"
else
  mkdir -m 700 "$WHEELHOUSE_PART" &&

  env -u PIP_INDEX_URL -u PIP_EXTRA_INDEX_URL \
    PIP_CONFIG_FILE=/dev/null \
    "$DL_VENV/bin/python" -m pip download \
      --no-cache-dir \
      --only-binary=:all: \
      --dest "$WHEELHOUSE_PART" \
      --index-url 'https://rp.td.com/repository/tdu-pypi-group/simple' \
      --cert '/etc/pki/ca-trust/extracted/pem/tls-ca-bundle.pem' \
      'requests>=2.28.2' \
      'Pillow>=9.4.0' \
      'openpyxl>=3.1.2' \
      'pytest>=7.0' \
      'cryptography' &&

  mv "$WHEELHOUSE_PART" "$WHEELHOUSE" &&
  printf 'WHEEL_COUNT=' &&
  find "$WHEELHOUSE" -maxdepth 1 -type f -name '*.whl' | wc -l &&
  find "$WHEELHOUSE" -maxdepth 1 -type f -name '*.whl' -printf '%f\n' | sort
fi
