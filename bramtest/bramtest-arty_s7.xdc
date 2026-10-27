# Digilent Arty S7-50 (XC7S50-CSGA324)
#
# Same pins as demo-projects/picosoc/picosoc-arty_s7.xdc: the 100 MHz oscillator
# is on R2 in an SSTL135 bank, the FT2232 UART is R12 (tx) and V12 (rx), and the
# four user LEDs are E18/F13/E13/H15.

set_property LOC R2 [get_ports {clk}]
set_property IOSTANDARD SSTL135 [get_ports {clk}]
# nextpnr can't read this
# create_clock -period 10 clk

set_property LOC R12 [get_ports {tx}]
set_property IOSTANDARD LVCMOS33 [get_ports {tx}]

set_property LOC E18 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]

set_property LOC F13 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]

set_property LOC E13 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]

set_property LOC H15 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]
