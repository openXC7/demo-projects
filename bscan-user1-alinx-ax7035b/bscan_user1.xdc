## LED1..LED4, active low
set_property PACKAGE_PIN F19     [get_ports {leds[0]}]
set_property PACKAGE_PIN E21     [get_ports {leds[1]}]
set_property PACKAGE_PIN D20     [get_ports {leds[2]}]
set_property PACKAGE_PIN C20     [get_ports {leds[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {leds[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {leds[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {leds[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {leds[3]}]

## KEY1..KEY4, active low, pulled up on the board
set_property PACKAGE_PIN M13     [get_ports {keys[0]}]
set_property PACKAGE_PIN K14     [get_ports {keys[1]}]
set_property PACKAGE_PIN K13     [get_ports {keys[2]}]
set_property PACKAGE_PIN L13     [get_ports {keys[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {keys[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {keys[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {keys[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {keys[3]}]
