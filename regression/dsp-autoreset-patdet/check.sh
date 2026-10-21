#!/usr/bin/env bash
# AUTORESET_PATDET = "RESET_NOT_MATCH": every DSP site in the FASM carries
# AUTORESET_PATDET_RESET and AUTORESET_PATDET_RESET_NOT_MATCH.  Before the fix
# the flow exited 0 with only the second.  A FASM without a DSP site fails.
set -euo pipefail

: "${FASM:?run.sh must export FASM}"

sites=$(grep -oE '^DSP_[LR]_X[0-9]+Y[0-9]+\.DSP48\.DSP_[01]\.' "$FASM" | sort -u || true)
[ -n "$sites" ] || { echo "FAIL: no DSP48E1 placed -- the run proved nothing"; exit 1; }

rc=0
for site in $sites; do
    for feat in AUTORESET_PATDET_RESET AUTORESET_PATDET_RESET_NOT_MATCH; do
        if grep -qxF "${site}${feat}" "$FASM"; then
            echo "${site}${feat}: set"
        else
            echo "FAIL: ${site}${feat} is missing"
            rc=1
        fi
    done
done
[ $rc = 0 ] && echo "ok: AUTORESET_PATDET_RESET and AUTORESET_PATDET_RESET_NOT_MATCH on every DSP site"
exit $rc
