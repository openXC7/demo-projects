#!/usr/bin/env bash
# Inverted clocks on xc7 (see top.v).  "It built" is the first half: before
# the fix the FASM writer aborted on the flipflop chain.  The second half is
# the bits:
#   - every half-slice holding a flipflop (all of them fall) programs CLKINV
#     and not NOCLKINV, and there are at least the 8 the chain fills;
#   - the half-slice holding the LUT-RAM programs CLKINV and not NOCLKINV;
#   - the block RAM in use carries neither ZINV_CLKARDCLK nor ZINV_CLKBWRCLK
#     (its clocks are inverted at the RAM, not through the fabric);
#   - the routed netlist holds no LUT1 inverter (INIT 01): the INV yosys
#     writes in front of each memory clock is gone, not left in a LUT;
#   - some half-slice holds both an FDRE_1 and an FDRE with IS_C_INVERTED=1,
#     or the case would no longer test the FASM writer's check.
set -euo pipefail

fasm="${FASM:?FASM is not set}"
case_dir="${CASE_DIR:?CASE_DIR is not set}"
fail() { echo "FAIL: $*"; exit 1; }

# the FASM lines, read once; no pipeline into grep -q below (with pipefail,
# an early exit of grep -q fails the pipeline)
F=$(grep -vE '^[[:space:]]*(#|$)' "$fasm" | tr -d '\r' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
has() { grep -qxF -- "$1" <<< "$F"; }

ff_halves=$(sed -nE 's/^([^.]+\.SLICE[LM]_X[01])\.[A-D]5?FF\.(ZINI|ZRST)$/\1/p' <<< "$F" | sort -u)
n_ff=$(grep -c . <<< "$ff_halves" || true)
[ "$n_ff" -ge 8 ] || fail "expected the chain in at least 8 half-slices, got $n_ff"
for h in $ff_halves; do
    has "$h.CLKINV" || fail "$h holds a falling-edge flipflop but does not program CLKINV"
    if has "$h.NOCLKINV"; then fail "$h programs NOCLKINV"; fi
done

ram_halves=$(sed -nE 's/^([^.]+\.SLICEM_X0)\.[A-D]LUT\.RAM$/\1/p' <<< "$F" | sort -u)
[ -n "$ram_halves" ] || fail "no LUT-RAM found"
for h in $ram_halves; do
    has "$h.CLKINV" || fail "$h holds the falling-edge LUT-RAM but does not program CLKINV"
    if has "$h.NOCLKINV"; then fail "$h (LUT-RAM) programs NOCLKINV"; fi
done

bram=$(sed -nE 's/^([^.]+\.RAMB18_Y[01])\.IN_USE$/\1/p' <<< "$F" | sort -u)
[ -n "$bram" ] || fail "no block RAM in use"
for h in $bram; do
    for p in CLKARDCLK CLKBWRCLK; do
        if has "$h.ZINV_$p"; then
            fail "$h.ZINV_$p is set: the block RAM is clocked on the rising edge of what reaches it"
        fi
    done
done

python3 - "$case_dir/top_routed.json" <<'PY'
import json, sys
cells = json.load(open(sys.argv[1]))["modules"]["top"]["cells"]
inv = [n for n, c in cells.items()
       if c["type"] == "SLICE_LUTX" and c["attributes"].get("X_ORIG_TYPE") in ("LUT1", "INV")
       and str(c["parameters"].get("INIT", "")).lstrip("0") == "1"]
if inv:
    print("FAIL: LUT1 inverter(s) left in the routed netlist: " + ", ".join(sorted(inv)))
    sys.exit(1)
# the case only tests the FASM writer if both spellings share a half-slice
kinds = {}
for n, c in cells.items():
    if c["type"] == "SLICE_FFX":
        site = c["attributes"].get("NEXTPNR_BEL", "").split("/")[0]
        kind = c["attributes"].get("X_ORIG_TYPE")
        # an FDRE only counts when its clock is inverted, like the FDRE_1
        inverted = int(str(c["parameters"].get("IS_C_INVERTED", "0")), 2) == 1
        if kind == "FDRE" and not inverted:
            kind = "FDRE, not inverted"
        kinds.setdefault(site, set()).add(kind)
mixed = sorted(s for s, k in kinds.items() if {"FDRE_1", "FDRE"} <= k)
if not mixed:
    print("FAIL: no half-slice holds both FDRE_1 and FDRE: the chain no longer tests what it guards")
    sys.exit(1)
print(f"{len(mixed)} half-slices hold both FDRE_1 and FDRE (IS_C_INVERTED=1)")
PY

echo "ok: $n_ff flipflop half-slices and the LUT-RAM on CLKINV, block RAM clocks without ZINV, no LUT1 inverter"
