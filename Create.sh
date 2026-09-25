ROOT=/opt/clue/pr19-c70b121f
W=/opt/clue/pr19-wheelhouse-c70b121f
VENV="$ROOT/.venv"

if [ ! -f "$ROOT/pyproject.toml" ] || \
   [ ! -f "$ROOT/deploy/clue_dev_run.sh" ]; then
    echo "STOP: extracted source tree is incomplete"
elif [ ! -f "$W/SHA256SUMS" ]; then
    echo "STOP: wheelhouse manifest is missing"
elif [ -e "$VENV" ]; then
    echo "STOP: test venv already exists: $VENV"
elif ! (cd "$W" && sha256sum -c SHA256SUMS >/dev/null); then
    echo "STOP: wheelhouse verification failed"
else
    umask 077
    python3.12 -m venv "$VENV" &&
    "$VENV/bin/python" --version &&
    "$VENV/bin/python" -m pip --version &&
    echo "TEST_VENV_CREATED_OK"
fi
