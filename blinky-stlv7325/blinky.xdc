set_property LOC AB11 [get_ports clk_p]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {clk_p}]

set_property LOC AC11 [get_ports clk_n]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {clk_n}]

set_property LOC AA2 [get_ports led]
set_property IOSTANDARD LVCMOS15 [get_ports {led}]

# key2
set_property LOC AC16 [get_ports button]
set_property IOSTANDARD SSTL15 [get_ports {button}]

set_property LOC Y12 [get_ports button_led]
set_property IOSTANDARD SSTL15 [get_ports {button_led}]

set_property LOC V11 [get_ports diff_led_p]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {diff_led_p}]

set_property LOC W11 [get_ports diff_led_n]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {diff_led_n}]
