#!/usr/bin/env bash
# Regression cases for xc7 bugs fixed in this tree.
#
# Each case is a design that FAILED before its patch and builds after it.
#
# A case carries top.v + top.xdc, and optionally:
#   synth_flags  extra `synth_xilinx` flags, replacing the default
#                "-flatten -abc9 -nocarry -nodsp" (family and top are fixed
#                by the runner).  A DSP case drops "-nodsp".
#   part.txt     the part whose chipdb the case needs, e.g. xc7a200tfbg484-2;
#                used only in CHIPDB_DIR mode.
#   expect.txt   regexes that must all appear in the produced .fasm.
#   check.sh     executable custom check; receives FASM=<path> and
#                CASE_DIR=<path> (which holds top_routed.json), and its
#                exit status is the case verdict.
#
# Pass criteria, in order: a non-empty .fasm, then expect.txt (if present),
# then check.sh (if present).  A case without any of the extras passes on the
# non-empty .fasm alone -- the blunt criterion, because those bugs stopped the
# flow outright, so there is nothing partial to interpret.
#
#   CHIPDB=/path/xc7a200tfbg484-2.bin ./run.sh            # all cases, one chipdb
#   CHIPDB_DIR=/path/to/chipdb-dir  ./run.sh              # per-case part.txt lookup
#   CHIPDB=... ./run.sh dsp-const-only-pins               # one case
#
# Needs yosys and nextpnr-xilinx on PATH. No hardware, no prjxray.
set -uo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"

if [ -z "${CHIPDB:-}" ] && [ -z "${CHIPDB_DIR:-}" ]; then
    echo "set CHIPDB to a generated chipdb .bin, or CHIPDB_DIR to a directory of .bins" >&2
    exit 2
fi

# dsp-const-only-pins (#159) and lut_shared_pin (#158) are expected-red until
# their fixes land in nextpnr-xilinx main; disabled from the default run, pass
# them explicitly to run.  Re-enable when merged.
cases=("$@"); [ ${#cases[@]} -eq 0 ] && cases=(clock-srcc-bufg bram-sdp-unused-port \
                                              bufg-fabric-driven config-primitive-startupe2 \
                                              iddr-four-iff-flops)
fail=0
ran=0
for c in "${cases[@]}"; do
  d="$HERE/$c"
  [ -d "$d" ] || { printf '  %-26s NO SUCH CASE\n' "$c"; fail=1; continue; }

  # Chipdb resolution: an explicit CHIPDB wins; otherwise look the case's
  # part.txt up in CHIPDB_DIR.  part.txt carries the full speedgrade-suffixed
  # name (xc7a200tfbg484-2), but the toolchain-nix family chipdb artifacts
  # strip the speedgrade (xc7a200tfbg484.bin); the demos.yml gate's bbaexport
  # chipdb keeps it.  Try the exact name first, then the stripped form, and
  # only skip when neither exists.
  chipdb="${CHIPDB:-}"
  if [ -z "$chipdb" ]; then
    part="$(cat "$d/part.txt" 2>/dev/null || true)"
    if [ -n "$part" ] && [ -f "${CHIPDB_DIR:-}/$part.bin" ]; then
      chipdb="$CHIPDB_DIR/$part.bin"
    elif [ -n "$part" ] && [ -f "${CHIPDB_DIR:-}/${part%-*}.bin" ]; then
      chipdb="$CHIPDB_DIR/${part%-*}.bin"
    else
      printf '  %-26s SKIP (no %s.bin in CHIPDB_DIR)\n' "$c" "${part:-<part.txt>}"
      continue
    fi
  fi

  rm -f "$d/top.json" "$d/top.fasm" "$d/top_routed.json"
  synth_flags="-flatten -abc9 -nocarry -nodsp"
  [ -f "$d/synth_flags" ] && synth_flags="$(cat "$d/synth_flags")"
  if ! yosys -q -p "read_verilog $d/top.v; \
        synth_xilinx $synth_flags -family xc7 -top top; \
        write_json $d/top.json" >"$d/yosys.log" 2>&1; then
    printf '  %-26s FAIL (synthesis) - %s\n' "$c" "$d/yosys.log"; fail=1; continue; fi
  if ! nextpnr-xilinx --chipdb "$chipdb" --xdc "$d/top.xdc" --json "$d/top.json" \
        --write "$d/top_routed.json" --fasm "$d/top.fasm" --timing-allow-fail >"$d/nextpnr.log" 2>&1; then
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
  # Strongest criterion: a case-owned check (on $FASM or $CASE_DIR/top_routed.json).
  if [ -x "$d/check.sh" ]; then
    if ! FASM="$d/top.fasm" CASE_DIR="$d" bash "$d/check.sh" >"$d/check.log" 2>&1; then
      printf '  %-26s FAIL (check.sh) - %s\n' "$c" "$d/check.log"; fail=1; continue
    fi
  fi
  ran=$((ran+1))
  printf '  %-26s ok  (%s)\n' "$c" "$(du -h "$d/top.fasm" | cut -f1)"
done
# A run where every case was skipped proved nothing -- the chipdb set covers
# no case's part.  That must not read as a pass.
if [ "$ran" -eq 0 ] && [ "$fail" -eq 0 ]; then
    printf '  no case ran: the chipdb set covers no case part\n' >&2
    exit 1
fi
exit $fail
