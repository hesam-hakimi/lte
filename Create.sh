CLUE_TEST_ROOT=/opt/clue/pr19-c70b121f

if [ -e "$CLUE_TEST_ROOT" ]; then
  echo "STOP: $CLUE_TEST_ROOT already exists"
else
  umask 077
  mkdir -m 700 "$CLUE_TEST_ROOT" &&
  tar -xzf /opt/clue/clue-code-1.0.5-SNAPSHOT.tar.gz \
    -C "$CLUE_TEST_ROOT" \
    --no-same-owner --no-same-permissions &&
  test -f "$CLUE_TEST_ROOT/pyproject.toml" &&
  test -f "$CLUE_TEST_ROOT/deploy/clue_dev_run.sh" &&
  echo "OK: extracted safely to $CLUE_TEST_ROOT"
fi
