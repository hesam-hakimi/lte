python3.12 - <<'PY'
import os
import subprocess
from urllib.parse import urlsplit

sources = []

for name in ("PIP_INDEX_URL", "PIP_EXTRA_INDEX_URL"):
    value = os.environ.get(name)
    if value:
        sources.append((name, value))

for key in ("global.index-url", "global.extra-index-url"):
    result = subprocess.run(
        ["python3.12", "-m", "pip", "config", "get", key],
        capture_output=True,
        text=True,
    )
    if result.returncode == 0 and result.stdout.strip():
        sources.append((key, result.stdout.strip()))

if not sources:
    print("NO_PIP_INDEX_CONFIGURED")
else:
    for name, value in sources:
        parsed = urlsplit(value if "://" in value else "//" + value)
        print(f"{name}: host={parsed.hostname or 'UNPARSEABLE'}")
PY
