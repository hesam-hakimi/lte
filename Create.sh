grep -RInE 'nexus|index-url|extra-index-url|wheel-dir|wheelhouse|\.whl' \
  /opt/clue/pr19-c70b121f/deploy \
  /opt/clue/pr19-c70b121f/docs \
  /opt/clue/pr19-c70b121f/config \
  /opt/clue/pr19-c70b121f/pyproject.toml \
  /opt/clue/pr19-c70b121f/requirements.txt \
  2>/dev/null | head -100
