PROJECT = arty_ddr3
BOARD = arty_s7_50

FAMILY = spartan7
PART = xc7s50csga324-1
CHIPDB  = ${SPARTAN7_CHIPDB}
ADDITIONAL_SOURCES = ddr3_controller.v  ddr3_phy.v  ddr3_top.v  uart.v  uart_rx.v  uart_tx.v clk_wiz_0.v  clk_wiz_0_clk_wiz.v
PNR_ARGS = --pre-place constraints.py --pre-route show_bels.py
include ../openXC7.mk
