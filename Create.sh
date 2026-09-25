python3.12 --version

python3.12 -c 'import venv, ensurepip; print("venv/ensurepip: OK")'

printf 'wheel count: '
find /opt/clue/pr19-c70b121f -type f -name '*.whl' | wc -l
