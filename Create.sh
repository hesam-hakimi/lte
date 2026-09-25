# STEP: INSTALL APPLICATION AND TEST DEPENDENCIES

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
        --only-binary=:all: \
        --disable-pip-version-check \
        requests==2.34.2 \
        Pillow==12.3.0 \
        openpyxl==3.1.5 \
        pytest==9.1.1 \
        cryptography==50.0.1 &&
    "$VENV/bin/python" -m pip check &&
    "$VENV/bin/python" -c \
        'from importlib.metadata import version; [print(f"{n}={version(n)}") for n in ("requests","Pillow","openpyxl","pytest","cryptography")]' &&
    echo "OFFLINE_DEPENDENCIES_INSTALL_OK"
fi
