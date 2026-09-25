W=/opt/clue/pr19-wheelhouse-c70b121f
COUNT=$(find "$W" -maxdepth 1 -type f -name '*.whl' | wc -l)

if [ ! -d "$W" ]; then
    echo "STOP: wheelhouse is missing: $W"
elif [ "$COUNT" -ne 19 ]; then
    echo "STOP: expected 19 wheels, found $COUNT"
elif [ -e "${W}.tools-part" ]; then
    echo "STOP: partial tools directory still exists"
elif [ -e "$W/SHA256SUMS" ]; then
    echo "STOP: SHA256SUMS already exists"
else
    (
        cd "$W" &&
        sha256sum -- *.whl > SHA256SUMS &&
        sha256sum -c SHA256SUMS
    ) &&
    echo "WHEELHOUSE_HASH_VERIFICATION_OK" &&
    sha256sum "$W/SHA256SUMS"
fi
