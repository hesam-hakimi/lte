W=/opt/clue/pr19-wheelhouse-c70b121f
T="${W}.tools-part"

if cmp -s "$T/packaging-26.3-py3-none-any.whl" "$W/packaging-26.3-py3-none-any.whl"; then
  rm -- "$T/packaging-26.3-py3-none-any.whl" &&
  rmdir "$T" &&
  printf 'WHEEL_COUNT=' &&
  find "$W" -maxdepth 1 -type f -name '*.whl' | wc -l
else
  echo "STOP: duplicate verification failed"
fi
