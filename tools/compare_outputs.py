"""Compare analysis outputs in out/ with the versions stored in git HEAD.

JSON files are compared value by value: every entry of the stored file must be
present and equal in the new one (new entries are allowed and listed). Markdown
files are compared line by line: every stored line must still be present.
Floats are compared with a relative tolerance of 1e-12.

usage (repository root): python tools/compare_outputs.py out/re2/results.json out/re3/results.md ...
"""
import json
import math
import subprocess
import sys


def stored(path):
    return subprocess.run(["git", "show", f"HEAD:{path}"], capture_output=True, text=True, check=True).stdout


def walk(old, new, key, changed, added):
    if isinstance(old, dict) and isinstance(new, dict):
        for k in old:
            if k not in new:
                changed.append(f"{key}/{k}: missing in new")
            else:
                walk(old[k], new[k], f"{key}/{k}", changed, added)
        added.extend(f"{key}/{k}" for k in new if k not in old)
    elif isinstance(old, list) and isinstance(new, list) and len(old) == len(new):
        for i, (a, b) in enumerate(zip(old, new)):
            walk(a, b, f"{key}[{i}]", changed, added)
    elif isinstance(old, float) and isinstance(new, (int, float)):
        if not math.isclose(old, new, rel_tol=1e-12, abs_tol=1e-15):
            changed.append(f"{key}: {old} -> {new}")
    elif old != new:
        changed.append(f"{key}: {str(old)[:60]} -> {str(new)[:60]}")


def main():
    bad = 0
    for p in sys.argv[1:]:
        old_txt, new_txt = stored(p), open(p, encoding="utf-8").read()
        if p.endswith(".json"):
            changed, added = [], []
            walk(json.loads(old_txt), json.loads(new_txt), "", changed, added)
            top = sorted({a.split("/")[1] for a in added if a.count("/") == 1})
            print(f"{p}: {len(changed)} stored values changed; new top-level entries: {', '.join(top) or 'none'}"
                  + (f"; {len(added) - len(top)} new nested entries" if len(added) > len(top) else ""))
        else:
            new_lines = set(new_txt.splitlines())
            changed = [l for l in old_txt.splitlines() if l not in new_lines]
            n_add = len([l for l in new_txt.splitlines() if l not in set(old_txt.splitlines())])
            print(f"{p}: {len(changed)} stored lines not reproduced; {n_add} new lines")
        for c in changed[:25]:
            print("   ", c)
        bad += len(changed)
    print("ALL STORED VALUES REPRODUCED" if bad == 0 else f"{bad} stored values/lines differ")
    return 1 if bad else 0


if __name__ == "__main__":
    sys.exit(main())
