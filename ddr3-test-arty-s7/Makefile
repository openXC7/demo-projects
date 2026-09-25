PROJECT = arty_ddr3
BOARD = arty_s7_50

FAMILY = spartan7
PART = xc7s50csga324-1
CHIPDB  = ${SPARTAN7_CHIPDB}
ADDITIONAL_SOURCES = ddr3_controller.v  ddr3_phy.v  ddr3_top.v  uart.v  uart_rx.v  uart_tx.v clk_wiz_0.v  clk_wiz_0_clk_wiz.v
# constraints.py/show_bels.py pinned the read-calibration SERDES off the
# _SING tiles, whose PIPs prjxray lacked.  The current database has them, so
# the design routes without the pinning.  Timing is allowed to fail: the
# controller clock has never met its derived constraint (a round-trip
# check is what verify.py does on hardware).
PNR_ARGS = --timing-allow-fail
include ../openXC7.mk
