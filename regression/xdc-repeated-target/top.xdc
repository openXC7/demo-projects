set_property PACKAGE_PIN E3 [get_ports {clk}];
set_property IOSTANDARD LVCMOS33 [get_ports {clk clk}];
create_clock -period 10.0 [get_ports {clk clk}];
set_property -dict {PACKAGE_PIN C6 IOSTANDARD LVCMOS33} [get_ports {a}];
set_property -dict {PACKAGE_PIN A1 IOSTANDARD LVCMOS33} [get_ports {y}];
