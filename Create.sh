ROOT=/opt/clue/pr19-c70b121f
VENV="$ROOT/.venv"
REPORT="$ROOT/dev_test_report_manual_c70b121f.txt"

if [ ! -x "$VENV/bin/python" ]; then
    echo "STOP: test venv is missing"
elif [ -e "$REPORT" ]; then
    echo "STOP: report already exists: $REPORT"
else
    (
        cd "$ROOT" &&
        PYTHONPATH="$ROOT/src" \
            "$VENV/bin/python" -m pytest \
            tests/clue \
            -q \
            -p no:cacheprovider
    ) 2>&1 | tee "$REPORT"

    STATUS=${PIPESTATUS[0]}
    echo "PYTEST_EXIT_CODE=$STATUS"
    echo "REPORT=$REPORT"

    if [ "$STATUS" -eq 0 ]; then
        echo "DOCUMENTED_TEST_COMMAND_PASS"
    else
        echo "DOCUMENTED_TEST_COMMAND_FAIL"
    fi
fi
