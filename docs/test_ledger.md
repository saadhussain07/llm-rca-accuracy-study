# Ledger of hypothesis tests

Every hypothesis test of the study, with the stage that fixed it. `p` is the cluster sign-flip permutation p (Monte Carlo, floor 0.0001); `p Holm` is the pre-registered within-family Holm adjustment; `p BH (all)` is a Benjamini–Hochberg adjustment over all 53 tests, reported as a sensitivity analysis (paper, Appendix A). Equivalence and non-inferiority tests (RQ4, H5b), judged by their confidence bounds, are not listed. Sources: `out/re2/results.md`, `out/re3/amendment3.md`, `out/re3/amendment5.md` … `amendment8.md`.

| Family | Test | Difference | p | p Holm | p BH (all) | Verdict |
|---|---|---|---|---|---|---|
| RE2 RQ1/RQ2 (confirmatory) | model - LR (same features) | -0.185 | 0.0001 | 0.0013 | 0.0003 | model behind |
| RE2 RQ1/RQ2 (confirmatory) | model - detector count | -0.156 | 0.0001 | 0.0013 | 0.0003 | model behind |
| RE2 RQ1/RQ2 (confirmatory) | model - first affected | +0.033 | 0.4804 | 1.0000 | 0.5092 | n.s. |
| RE2 RQ1/RQ2 (confirmatory) | model - SimpleRCA-style | -0.370 | 0.0001 | 0.0013 | 0.0003 | model behind |
| RE2 RQ1/RQ2 (confirmatory) | model - largest anomaly | +0.248 | 0.0001 | 0.0013 | 0.0003 | model ahead |
| RE2 RQ1/RQ2 (confirmatory) | model - N-Sigma | -0.359 | 0.0001 | 0.0013 | 0.0003 | model behind |
| RE2 RQ1/RQ2 (confirmatory) | model - BARO | +0.148 | 0.0089 | 0.0445 | 0.0157 | model ahead |
| RE2 RQ1/RQ2 (confirmatory) | model - CIRCA | -0.048 | 0.4592 | 1.0000 | 0.4967 | n.s. |
| RE2 RQ1/RQ2 (confirmatory) | model - eps-Diagnosis | +0.378 | 0.0001 | 0.0013 | 0.0003 | model ahead |
| RE2 RQ1/RQ2 (confirmatory) | model - MicroCause | +0.370 | 0.0001 | 0.0013 | 0.0003 | model ahead |
| RE2 RQ1/RQ2 (confirmatory) | model - MM N-Sigma | -0.363 | 0.0001 | 0.0013 | 0.0003 | model behind |
| RE2 RQ1/RQ2 (confirmatory) | model - MM BARO | +0.133 | 0.0153 | 0.0612 | 0.0246 | n.s. |
| RE2 RQ1/RQ2 (confirmatory) | model - MM CIRCA | +0.048 | 0.4222 | 1.0000 | 0.4662 | n.s. |
| RE2 P3a (NOTE removal changes answers) | gpt-oss-120b | +0.100 | 0.2365 | 0.4730 | 0.2785 | n.s. |
| RE2 P3a (NOTE removal changes answers) | gpt-oss-20b | -0.020 | 1.0000 | 1.0000 | 1.0000 | n.s. |
| RE2 P3a (NOTE removal changes answers) | qwen3.8-27b | +0.140 | 0.0177 | 0.0531 | 0.0276 | n.s. |
| RE2 P3b (decoy named first) | gpt-oss-120b | +0.302 | 0.0001 | 0.0003 | 0.0003 | supported |
| RE2 P3b (decoy named first) | gpt-oss-20b | +0.376 | 0.0001 | 0.0003 | 0.0003 | supported |
| RE2 P3b (decoy named first) | qwen3.8-27b | +0.176 | 0.0001 | 0.0003 | 0.0003 | supported |
| RE2 decoy vs placebo | gpt-oss-120b | +0.269 | 0.0001 | 0.0001 | 0.0003 | supported |
| RE2 P3c (agreement) | NOTE cases | -0.020 | 1.0000 | 1.0000 | 1.0000 | n.s. |
| RE3 replication RQ1/RQ2 | model - LR (same features) | +0.178 | 0.1593 | 0.3186 | 0.2111 | n.s. |
| RE3 replication RQ1/RQ2 | model - detector count | +0.222 | 0.0353 | 0.1412 | 0.0520 | n.s. |
| RE3 replication RQ1/RQ2 | model - first affected | +0.333 | 0.0037 | 0.0222 | 0.0070 | model ahead |
| RE3 replication RQ1/RQ2 | model - SimpleRCA-style | -0.233 | 0.0105 | 0.0525 | 0.0180 | n.s. |
| RE3 replication RQ1/RQ2 | model - largest anomaly | +0.367 | 0.0029 | 0.0203 | 0.0057 | model ahead |
| RE3 replication RQ1/RQ2 | model - N-Sigma | -0.133 | 0.0945 | 0.2835 | 0.1284 | n.s. |
| RE3 replication RQ1/RQ2 | model - BARO | +0.344 | 0.0023 | 0.0184 | 0.0049 | model ahead |
| RE3 replication RQ1/RQ2 | model - CIRCA | +0.156 | 0.2243 | 0.3186 | 0.2702 | n.s. |
| RE3 replication RQ1/RQ2 | model - eps-Diagnosis | +0.578 | 0.0001 | 0.0013 | 0.0003 | model ahead |
| RE3 replication RQ1/RQ2 | model - MicroCause | +0.389 | 0.0005 | 0.0045 | 0.0012 | model ahead |
| RE3 replication RQ1/RQ2 | model - MM N-Sigma | +0.522 | 0.0001 | 0.0013 | 0.0003 | model ahead (chance-scored) |
| RE3 replication RQ1/RQ2 | model - MM BARO | +0.522 | 0.0001 | 0.0013 | 0.0003 | model ahead (chance-scored) |
| RE3 replication RQ1/RQ2 | model - MM CIRCA | +0.522 | 0.0001 | 0.0013 | 0.0003 | model ahead (chance-scored) |
| RE3 P2 (classifier trained on RE2) | LR(RE2-trained) - model | -0.133 | 0.2693 | 0.2693 | 0.3103 | inconclusive |
| RE3 P3b (decoy named first) | gpt-oss-120b | +0.141 | 0.0411 | 0.0411 | 0.0589 | supported |
| RE3 P3b (decoy named first) | gpt-oss-20b | +0.295 | 0.0002 | 0.0006 | 0.0005 | supported |
| RE3 P3b (decoy named first) | qwen3.8-27b | +0.115 | 0.0144 | 0.0288 | 0.0238 | supported |
| RE3 decoy vs placebo | gpt-oss-120b | +0.128 | 0.0495 | 0.0495 | 0.0690 | supported |
| H5 (RE3 re-tests) | H5a log-alarm filter, DiD | +0.056 | 0.3788 | 0.3788 | 0.4272 | not supported |
| H5 (RE3 re-tests) | H5c-1 N-Sigma loses more at +120 s | +0.433 | 0.0001 | 0.0003 | 0.0003 | supported |
| H5 (RE3 re-tests) | H5c-2 SimpleRCA-style loses more | +0.356 | 0.0001 | 0.0003 | 0.0003 | supported |
| H6 (text ablation) | H6a RE3 annotated - nolog | +0.244 | 0.0052 | 0.0156 | 0.0095 | supported |
| H6 (text ablation) | H6b RE3 minus RE2 | +0.230 | 0.0012 | 0.0048 | 0.0026 | supported |
| H6 (text ablation) | H6c-1 permuted - anon_full | +0.011 | 1.0000 | 1.0000 | 1.0000 | not supported |
| H6 (text ablation) | H6c-2 annotated - permuted | +0.200 | 0.0247 | 0.0494 | 0.0374 | supported |
| H7 (generic pipeline) | H7a decoy first | +0.586 | 0.0001 | 0.0004 | 0.0003 | supported |
| H7 (generic pipeline) | H7b RE3 g_full - g_nolog | +0.067 | 0.1836 | 0.5288 | 0.2263 | not supported |
| H7 (generic pipeline) | H7c RE3 minus RE2 | +0.059 | 0.1763 | 0.5288 | 0.2263 | not supported |
| H7 (generic pipeline) | H7d summary_count - g_full | -0.044 | 0.1831 | 0.5288 | 0.2263 | not supported |
| H8 (evidence vs prompt) | H8a evidence effect | +0.296 | 0.0001 | 0.0003 | 0.0003 | supported |
| H8 (evidence vs prompt) | H8b prompt effect | +0.051 | 0.0028 | 0.0028 | 0.0057 | supported |
| H8 (evidence vs prompt) | H8c onset +120 s | +0.583 | 0.0001 | 0.0003 | 0.0003 | supported |
