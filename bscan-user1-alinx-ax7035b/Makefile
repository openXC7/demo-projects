FAMILY  = artix7
PART    = xc7a35tfgg484-2
PROJECT = bscan_user1
CHIPDB  = ${ARTIX7_CHIPDB}

# `make program` loads the FPGA's configuration RAM through the board's
# FT232H JTAG cable. Without -f, openFPGALoader leaves the flash alone.
JTAG_LINK = --cable ft232

include ../openXC7.mk

# Write and read the USER1 register on the board (after `make program`).
.PHONY: test
test:
	openocd -f al321-ft232h.cfg -f user1-test.tcl
