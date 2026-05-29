# Pushbutton (CPU_RESET) — the clock source
set_property PACKAGE_PIN AV40 [get_ports sw_clk]
set_property IOSTANDARD LVCMOS18 [get_ports sw_clk]

# LEDs (LVCMOS18 on HP bank 15, left side)
set_property PACKAGE_PIN AM39 [get_ports {led[0]}]
set_property PACKAGE_PIN AN39 [get_ports {led[1]}]
set_property PACKAGE_PIN AR37 [get_ports {led[2]}]
set_property PACKAGE_PIN AT37 [get_ports {led[3]}]
set_property PACKAGE_PIN AR35 [get_ports {led[4]}]
set_property PACKAGE_PIN AP41 [get_ports {led[5]}]
set_property PACKAGE_PIN AP42 [get_ports {led[6]}]
set_property PACKAGE_PIN AU39 [get_ports {led[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[*]}]

# Belt-and-suspenders: tell the placer not to insert a BUFG for sw_clk.
set_property CLOCK_BUFFER_TYPE NONE [get_ports sw_clk]
