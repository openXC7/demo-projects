# VC707 (xc7vx485tffg1761-2) constraints for the 8-bit counter smoke-test.
# All pins from the VC707 schematic / Xilinx XTP137 board file.

# ----------------------------------------------------------------------
# 200 MHz LVDS sysclk (Bank 38, HP, 1.8 V)
# ----------------------------------------------------------------------
set_property PACKAGE_PIN E19 [get_ports clk_p]
set_property PACKAGE_PIN E18 [get_ports clk_n]
set_property IOSTANDARD  LVDS [get_ports clk_p]
set_property IOSTANDARD  LVDS [get_ports clk_n]
create_clock -period 5.000 -name sysclk [get_ports clk_p]

# ----------------------------------------------------------------------
# CPU_RESET pushbutton (Bank 16, LVCMOS18, active high)
# ----------------------------------------------------------------------
set_property PACKAGE_PIN AV40 [get_ports rst]
set_property IOSTANDARD  LVCMOS18 [get_ports rst]

# ----------------------------------------------------------------------
# 8 user LEDs GPIO_LED_0..7_LS (Bank 16/17/18, LVCMOS18)
# ----------------------------------------------------------------------
set_property PACKAGE_PIN AM39 [get_ports {led[0]}]
set_property PACKAGE_PIN AN39 [get_ports {led[1]}]
set_property PACKAGE_PIN AR37 [get_ports {led[2]}]
set_property PACKAGE_PIN AT37 [get_ports {led[3]}]
set_property PACKAGE_PIN AR35 [get_ports {led[4]}]
set_property PACKAGE_PIN AP41 [get_ports {led[5]}]
set_property PACKAGE_PIN AP42 [get_ports {led[6]}]
set_property PACKAGE_PIN AU39 [get_ports {led[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[*]}]

# ----------------------------------------------------------------------
# Configuration
# ----------------------------------------------------------------------
set_property CFGBVS         GND   [current_design]
set_property CONFIG_VOLTAGE 1.8   [current_design]
set_property BITSTREAM.GENERAL.PERFRAMECRC YES [current_design]
