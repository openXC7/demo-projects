## Arty S7-50 pins for the 64-deep distributed-RAM (RAM64X1S) test.
## Same three signals as dsp-test-arty-s7: 12 MHz crystal, LED0, USB-UART TX.

## 12 MHz crystal oscillator (bank 15, MRCC)
set_property PACKAGE_PIN F14     [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 83.333 -name sys_clk_pin -waveform {0.000 41.667} -add [get_ports clk]

## LED0 -- lit while the on-chip mismatch counter is zero
set_property PACKAGE_PIN E18     [get_ports led]
set_property IOSTANDARD LVCMOS33 [get_ports led]

## USB-UART TX (FT2232 channel B)
set_property PACKAGE_PIN R12     [get_ports tx]
set_property IOSTANDARD LVCMOS33 [get_ports tx]
