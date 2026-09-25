CLUE_TEST_ROOT=/opt/clue/pr19-c70b121f

if command -v python3.12 >/dev/null 2>&1; then
  python3.12 --version
  python3.12 -c 'import venv, ensurepip; print("venv/ensurepip: OK")'
else
  echo "python3.12: MISSING"
fi

if find "$CLUE_TEST_ROOT" -type f -name '*.whl' -print -quit | grep -q .; then
  echo "Wheels found:"
  find "$CLUE_TEST_ROOT" -type f -name '*.whl' -print
else
  echo "Wheels: NONE in package"
fi
