#!/usr/bin/env bash
# 20dc8309: a regional buffer's clock only reaches one clock region, so the
# flops it clocks must be placed there.  Pre-fix the placer lets them follow
# their data pin -- to an LED in the opposite bank -- and the router dies on the
# BUFR output arc.  This case asserts the fix's own contract: every flop clocked
# by the BUFR sits inside the clock region the graph walk found.
#
# Placement-level (--no-route): the BUFR I pin cannot route on this tree's
# chipdb (no I2IOCLK segbits until the prjxray-db bump), so the case reads the
# placed JSON and the region bounds the fix logs.
set -euo pipefail
d="$(dirname "$0")"
# The fix logs the region it derives: "Constrained N sink(s) ... to its clock
# region x0..x1 y0..y1".  Absence of that line means the fix did not run.
line="$(grep -oE 'Constrained [0-9]+ sink\(s\) of BUFR_BUFR .* to its clock region x[0-9]+\.\.[0-9]+ y[0-9]+\.\.[0-9]+' "$d/nextpnr.log" 2>/dev/null | head -1 || true)"
if [ -z "$line" ]; then
    echo "FAIL: no regional clock-sink constraint was applied"
    exit 1
fi
python3 - "$d/top_routed.json" "$line" <<'PY'
import json, re, sys
d = json.load(open(sys.argv[1]))
line = sys.argv[2]
m = re.search(r'x(\d+)\.\.(\d+) y(\d+)\.\.(\d+)', line)
assert m, "unparsable region line: %r" % line
x0, x1, y0, y1 = map(int, m.groups())
cells = d['modules']['top']['cells']
ffs = [(n, c) for n, c in cells.items() if c.get('type') == 'SLICE_FFX']
assert ffs, "no flops placed"

def xy(cell):
    b = cell.get('attributes', {}).get('NEXTPNR_BEL', '')
    mm = re.search(r'X(\d+)Y(\d+)/', b)
    assert mm, "unparsable bel: %r" % b
    return int(mm.group(1)), int(mm.group(2))

bad = [(n, xy(c)) for n, c in ffs if not (x0 <= xy(c)[0] <= x1 and y0 <= xy(c)[1] <= y1)]
assert not bad, "flops outside the clock region: %s" % bad
print("ok: %d flops inside clock region x%d..%d y%d..%d" % (len(ffs), x0, x1, y0, y1))
PY
