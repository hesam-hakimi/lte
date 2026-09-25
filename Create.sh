
python3.12 -c 'import json; d=json.load(open("/tmp/clue-nexus-repositories.json")); r=[x for x in d if str(x.get("format","")).lower()=="pypi"]; print("\n".join("{} | type={} | {}".format(x.get("name"),x.get("type"),x.get("url")) for x in r) or "NO_PYPI_REPOSITORY")'
