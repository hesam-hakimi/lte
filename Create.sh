tar -tzf /opt/clue/clue-0.2.0-test-f676277-deploy.tar.gz \
  | grep -E '\.whl$' \
  | sed 's#^.*/##' \
  | sort -u

printf 'WHEEL_COUNT='
tar -tzf /opt/clue/clue-0.2.0-test-f676277-deploy.tar.gz \
  | grep -Ec '\.whl$'
