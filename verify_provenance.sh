#!/usr/bin/env bash
# Checks that every file of the pre-registration record (rca-benchmark-study at
# the commit in SOURCE_COMMIT) is present here and byte-identical, apart from
# the changes listed in PROVENANCE.md.
#
# usage (from this repository's root, on a clean checkout):
#   git clone https://github.com/saadhussain07/rca-benchmark-study ../rca-benchmark-study
#   bash verify_provenance.sh ../rca-benchmark-study
set -euo pipefail
[ $# -eq 1 ] || { sed -n 6,8p "$0"; exit 2; }
HERE=$(pwd)
SRC=$(cat SOURCE_COMMIT)
TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT
git -C "$1" archive "$SRC" | tar -x -C "$TMP"
find "$TMP" -name __pycache__ -type d -prune -exec rm -rf {} +
find "$TMP" -name '*.pyc' -delete
rm -f "$TMP/README.md"
cd "$TMP"
n=0; bad=0
while IFS= read -r -d '' f; do
  n=$((n+1))
  if [ ! -f "$HERE/$f" ]; then echo "MISSING:  $f"; bad=$((bad+1))
  elif ! cmp -s "$f" "$HERE/$f"; then echo "DIFFERS:  $f"; bad=$((bad+1)); fi
done < <(find . -type f -print0)
echo "$n record files checked against rca-benchmark-study@${SRC:0:7}: $((n-bad)) identical, $bad not"
[ $bad -eq 0 ]
