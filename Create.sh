WHEELHOUSE=/opt/clue/pr19-wheelhouse-c70b121f
TOOLS_PART="${WHEELHOUSE}.tools-part"

if cmp -s \
  "$TOOLS_PART/packaging-26.3-py3-none-any.whl" \
  "$WHEELHOUSE/packaging-26.3-py3-none-any.whl"
then
  echo "OK: duplicate is identical"
  rm -- "$TOOLS_PART/packaging-26.3-py3-none-any.whl" &&
  rmdir "$TOOLS_PART" &&
  printf 'WHEEL_COUNT=' &&
  find "$WHEELHOUSE" -maxdepth 1 -type f -name '*.whl' | wc -l &&
  find "$WHEELHOUSE" -maxdepth 1 -type f -name '*.whl' \
    -printf '%f\n' | sort
else
  echo "STOP: duplicate verification failed"
fi
