date -u '+%Y-%m-%dT%H:%M:%SZ'
hostname -f
id
ls -ld /etc/certs/
ls -l /etc/certs/

curl -q --silent --show-error --head \
  --connect-timeout 10 --max-time 20 \
  --output /dev/null \
  --write-out 'http_code=%{http_code} http_connect=%{http_connect} ssl_verify_result=%{ssl_verify_result}\n' \
  'https://penhubpat.td.com/aws/services/AwsService'

clue_probe_rc=$?
printf 'curl_exit=%s\n' "$clue_probe_rc"
