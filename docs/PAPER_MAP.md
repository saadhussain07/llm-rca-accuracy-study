# Where each table and figure comes from

Every number in the paper's results was copied from an analysis output under
`out/`. Each output is written by the script listed here, and
`reproduce_analyses.sh` reruns them all.

| Paper | Output file | Script |
|---|---|---|
| Table 1 (live system vs benchmark port) | `PROTOCOL_V3.md` §4, `rcastudy/agent.py`, `rcastudy/context.py` (header comments) | — |
| Table 2 (conditions) | `PROTOCOL_V3.md` §5, Amendments 1, 3, 6, 7, 8 | — |
| Table 3 (Amendment 2 reruns) | `out/re2/results.md` (reruns), `out/review_numbers.md` (first-run sensitivity) | `06_evaluate.py`, `16_review_numbers.py` |
| Table 4 (protocol and amendments) | tags of the record repository; amendment headers | — |
| Table 5 (accuracy, all methods) | `out/re2/results.md`, `out/re3/results.md` | `06_evaluate.py` |
| Fig. 1 (paired AC@1 differences) | `out/re2/results.json` | `06_evaluate.py` |
| Table 6 (decoy NOTEs) | `out/re2/results.md` | `06_evaluate.py` |
| Table 7 (RE3 replication) | `out/re3/amendment3.md` | `11_amendment3.py` |
| Table 8 (SimpleRCA-style variants) | `out/re2/amendment4.md` | `13_simplerca_variants.py` (rankings), `14_amendment4.py` |
| Fig. 2 (onset shifts) | `out/re2/amendment4.md` | `14_amendment4.py` |
| Exploratory analyses (§5.6) | `out/re2/exploratory.md` | `10_exploratory.py` |
| Table 9 (Amendment 5) | `out/re3/amendment5.md` | `15_amendment5.py` |
| Tables 10–11 (Amendment 6) | `out/re3/amendment6.md` | `17_amendment6.py` |
| Tables 12–13 (Amendment 7) | `out/re3/amendment7.md` | `20_amendment7.py` |
| Tables 14–15 (Amendment 8) | `out/re3/amendment8.md` | `22_amendment8.py` |
| Run counts, tokens, retries | `out/*/llm/*.jsonl`, `out/run_*.log` | — |

Rankings used by the analyses:
- `out/<suite>/ranks_nonllm.json`: detector count, pipeline orderings, SimpleRCA-style.
- `ranks_classifiers.json`: same-feature classifiers (`05_classifiers.py`).
- `ranks_rcaeval.json`: RCAEval baselines (`07_collect_rcaeval.py`).
- `out/<suite>/llm/main__<model>__<condition>.jsonl`: model rankings, with prompt hash and raw response per case.
