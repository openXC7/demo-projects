# Digilent Arty S7-50 (XC7S50-CSGA324)
#
# The 100 MHz oscillator is on the DDR-powered side of the device, so it is an
# SSTL135 input rather than LVCMOS33.  Pin numbers are the ones already used by
# demo-projects/litex-minimal-arty-s7/digilent_arty_s7.xdc.

set_property LOC R2 [get_ports {clk}]
set_property IOSTANDARD SSTL135 [get_ports {clk}]
# nextpnr can't read this
# create_clock -period 10 clk

set_property LOC E18 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]

set_property LOC F13 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]

set_property LOC E13 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]

set_property LOC H15 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]

# FT2232 UART bridge
set_property LOC V12 [get_ports {rx}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx}]

set_property LOC R12 [get_ports {tx}]
set_property IOSTANDARD LVCMOS33 [get_ports {tx}]
