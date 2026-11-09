#!/usr/bin/env bash
# The reported maximum frequency must not exceed the frequency of half the
# clock period. A rising-to-falling path has that half period on silicon.
# CASE_DIR holds top.xdc and nextpnr.log (the runner writes the log there).
set -euo pipefail
case_dir="${CASE_DIR:?CASE_DIR is not set}"
xdc="$case_dir/top.xdc"
log="$case_dir/nextpnr.log"
[ -f "$xdc" ] || { echo "FAIL: no $xdc"; exit 1; }
[ -f "$log" ] || { echo "FAIL: no $log"; exit 1; }

period=$(awk '/create_clock/ { for (i = 1; i <= NF; i++) if ($i == "-period") { print $(i + 1); exit } }' "$xdc")
[ -n "$period" ] || { echo "FAIL: no create_clock period in $xdc"; exit 1; }

# The log prints a frequency at more than one point. The last line is the
# routed result, the same number the JSON report keeps.
achieved=$(awk '
  /Max frequency for clock/ {
    for (i = 1; i <= NF; i++) if ($(i + 1) == "MHz") last = $i
  }
  END { if (last != "") print last }
' "$log")
[ -n "$achieved" ] || { echo "FAIL: no Max frequency line in $log"; exit 1; }

awk -v period="$period" -v achieved="$achieved" 'BEGIN {
  half = 2000.0 / period
  if (achieved > half + 0.05) {
    printf "FAIL: reported fmax %.2f MHz exceeds the half-period fmax %.2f MHz (period %s ns)\n", achieved, half, period
    exit 1
  }
  printf "ok: reported fmax %.2f MHz is within the half-period fmax %.2f MHz (period %s ns)\n", achieved, half, period
}'
