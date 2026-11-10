#!/usr/bin/env bash
# The clock inverter must be gone, the slice must program CLKINV, and the
# reported fmax must exist and stay within the half-period limit.
set -euo pipefail
case_dir="${CASE_DIR:?CASE_DIR is not set}"
fasm="${FASM:?FASM is not set}"
log="$case_dir/nextpnr.log"
fail() { echo "FAIL: $*"; exit 1; }
[ -f "$log" ] || fail "no $log"
[ -s "$fasm" ] || fail "no fasm"

period=$(awk '/create_clock/ { for (i = 1; i <= NF; i++) if ($i == "-period") { print $(i + 1); exit } }' "$case_dir/top.xdc")
[ -n "$period" ] || fail "no period"
achieved=$(awk '
  /Max frequency for clock/ {
    for (i = 1; i <= NF; i++) if ($(i + 1) == "MHz") last = $i
  }
  END { if (last != "") print last }
' "$log")
[ -n "$achieved" ] || fail "no Max frequency line"

awk -v period="$period" -v achieved="$achieved" 'BEGIN {
  half = 2000.0 / period
  if (achieved > half + 0.05) {
    printf "FAIL: reported fmax %.2f MHz exceeds the half-period fmax %.2f MHz\n", achieved, half
    exit 1
  }
  printf "ok: fmax %.2f MHz within half-period %.2f MHz\n", achieved, half
}'

if ! grep -q 'CLKINV' "$fasm"; then fail "fasm has no CLKINV"; fi

python3 - "$case_dir/top_routed.json" << 'PY'
import json, sys
cells = json.load(open(sys.argv[1]))["modules"]["top"]["cells"]
left = []
for name, cell in cells.items():
    orig = str((cell.get("attributes") or {}).get("X_ORIG_TYPE", ""))
    if cell.get("type") in ("INV", "LUT1") or orig in ("INV", "LUT1"):
        left.append(f"{name}:{cell.get('type')}:{orig}")
if left:
    print("FAIL: inverter left in the routed netlist: " + ", ".join(sorted(left)))
    sys.exit(1)
print(f"ok: {len(cells)} routed cells, no INV and no LUT1")
PY
