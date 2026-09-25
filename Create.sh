W=/opt/clue/pr19-wheelhouse-c70b121f

if [ -e "$W/SHA256SUMS" ]; then
  echo "STOP: SHA256SUMS already exists"
else
  (
    cd "$W" &&
    sha256sum -- *.whl > SHA256SUMS &&
    sha256sum -c SHA256SUMS
  ) &&
  echo "WHEELHOUSE_HASH_VERIFICATION_OK" &&
  sha256sum "$W/SHA256SUMS"
fi
