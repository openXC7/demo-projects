set_property PACKAGE_PIN AA28 [get_ports clk]
set_property IOSTANDARD LVCMOS18 [get_ports clk]
create_clock -period 20.000 [get_ports clk] ;# 50 MHz

set_property PACKAGE_PIN P30 [get_ports {led[0]}]
set_property PACKAGE_PIN M30 [get_ports {led[1]}]
set_property PACKAGE_PIN N30 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[2]}]

# AC24 is wired to a board reset on (at least some) YPCB-00338-1P1 cards. Left at the openXC7 default
# pull-down, the card resets the moment startup releases the I/O and DONE never goes high. The factory
# image drives it high; so does this design. See TiferKing/ypcb_00338_1p1_hack#3.
set_property PACKAGE_PIN AC24 [get_ports ac24]
set_property IOSTANDARD LVCMOS18 [get_ports ac24]
