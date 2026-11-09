#!/usr/bin/env bash
# Q31 used to stop in the packer: the cascade has to leave through the
# fabric and Q was already in use. expect.txt requires ALUT.SRL and
# ALUT.DI1MUX.AI, the fabric path. DOUTMUX.MC31 is the zero default of
# that mux; emitting it forces an extra database bit, so a passing FASM
# leaves it out.
fasm=${FASM:?}
if grep -q 'DOUTMUX\.MC31' "$fasm"; then
  echo "DOUTMUX.MC31 was emitted"
  exit 1
fi
exit 0
