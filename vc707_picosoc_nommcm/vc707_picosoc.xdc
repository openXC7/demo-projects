# 200 MHz LVDS sysclk (bank 38, HP)
set_property PACKAGE_PIN E19 [get_ports clk_p]
set_property PACKAGE_PIN E18 [get_ports clk_n]
set_property IOSTANDARD LVDS [get_ports clk_p]
set_property IOSTANDARD LVDS [get_ports clk_n]
create_clock -period 5.000 -name sysclk [get_ports clk_p]

# CPU_RESET pushbutton (bank 16, LVCMOS18, active-high)
set_property PACKAGE_PIN AV40 [get_ports rst]
set_property IOSTANDARD LVCMOS18 [get_ports rst]

# USB-UART via FT4232HL (bank 13, LVCMOS18)
# uart_tx = FPGA→host  =  USB-UART TX line
# uart_rx = host→FPGA  =  USB-UART RX line
set_property PACKAGE_PIN AU36 [get_ports uart_tx]
set_property PACKAGE_PIN AU33 [get_ports uart_rx]
set_property IOSTANDARD LVCMOS18 [get_ports uart_tx]
set_property IOSTANDARD LVCMOS18 [get_ports uart_rx]

# LEDs LD0..LD7 (banks 16/17/18, LVCMOS18)
set_property PACKAGE_PIN AM39 [get_ports {led[0]}]
set_property PACKAGE_PIN AN39 [get_ports {led[1]}]
set_property PACKAGE_PIN AR37 [get_ports {led[2]}]
set_property PACKAGE_PIN AT37 [get_ports {led[3]}]
set_property PACKAGE_PIN AR35 [get_ports {led[4]}]
set_property PACKAGE_PIN AP41 [get_ports {led[5]}]
set_property PACKAGE_PIN AP42 [get_ports {led[6]}]
set_property PACKAGE_PIN AU39 [get_ports {led[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[*]}]

set_property CFGBVS GND [current_design]
set_property CONFIG_VOLTAGE 1.8 [current_design]
