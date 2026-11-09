#!/usr/bin/env bash
# An instantiated SRLC16E used to stop in the placer (no BEL for that
# cell type). Packed, expect.txt requires a small SRL (ALUT.SRL and
# ALUT.SMALL). DOUTMUX.MC31 is the zero default of that mux; emitting it
# forces an extra database bit, so a passing FASM leaves it out.
fasm=${FASM:?}
if grep -q 'DOUTMUX\.MC31' "$fasm"; then
  echo "DOUTMUX.MC31 was emitted"
  exit 1
fi
exit 0
