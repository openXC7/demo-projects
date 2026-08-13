################################################################################
# IO constraints
################################################################################
# clk50:0
set_property LOC R4 [get_ports {clk50}]
set_property IOSTANDARD SSTL135 [get_ports {clk50}]

# cpu_reset_n:0
set_property LOC U7 [get_ports {cpu_reset_n}]
set_property IOSTANDARD SSTL135 [get_ports {cpu_reset_n}]

# gtp_refclk:0.p
set_property LOC F10 [get_ports {gtp_refclk_p}]

# gtp_refclk:0.n
set_property LOC E10 [get_ports {gtp_refclk_n}]

# serial:0.tx
set_property LOC D17 [get_ports {serial_tx}]
set_property IOSTANDARD LVCMOS33 [get_ports {serial_tx}]

# serial:0.rx
set_property LOC E14 [get_ports {serial_rx}]
set_property IOSTANDARD LVCMOS33 [get_ports {serial_rx}]

# pcie2sata:0.tx_p
set_property LOC B6 [get_ports {pcie2sata_tx_p}]

# pcie2sata:0.tx_n
set_property LOC A6 [get_ports {pcie2sata_tx_n}]

# pcie2sata:0.rx_p
set_property LOC B10 [get_ports {pcie2sata_rx_p}]

# pcie2sata:0.rx_n
set_property LOC A10 [get_ports {pcie2sata_rx_n}]

# user_led:0
set_property LOC V9 [get_ports {user_led0}]
set_property IOSTANDARD SSTL135 [get_ports {user_led0}]

# user_led:1
set_property LOC Y8 [get_ports {user_led1}]
set_property IOSTANDARD SSTL135 [get_ports {user_led1}]

# user_led:2
set_property LOC Y7 [get_ports {user_led2}]
set_property IOSTANDARD SSTL135 [get_ports {user_led2}]

# user_led:3
set_property LOC W7 [get_ports {user_led3}]
set_property IOSTANDARD SSTL135 [get_ports {user_led3}]

################################################################################
# Clock constraints
################################################################################

create_clock -name clk50 -period 20.0 [get_ports clk50]
create_clock -name sata_tx_clk -period 13.333 [get_ports sata_tx_clk]
create_clock -name sata_rx_clk -period 13.333 [get_ports sata_rx_clk]