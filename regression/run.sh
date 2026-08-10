#!/usr/bin/env bash
# Regression cases for xc7 bugs fixed in this tree.
#
# Each case is a design that FAILED before its patch and builds after it. The pass
# criterion is blunt on purpose -- a non-empty .fasm -- because every bug here stopped
# the flow outright, so there is nothing partial to interpret.
#
#   CHIPDB=/path/xc7a200t.bin ./run.sh                  # all cases
#   CHIPDB=/path/xc7a200t.bin ./run.sh clock-srcc-bufg  # one case
#
# Needs yosys and nextpnr-xilinx on PATH. No hardware, no prjxray.
set -uo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
: "${CHIPDB:?set CHIPDB to a generated chipdb .bin (e.g. xc7a200t.bin)}"

cases=("$@"); [ ${#cases[@]} -eq 0 ] && cases=(clock-srcc-bufg bram-sdp-unused-port \
                                              bufg-fabric-driven config-primitive-startupe2 \
                                              iddr-four-iff-flops)
fail=0
for c in "${cases[@]}"; do
  d="$HERE/$c"
  [ -d "$d" ] || { printf '  %-26s NO SUCH CASE\n' "$c"; fail=1; continue; }
  rm -f "$d/top.json" "$d/top.fasm"
  if ! yosys -q -p "read_verilog $d/top.v; \
        synth_xilinx -flatten -abc9 -nocarry -nodsp -family xc7 -top top; \
        write_json $d/top.json" >"$d/yosys.log" 2>&1; then
    printf '  %-26s FAIL (synthesis) - %s\n' "$c" "$d/yosys.log"; fail=1; continue; fi
  if ! nextpnr-xilinx --chipdb "$CHIPDB" --xdc "$d/top.xdc" --json "$d/top.json" \
        --fasm "$d/top.fasm" --timing-allow-fail >"$d/nextpnr.log" 2>&1; then
    printf '  %-26s FAIL (place/route/fasm) - %s\n' "$c" "$d/nextpnr.log"; fail=1; continue; fi
  # An existing but empty target is how a failed stage reports success. Check content.
  [ -s "$d/top.fasm" ] || { printf '  %-26s FAIL (empty .fasm)\n' "$c"; fail=1; continue; }
  # Some fixes changed which bits are emitted, not whether the flow completes. Those
  # cases carry an expect.txt of regexes that must all appear in the FASM.
  if [ -f "$d/expect.txt" ]; then
    miss=0
    while read -r pat; do
      [ -z "$pat" ] && continue
      grep -qE -- "$pat" "$d/top.fasm" || { printf '  %-26s FAIL (fasm missing: %s)\n' "$c" "$pat"; miss=1; }
    done < "$d/expect.txt"
    [ "$miss" -eq 0 ] || { fail=1; continue; }
  fi
  printf '  %-26s ok  (%s)\n' "$c" "$(du -h "$d/top.fasm" | cut -f1)"
done
exit $fail
