# (ab)use the single ended 60MHz clock from the ULPI PHY
set_property LOC AB11 [get_ports clk_p]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {clk_p}]

set_property LOC AC11 [get_ports clk_n]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {clk_n}]

set_property LOC AA2 [get_ports led]
set_property IOSTANDARD LVCMOS15 [get_ports {led}]
