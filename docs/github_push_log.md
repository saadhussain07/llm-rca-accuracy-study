# GitHub push log of the pre-registration record

GitHub's public events API records, with its own server timestamps, every push to
[`saadhussain07/rca-benchmark-study`](https://github.com/saadhussain07/rca-benchmark-study).
GitHub keeps these events for only 90 days, so we retrieved them on 16 October 2026 and archive them here.
The raw response is in `github_events_2026-10-16.json`.

Retrieval (PowerShell):

```powershell
$ev = @(); foreach ($p in 1..3) { $ev += @(Invoke-RestMethod "https://api.github.com/repos/saadhussain07/rca-benchmark-study/events?per_page=100&page=$p") }
$ev | ConvertTo-Json -Depth 10 | Out-File github_events_2026-10-16.json -Encoding utf8
```

## Each stage: when its tagged commit reached GitHub, and when its runs began

Push times come from GitHub's server-side event log. "First run" is the first timestamp
in that stage's run log in `out/`, written by the study machine (UTC).

| Tag | Commit | Pushed to GitHub (UTC) | First run (UTC) | Run log | Gap |
|---|---|---|---|---|---|
| `protocol-v3-frozen` | `c4bc12c` | 2026-10-10 11:31:04 | — | — | — |
| `protocol-v3-frozen-2` | `939df23` | 2026-10-10 11:35:03 | 2026-10-10 12:46:36 | `run_gpt-oss-120b.log` | 71 min |
| `amendment-1` | `d013b19` | 2026-10-10 15:01:02 | 2026-10-10 15:11:38 | `run_exploratory.log` | 11 min |
| `amendment-2` | `2d6bf25` | 2026-10-11 03:04:29 | 2026-10-11 03:08:29 | `run_rcaeval_a2.log` | 4 min |
| `amendment-3` | `a203890` | 2026-10-11 03:41:27 | 2026-10-11 03:41:50 | `run_amendment3.log` | 23 s |
| `amendment-4` | `1e91613` | 2026-10-11 11:21:16 | 2026-10-11 11:22:52 | `run_amendment4_a.log` | 1.6 min |
| `amendment-5` | `9370f7d` | 2026-10-12 03:48:10 | 2026-10-12 03:49:45 | `run_amendment5_a.log` | 1.6 min |
| `amendment-6` | `25748df` | 2026-10-12 14:44:19 | 2026-10-12 14:51:17 | `run_a6.log` | 7 min |
| `amendment-7` | `5feaf54` | 2026-10-12 17:31:44 | 2026-10-12 17:32:26 | `run_a7.log` | 42 s |
| `amendment-8` | `9ff14c9` | 2026-10-13 06:53:31 | 2026-10-13 06:56:29 | `run_a8.log` | 3 min |

## All pushes to `main`

| Pushed (UTC) | Head | Before |
|---|---|---|
| 2026-10-10 11:31:04 | `c4bc12c` | `7fed17b` |
| 2026-10-10 11:35:03 | `939df23` | `c4bc12c` |
| 2026-10-10 15:01:02 | `d013b19` | `939df23` |
| 2026-10-11 03:04:29 | `2d6bf25` | `d013b19` |
| 2026-10-11 03:15:01 | `a616916` | `2d6bf25` |
| 2026-10-11 03:41:27 | `a203890` | `a616916` |
| 2026-10-11 07:18:13 | `3687043` | `a203890` |
| 2026-10-11 11:21:16 | `1e91613` | `3687043` |
| 2026-10-12 03:19:20 | `6aa4512` | `1e91613` |
| 2026-10-12 03:48:10 | `9370f7d` | `6aa4512` |
| 2026-10-12 13:06:48 | `ed1ba3d` | `9370f7d` |
| 2026-10-12 14:27:21 | `1ede03c` | `ed1ba3d` |
| 2026-10-12 14:44:19 | `25748df` | `1ede03c` |
| 2026-10-12 16:59:48 | `c330e82` | `25748df` |
| 2026-10-12 17:31:44 | `5feaf54` | `c330e82` |
| 2026-10-13 06:25:12 | `3d63096` | `5feaf54` |
| 2026-10-13 06:53:31 | `9ff14c9` | `3d63096` |
| 2026-10-13 09:05:22 | `ac4584b` | `9ff14c9` |
| 2026-10-13 09:10:10 | `a428104` | `ac4584b` |

## What this shows, and what it does not

It shows that each stage's commit, with its hypotheses and decision rules, was on GitHub before the
first entry of that stage's run log. The run-log timestamps are written by the study machine, the
repository was private until 14 October 2026, and no third-party registry was used. So the log fixes
the order of commits and runs, but it cannot rule out analyses that left no trace in the repository.
