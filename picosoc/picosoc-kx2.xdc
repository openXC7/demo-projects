set_property LOC F23 [get_ports clk]
set_property LOC G24 [get_ports led[0]]
set_property LOC F24 [get_ports led[1]]
set_property LOC E25 [get_ports sw]
set_property LOC D25 [get_ports rx]
set_property LOC G25 [get_ports tx]

set_property IOSTANDARD LVCMOS33 [get_ports {clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx}]
set_property IOSTANDARD LVCMOS33 [get_ports {tx}]

# nextpnr can't read this
# create_clock -period 20 clk_bufg
