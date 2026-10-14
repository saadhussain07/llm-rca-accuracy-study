# Provenance

This repository is a snapshot of the pre-registration record
[`saadhussain07/rca-benchmark-study`](https://github.com/saadhussain07/rca-benchmark-study)
at commit `a428104679d6931234713bad46f1282369743ca1` (also in `SOURCE_COMMIT`), without its history.

## What differs from the record

| Change | Files |
|---|---|
| removed | every `__pycache__/` folder and `*.pyc` file (compiled Python, created when the code runs) |
| replaced | `README.md` (the record's README is kept in the record) |
| added | `PROVENANCE.md`, `SOURCE_COMMIT`, `LICENSE`, `LICENSE-DATA.md`, `CITATION.cff`, `.zenodo.json`, `docs/PAPER_MAP.md`, `reproduce_analyses.sh`, `verify_provenance.sh`, `tools/compare_outputs.py` |

Every other file is byte-identical to the record. `verify_provenance.sh` checks
this file by file.

## What the record adds

The record's history and tags carry the timing evidence for the study:

| Tag | Fixed |
|---|---|
| `protocol-v3-frozen-2` (`939df23`) | protocol, code and constants; set before any RE2 fault window was read |
| `amendment-1` … `amendment-8` | each amendment, committed and tagged before the runs it describes |

The paper (Table 4) lists what had been seen when each tag was set. The tags
were never moved, and the record's history was never rewritten.
