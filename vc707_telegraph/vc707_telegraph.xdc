# Same SGMIICLK_Q0 path as the picosoc_sgmii variant
set_property PACKAGE_PIN AH8 [get_ports sgmii_refclk_p]
set_property PACKAGE_PIN AH7 [get_ports sgmii_refclk_n]
create_clock -period 8.000 -name sgmii_refclk [get_ports sgmii_refclk_p]

set_property PACKAGE_PIN AV40 [get_ports rst]
set_property IOSTANDARD LVCMOS18 [get_ports rst]
set_property PACKAGE_PIN AU36 [get_ports uart_tx]
set_property PACKAGE_PIN AU33 [get_ports uart_rx]
set_property IOSTANDARD LVCMOS18 [get_ports uart_tx]
set_property IOSTANDARD LVCMOS18 [get_ports uart_rx]
set_property PACKAGE_PIN AM39 [get_ports {led[0]}]
set_property PACKAGE_PIN AN39 [get_ports {led[1]}]
set_property PACKAGE_PIN AR37 [get_ports {led[2]}]
set_property PACKAGE_PIN AT37 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[*]}]

# Note: telegraph.v's CLK_HZ=25_000_000 means the baud counter expects 25 MHz.
# At 125 MHz the actual baud rate is 5x faster (115200 → 576000). Fine for
# DB-coverage testing; for real UART use parameterise CLK_HZ.

set_property CFGBVS GND [current_design]
set_property CONFIG_VOLTAGE 1.8 [current_design]
