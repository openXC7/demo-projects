set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports {clk}];
create_clock -period 10.0 [get_ports {clk} extra];
set_property -dict {PACKAGE_PIN C6 IOSTANDARD LVCMOS33} [get_ports {a}];
set_property -dict {PACKAGE_PIN A1 IOSTANDARD LVCMOS33} [get_ports {y}];
