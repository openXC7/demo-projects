## 12 MHz crystal oscillator (bank 15, MRCC)
set_property PACKAGE_PIN F14     [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 83.333 -name sys_clk_pin -waveform {0.000 41.667} -add [get_ports clk]

## LED0 -- parity of the 32-bit product (alive indicator)
set_property PACKAGE_PIN E18     [get_ports led]
set_property IOSTANDARD LVCMOS33 [get_ports led]

## USB-UART TX (FT2232 channel B)
set_property PACKAGE_PIN R12     [get_ports tx]
set_property IOSTANDARD LVCMOS33 [get_ports tx]
