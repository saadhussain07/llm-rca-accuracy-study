# Where does the accuracy of LLM-based root-cause analysis come from?

Replication package for the paper

> M. S. Hussain and A. Farrukh. *Where Does the Accuracy of LLM-Based Root-Cause
> Analysis Come From? An Empirical Study on Microservice Benchmarks.* Submitted to
> Empirical Software Engineering (Springer), 2026.

The study takes one LLM-based root-cause analysis (RCA) agent and splits its accuracy into three parts: its detectors, the interpretive text its pipeline adds, and the model. It runs on RCAEval RE2 (270 cases) and RE3 (90 code-level faults) with three open-weight models. The design was pre-registered before any RE2 fault window was read. Eight dated amendments followed, each committed and tagged before its own runs.

This repository contains everything needed to check the paper:
- the protocol and its amendments;
- all code;
- every prompt hash and raw model response;
- the per-case rankings of every method;
- the analysis outputs from which each table and figure was taken.

## Two repositories

| Repository | Role |
|---|---|
| [`rca-benchmark-study`](https://github.com/saadhussain07/rca-benchmark-study) | **The pre-registration record.** Its full history is kept unchanged. The tags `protocol-v3-frozen-2` and `amendment-1` … `amendment-8` show what was fixed before each run, and when. |
| this repository | **The replication package.** A history-free snapshot of the record at commit `a428104679d6931234713bad46f1282369743ca1`, plus documentation, licences, citation metadata and two scripts. It is the version archived on Zenodo. |

The study files here are byte-identical to the record. [`PROVENANCE.md`](PROVENANCE.md) lists exactly what was added or removed. To check it yourself:

```bash
git clone https://github.com/saadhussain07/rca-benchmark-study ../rca-benchmark-study
bash verify_provenance.sh ../rca-benchmark-study
```

Timing claims (for example, that a hypothesis was fixed before its data were seen) should be checked against the record's tags, not against this repository.

## Reproducing the analyses (no model calls)

This path uses the stored responses and rankings in `out/`. It takes a few minutes and needs no API key and no benchmark download.

```bash
python3.12 -m venv env && source env/bin/activate
git clone https://github.com/phamquiluan/RCAEval.git ../RCAEval
git -C ../RCAEval checkout 259ea4167160256a74ad30004aa3d96a998c846e
pip install -e "../RCAEval[default]" && pip install -r requirements.txt
RCAEVAL=../RCAEval bash reproduce_analyses.sh
```

The script reruns every statistical analysis and writes its outputs into `out/`. It then checks that every value in the stored outputs is reproduced (`tools/compare_outputs.py`).

Rerun today, `06_evaluate.py` and `16_review_numbers.py` also pick up the response files that Amendments 6–8 added to `out/`. Their outputs therefore gain entries for those conditions, and the check allows such additions. It lists every stored value or line that is not reproduced, so each one can be inspected.

**Expected result** (checked on the original machine, 14 October 2026): all 11 steps run, and every stored value in `results.json` and `results.md` is reproduced for both suites. Exactly three stored lines are listed: the `re2/llm`, `re3/llm` and `total` rows of the call-count table in `review_numbers.md`. They were written before Amendment 6, and rerun they also count that amendment's calls, together with Amendment 8's crossed cells. The paper's figure of 6,743 calls "before Amendment 6" is the stored `total` row. `16_review_numbers.py` also quotes three raw RCAEval output files in one illustration. Without RCAEval's `output/kept` folder those quoted lines are missing, and the check lists them. [`docs/PAPER_MAP.md`](docs/PAPER_MAP.md) says which output file each table and figure was taken from.

## Re-running the study (model calls)

[`RUN_GUIDE.md`](RUN_GUIDE.md) gives the full procedure:
- environment;
- RCAEval data download, checked against `data_manifests/`;
- context building;
- model runs;
- RCAEval baselines.

The `scripts/run_*.sh` files are the exact run scripts of the main study and of each amendment. Model runs need a Groq API key in `GROQ_API_KEY`. All runners are resumable.

The models were served by Groq at temperature 0.1; the paper's Models section gives the full settings. Hosted open-weight models change, so a rerun should reproduce the conclusions, not every response. We measured run-to-run variation on byte-identical prompts: the deployed model's top-1 answer changed in 20% of cases, while its AC@1 varied by 0.006 (SD) across three full runs.

## Layout

| Path | Contents |
|---|---|
| `PROTOCOL_V3.md` | the frozen protocol: research questions, hypotheses, decision rules, statistics |
| `PROTOCOL_V3_AMENDMENT_*.md` | Amendments 1–8, each written before its runs |
| `prefreeze_log.md`, `postfreeze_log_append.md`, `*_LOG.md` | execution logs: what was run, when, and what went wrong |
| `original/` | the deployed agent's `context_builder.py` and `runtime_anomaly_agent.py`, byte for byte (hashes in the protocol) |
| `rcastudy/` | the benchmark port: detectors, context builder, prompt, text conditions, generic pipeline, baselines, configuration |
| `scripts/00`–`22` | numbered pipeline: data manifest → contexts → model runs → classifiers → evaluation → amendment analyses |
| `scripts/run_*.sh` | the run scripts as executed |
| `tests/` | synthetic RCAEval-format data and a mock model for end-to-end tests without data or key |
| `data_manifests/` | SHA-256 of every RCAEval file used |
| `out/` | all outputs: contexts, raw responses (`*/llm/*.jsonl`), rankings, analysis reports, run logs |

## Conditions

| Name in files | Paper | What changes |
|---|---|---|
| `annotated` | deployed context | nothing: the agent's context as deployed |
| `stripped` | NOTEs removed | every interpretive `NOTE:` line removed |
| `decoy`, `placebo` | false NOTE, placebo | one NOTE asserting a non-root service; or naming it without a claim |
| `anon`, `anon_full` | anonymised | service names replaced in the structured text, or everywhere |
| `shuffled`, `baseline-aware` | E2, E3 | service order permuted; pre-existing log alarms suppressed |
| `nolog`, `permuted` | Amendment 6 | raw log text removed; real names deranged among candidates |
| `g_full`, `g_nolog`, `g_decoy` | Amendment 7 | generic pipeline; without log examples; with a decoy sentence |
| `x_dsys_guser`, `x_gsys_duser` | Amendment 8 | deployed system prompt + generic user message, and the reverse |
| `*_shift120`, `*_shift-120` | onset shifts | the injection time given to every method moved by ±120 s |

## Licence and citation

- Code (`rcastudy/`, `original/`, `scripts/`, `tests/`): MIT, see [`LICENSE`](LICENSE).
- Protocol, documentation and outputs: CC BY 4.0, see [`LICENSE-DATA.md`](LICENSE-DATA.md).
- RCAEval and its datasets remain under their own licences. The contexts and responses in `out/` are derived from RCAEval cases.

Please cite the paper and this archive. [`CITATION.cff`](CITATION.cff) has the metadata, and the Zenodo DOI is on the record page.

Contact: Muhammad Saad Hussain, muhammadsaadhussain49@gmail.com.
