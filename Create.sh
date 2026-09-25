WHEELHOUSE=/opt/clue/pr19-wheelhouse-c70b121f
TOOLS_PART="${WHEELHOUSE}.tools-part"
DUP="$TOOLS_PART/packaging-26.3-py3-none-any.whl"
ORIGINAL="$WHEELHOUSE/packaging-26.3-py3-none-any.whl"

if [ ! -f "$DUP" ] || [ ! -f "$ORIGINAL" ]; then
  echo "STOP: expected packaging files were not found"
elif cmp -s "$DUP" "$ORIGINAL"; then
  echo "OK: duplicate packaging wheel is byte-identical"
  rm -- "$DUP" &&
  rmdir "$TOOLS_PART" &&
  printf 'WHEEL_COUNT=' &&
  find "$WHEELHOUSE" -maxdepth 1 -type f -name '*.whl' | wc -l &&
  find "$WHEELHOUSE" -maxdepth 1 -type f -name '*.whl' \
    -printf '%f\n' | sort
else
  echo "STOP: packaging wheels differ"
  sha256sum "$ORIGINAL" "$DUP"
fi
