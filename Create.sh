# STEP: SAFE EXECUTION OF THE BUNDLED DEV PREREQUISITE SCRIPT

ROOT=/opt/clue/pr19-c70b121f
SCRIPT="$ROOT/deploy/clue_dev_prereq.sh"
REPORT="$ROOT/dev_prereq_report_manual_c70b121f.txt"

if [ ! -f "$SCRIPT" ]; then
    echo "STOP: prerequisite script is missing"
elif [ -e "$REPORT" ]; then
    echo "STOP: report already exists: $REPORT"
else
    (
        SAFE_DIR=$(mktemp -d /tmp/clue-prereq.XXXXXXXX) || exit 2
        chmod 700 "$SAFE_DIR"
        trap 'rm -rf -- "$SAFE_DIR"' EXIT

        sed \
            -e "s|/tmp/mtls_run_|$SAFE_DIR/mtls_run_|g" \
            -e "s|/tmp/mtls_one_|$SAFE_DIR/mtls_one_|g" \
            "$SCRIPT" > "$SAFE_DIR/clue_dev_prereq.safe.sh" || exit 2

        bash -n "$SAFE_DIR/clue_dev_prereq.safe.sh" || exit 2
        bash "$SAFE_DIR/clue_dev_prereq.safe.sh" "$ROOT"
    ) 2>&1 | tee "$REPORT"

    STATUS=${PIPESTATUS[0]}
    echo "PREREQ_SCRIPT_EXIT_CODE=$STATUS"
    echo "REPORT=$REPORT"
fi
