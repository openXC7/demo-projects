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
#   nextpnr_flags  extra nextpnr-xilinx flags appended to the runner's fixed
#                command line, e.g. "--seed 1" for a seed-dependent bug.
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

# dsp-const-only-pins (#159) is expected-red until its fix lands in
# nextpnr-xilinx main; disabled from the default run, pass it explicitly
# (run.sh dsp-const-only-pins).  Everything else has landed and runs by default:
# lut_shared_pin (#158), fdse-fdpe-undefined-init (#179), const-holdout (#184),
# lutram-ram64x1s (#195, fixed by #196) and lutram-clkinv (#201).
cases=("$@"); [ ${#cases[@]} -eq 0 ] && cases=(clock-srcc-bufg bram-sdp-unused-port \
                                              bufg-fabric-driven config-primitive-startupe2 \
                                              iddr-four-iff-flops lut_shared_pin \
                                              fdse-fdpe-undefined-init const-holdout \
                                              lutram-ram64x1s lutram-clkinv \
                                              srl-init xorigport-unknown-name \
                                              srl-wemux dup-package-pin \
                                              bufio-in-use bufr-pad-site \
                                              bufr-sink-region bufh-clock-constraint)
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
  nextpnr_flags=""
  [ -f "$d/nextpnr_flags" ] && nextpnr_flags="$(cat "$d/nextpnr_flags")"
  # A placement-level case (e.g. a regional-buffer legality check whose I pin
  # cannot route until the chipdb is regenerated) carries an empty `no_route`
  # marker: it stops after placement and asserts NEXTPNR_BEL in the placed
  # JSON instead of a FASM.
  no_route=""
  [ -f "$d/no_route" ] && no_route="--no-route"
  if ! yosys -q -p "read_verilog $d/top.v; \
        synth_xilinx $synth_flags -family xc7 -top top; \
        write_json $d/top.json" >"$d/yosys.log" 2>&1; then
    printf '  %-26s FAIL (synthesis) - %s\n' "$c" "$d/yosys.log"; fail=1; continue; fi
  if ! nextpnr-xilinx --chipdb "$chipdb" --xdc "$d/top.xdc" --json "$d/top.json" \
        --write "$d/top_routed.json" --fasm "$d/top.fasm" $nextpnr_flags $no_route --timing-allow-fail >"$d/nextpnr.log" 2>&1; then
    # An expected-fail case (e.g. the duplicate-package-pin warning) declares
    # nextpnr's non-zero exit as the expected outcome and lets its check.sh read
    # nextpnr.log for the verdict.
    if [ -f "$d/expect_fail" ]; then
      if [ -x "$d/check.sh" ]; then
        if ! FASM="$d/top.fasm" CASE_DIR="$d" bash "$d/check.sh" >"$d/check.log" 2>&1; then
          printf '  %-26s FAIL (check.sh) - %s\n' "$c" "$d/check.log"; fail=1; continue
        fi
        ran=$((ran+1))
        printf '  %-26s ok  (expected-fail + check.sh)\n' "$c"
        continue
      fi
      printf '  %-26s FAIL (expected-fail case has no check.sh)\n' "$c"; fail=1; continue
    fi
    printf '  %-26s FAIL (place/route/fasm) - %s\n' "$c" "$d/nextpnr.log"; fail=1; continue
  fi
  # An existing but empty target is how a failed stage reports success. Check content.
  if [ -n "$no_route" ]; then
    # Placement-level case: the artefact is the placed JSON, not a FASM.
    [ -s "$d/top_routed.json" ] || { printf '  %-26s FAIL (empty placed json)\n' "$c"; fail=1; continue; }
  else
    [ -s "$d/top.fasm" ] || { printf '  %-26s FAIL (empty .fasm)\n' "$c"; fail=1; continue; }
  fi
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
  if [ -n "$no_route" ]; then
    printf '  %-26s ok  (%s placed)\n' "$c" "$(du -h "$d/top_routed.json" | cut -f1)"
  else
    printf '  %-26s ok  (%s)\n' "$c" "$(du -h "$d/top.fasm" | cut -f1)"
  fi
done
# A run where every case was skipped proved nothing -- the chipdb set covers
# no case's part.  That must not read as a pass.
if [ "$ran" -eq 0 ] && [ "$fail" -eq 0 ]; then
    printf '  no case ran: the chipdb set covers no case part\n' >&2
    exit 1
fi
exit $fail
