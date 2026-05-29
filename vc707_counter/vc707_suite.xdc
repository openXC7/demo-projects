# Suite-EDIF port constraints for vc707_counter.
# fpga_emit regroups per-bit led__N back into a vectored bus port, so
# Vivado / nextpnr see `led[7:0]` exactly as the source declared.

# ---------- 200 MHz LVDS sysclk (Bank 38, HP, 1.8 V) ----------------
set_property PACKAGE_PIN E19 [get_ports clk_p]
set_property PACKAGE_PIN E18 [get_ports clk_n]
set_property IOSTANDARD  LVDS [get_ports clk_p]
set_property IOSTANDARD  LVDS [get_ports clk_n]
create_clock -period 5.000 -name sysclk [get_ports clk_p]

# ---------- CPU_RESET pushbutton ------------------------------------
set_property PACKAGE_PIN AV40 [get_ports rst]
set_property IOSTANDARD  LVCMOS18 [get_ports rst]

# ---------- 8 user LEDs ---------------------------------------------
set_property PACKAGE_PIN AM39 [get_ports {led[0]}]
set_property PACKAGE_PIN AN39 [get_ports {led[1]}]
set_property PACKAGE_PIN AR37 [get_ports {led[2]}]
set_property PACKAGE_PIN AT37 [get_ports {led[3]}]
set_property PACKAGE_PIN AR35 [get_ports {led[4]}]
set_property PACKAGE_PIN AP41 [get_ports {led[5]}]
set_property PACKAGE_PIN AP42 [get_ports {led[6]}]
set_property PACKAGE_PIN AU39 [get_ports {led[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[*]}]

# ---------- Configuration -------------------------------------------
set_property CFGBVS         GND   [current_design]
set_property CONFIG_VOLTAGE 1.8   [current_design]
set_property BITSTREAM.GENERAL.PERFRAMECRC YES [current_design]
