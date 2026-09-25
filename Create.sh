ROOT=/opt/clue/pr19-c70b121f
W=/opt/clue/pr19-wheelhouse-c70b121f
VENV="$ROOT/.venv"

if [ ! -x "$VENV/bin/python" ]; then
    echo "STOP: test venv is missing"
elif ! (cd "$W" && sha256sum -c SHA256SUMS >/dev/null); then
    echo "STOP: wheelhouse verification failed"
else
    env -u PIP_INDEX_URL -u PIP_EXTRA_INDEX_URL \
        PIP_CONFIG_FILE=/dev/null \
        "$VENV/bin/python" -m pip install \
        --no-index \
        --find-links "$W" \
        --disable-pip-version-check \
        --upgrade \
        pip==26.2.1 \
        setuptools==84.0.0 \
        wheel==0.48.0 \
        packaging==26.3 &&
    "$VENV/bin/python" -c \
        'from importlib.metadata import version; [print(f"{n}={version(n)}") for n in ("pip","setuptools","wheel","packaging")]' &&
    echo "OFFLINE_TOOLING_INSTALL_OK"
fi
