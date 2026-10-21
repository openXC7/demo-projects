#!/usr/bin/env bash
# SDP RAMB36, both output registers on: each half has DOA_REG, DOB_REG,
# ZINV_REGCLKARDRCLK and the x36 SDP read and write widths, and ZINV_REGCLKB is
# absent. Pre-fix the flow exited 0 with ZINV_REGCLKB set on both halves.
set -euo pipefail
exec python3 - "${FASM:?}" <<'PY'
import sys

text = open(sys.argv[1]).read().splitlines()
feats = [ln.split("#", 1)[0].strip() for ln in text if ln.strip() and not ln.strip().startswith("#")]
zinv_b = [ln for ln in feats if ln.endswith(".ZINV_REGCLKB") or ln == "ZINV_REGCLKB"]
if zinv_b:
    sys.exit("FAIL: ZINV_REGCLKB is set: " + ", ".join(zinv_b))

def has(half, name):
    return any(ln.endswith(f".RAMB18_{half}.{name}") or ln.endswith(f"RAMB18_{half}.{name}") for ln in feats)

missing = []
for half in ("Y0", "Y1"):
    for name in ("DOA_REG", "DOB_REG", "ZINV_REGCLKARDRCLK", "SDP_READ_WIDTH_36", "SDP_WRITE_WIDTH_36"):
        if not has(half, name):
            missing.append(f"{half}.{name}")
if missing:
    sys.exit("FAIL: missing " + ", ".join(missing))
print("ok: SDP output registers, ZINV_REGCLKB clear on Y0 and Y1")
PY
