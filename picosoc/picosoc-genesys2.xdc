# (ab)use the single ended 60MHz clock from the ULPI PHY
set_property LOC AD18 [get_ports clk]
set_property IOSTANDARD LVCMOS18 [get_ports {clk}]
# nextpnr can't read this
# create_clock -period ?? clk_bufg

set_property LOC T28 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]
