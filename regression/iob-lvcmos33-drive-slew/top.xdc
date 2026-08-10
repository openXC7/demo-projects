# AX7203 (xc7a200tfbg484-2) pins, same set the other cases in this directory use.
# T6 is an input-only pad here, B13 an output -- the two roles the case checks.
create_clock -period 10.000 -name clk [get_ports clk]
set_property PACKAGE_PIN T6 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property PACKAGE_PIN B13 [get_ports led]
set_property IOSTANDARD LVCMOS33 [get_ports led]
