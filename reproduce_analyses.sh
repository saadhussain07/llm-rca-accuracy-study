#!/usr/bin/env bash
# Re-runs every analysis of the paper from the stored model responses and
# rankings in out/. It makes no model call, needs no API key, and does not
# download the benchmark. It overwrites the analysis files in out/; on a git
# checkout it then lists which of them changed.
#
# usage (repository root, Python environment active, see README):
#   RCAEVAL=/path/to/RCAEval bash reproduce_analyses.sh
# RCAEVAL is the RCAEval checkout at commit 259ea41 (needed on PYTHONPATH by
# some scripts). Takes a few minutes; the bootstrap and permutation tests
# dominate.
set -u
cd "$(dirname "$0")"
export PYTHONHASHSEED=0 PYTHONUNBUFFERED=1
if [ -n "${RCAEVAL:-}" ]; then export PYTHONPATH="$RCAEVAL:${PYTHONPATH:-}"; fi
if ! command -v python > /dev/null || ! python -c "import numpy, scipy, sklearn, pandas" 2> /dev/null; then
  echo "ERROR: no Python environment with the study's packages is active."
  echo "Activate it first (for example: source ~/rca/env/bin/activate), then rerun."
  exit 2
fi
LOG=out/reproduce.log
: > "$LOG"
ok=0; fail=0; failed=()
step() {
  local name=$1; shift
  printf '%-46s ' "$name"
  if { echo "=== $name: $*"; "$@"; } >> "$LOG" 2>&1; then echo ok; ok=$((ok+1))
  else echo "FAILED (see $LOG)"; fail=$((fail+1)); failed+=("$name"); fi
}
P=out/pilot_re3.txt
step "RE2 confirmatory tests (Tables 5, 6; Fig. 1)" python scripts/06_evaluate.py --ctx out/re2
step "RE3 scores (Table 5, right)"                python scripts/06_evaluate.py --ctx out/re3
step "RE2 exploratory analyses"                     python scripts/10_exploratory.py --ctx out/re2 --ctx-chronic out/re2_chronic
step "RE3 replication (Table 7)"                    python scripts/11_amendment3.py --ctx-re2 out/re2 --ctx-re3 out/re3 --pilot $P
step "RE3 transfer classifier"                      python scripts/12_transfer_classifier.py --train-ctx out/re2 --test-ctx out/re3
step "Onset shifts, variants (Table 8, Fig. 2)"     python scripts/14_amendment4.py --ctx-re2 out/re2 --ctx-re3 out/re3 --shifts -120 120
step "Amendment 5 (Table 9)"                        python scripts/15_amendment5.py --ctx out/re3 --pilot $P
step "Review numbers (Table 3, sensitivity)"        python scripts/16_review_numbers.py --out out --pilot $P
step "Amendment 6 (Tables 10, 11)"                  python scripts/17_amendment6.py --out out --pilot $P
step "Amendment 7 (Tables 12, 13)"                  python scripts/20_amendment7.py --out out --m7 qwen3.8-27b --pilot $P
step "Amendment 8 (Tables 14, 15)"                  python scripts/22_amendment8.py --out out --pilot $P
echo
echo "$ok steps ran, $fail failed${failed:+: ${failed[*]}}"
if [ $ok -gt 0 ] && git rev-parse --git-dir > /dev/null 2>&1; then
  changed=$(git status --porcelain -- out | grep '^ M' | awk '{print $2}' || true)
  if [ -z "$changed" ]; then
    echo "every analysis output in out/ is byte-identical to the stored one"
  else
    echo "outputs whose bytes differ from the stored ones: checking every stored value"
    # The stored results.* of 06_evaluate.py were written before Amendments 6-8;
    # rerun now, they also score the response files those amendments added.
    python tools/compare_outputs.py $changed || fail=$((fail+1))
  fi
fi
[ $fail -eq 0 ]
