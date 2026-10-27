# shellcheck disable=SC2034,SC2276,SC2283
# This is a Makefile, not a shell script. The disabled rules are the linter
# reading make variable assignments as shell assignments: SC2283 (spacing),
# SC2276 (`?=` default), SC2034 (a variable set here is consumed by the
# included ../openXC7.mk, which the linter does not follow).

FAMILY=spartan7
PART=xc7s50csga324-1
PROJECT=bramtest
BOARD=arty_s7
CHIPDB=${SPARTAN7_CHIPDB}
TOP_MODULE=top
XDC=bramtest-arty_s7.xdc
JTAG_LINK=--cable digilent

# Pattern seed. Changing it changes both memories, and therefore the synthesis
# result, but not the shape of the design.
SEED?=1

HEX0=bramtest.hex
HEX1=bramtest36.hex

.PHONY: force
force:

# Run the generator on every build. It rewrites a hex file only when the
# contents differ, so an unchanged seed leaves both timestamps alone and make
# does not re-synthesise for nothing. The rule is listed for both files, which
# means make may invoke it once per file; the second call is a no-op.
${HEX0} ${HEX1}: force gen_pattern.py
	@python3 gen_pattern.py --seed "${SEED}"

# yosys loads both memories at synthesis time.
${PROJECT}.json: ${HEX0} ${HEX1}

include ../openXC7.mk
