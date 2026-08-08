set_property LOC U24 [get_ports {clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk}]

# led[:0
set_property LOC A27 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS15 [get_ports {led[0]}]

# led[:1
set_property LOC E24 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS15 [get_ports {led[1]}]

# serial:0.tx
set_property LOC A16 [get_ports {tx}]
set_property IOSTANDARD LVCMOS33 [get_ports {tx}]

# serial:0.rx
set_property LOC B17 [get_ports {rx}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx}]

set_property LOC Y23 [get_ports sw]
set_property IOSTANDARD LVCMOS33 [get_ports {sw}]
