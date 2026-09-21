#!/usr/bin/env bash
# 7c4f00df: a pad-fed BUFR must be placed on the one BUFR_BUFR site its pad's
# I2IOCLK leg can reach, not any free site the placer likes.  The pad's IOB
# tile and that dedicated BUFR site are horizontally adjacent (the HCLK_IOI
# tile sits one column over), so "the BUFR's bel is next to the pad's bel" is
# exactly the reachability this fix buys; a random site elsewhere on the die
# fails it.
#
# Placement-level: the BUFR I pin cannot route on this tree's chipdb (no
# I2IOCLK segbits until the prjxray-db bump), so the case stops after placement
# (--no-route) and reads NEXTPNR_BEL out of the placed JSON.
set -euo pipefail
d="$(dirname "$0")"
python3 - "$d/top_routed.json" <<'PY'
import json, re, sys
d = json.load(open(sys.argv[1]))
cells = d['modules']['top']['cells']

def bel(cell):
    return cell.get('attributes', {}).get('NEXTPNR_BEL', '')

def xy(cell):
    m = re.search(r'X(\d+)Y(\d+)/', bel(cell))
    assert m, "unparsable bel: %r" % bel(cell)
    return int(m.group(1)), int(m.group(2))

bufr = next((c for c in cells.values() if c.get('type') == 'BUFR_BUFR'), None)
assert bufr is not None, "no BUFR_BUFR cell placed"
pad = next((c for c in cells.values() if 'INBUF' in c.get('type', '')), None)
assert pad is not None, "no input buffer cell placed"

bx, by = xy(bufr)
px, py = xy(pad)
assert abs(bx - px) <= 2 and abs(by - py) <= 4, \
    "BUFR at (%d,%d) is not the pad's dedicated site (pad at %d,%d)" % (bx, by, px, py)
print("ok: BUFR %s is the dedicated site of the pad %s" % (bel(bufr), bel(pad)))
PY
