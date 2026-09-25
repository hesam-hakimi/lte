DL_VENV=/opt/clue/pr19-downloader-venv-c70b121f

if [ -e "$DL_VENV" ]; then
  echo "STOP: $DL_VENV already exists"
else
  umask 077
  python3.12 -m venv "$DL_VENV" &&
  "$DL_VENV/bin/python" -m pip --version
fi
