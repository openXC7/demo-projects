################################################################################
# IO constraints
################################################################################
# clk200:0.p
set_property LOC AB11 [get_ports {clk200_p}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {clk200_p}]

# clk200:0.n
set_property LOC AC11 [get_ports {clk200_n}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {clk200_n}]

# clk50:0
set_property LOC F17 [get_ports {clk50}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk50}]

# cpu_reset_n:0
set_property LOC AC16 [get_ports {cpu_reset_n}]
set_property IOSTANDARD LVCMOS15 [get_ports {cpu_reset_n}]

# serial:0.tx
set_property LOC L23 [get_ports {serial_tx}]
set_property IOSTANDARD LVCMOS33 [get_ports {serial_tx}]

# serial:0.rx
set_property LOC K21 [get_ports {serial_rx}]
set_property IOSTANDARD LVCMOS33 [get_ports {serial_rx}]

# hdmi_out:0.clk_p
set_property LOC F14 [get_ports {hdmi_out_clk_p}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_out_clk_p}]

# hdmi_out:0.clk_n
set_property LOC F13 [get_ports {hdmi_out_clk_n}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_out_clk_n}]

# hdmi_out:0.data0_p
set_property LOC G12 [get_ports {hdmi_out_data0_p}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_out_data0_p}]

# hdmi_out:0.data0_n
set_property LOC F12 [get_ports {hdmi_out_data0_n}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_out_data0_n}]

# hdmi_out:0.data1_p
set_property LOC G10 [get_ports {hdmi_out_data1_p}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_out_data1_p}]

# hdmi_out:0.data1_n
set_property LOC G9 [get_ports {hdmi_out_data1_n}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_out_data1_n}]

# hdmi_out:0.data2_p
set_property LOC H9 [get_ports {hdmi_out_data2_p}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_out_data2_p}]

# hdmi_out:0.data2_n
set_property LOC H8 [get_ports {hdmi_out_data2_n}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_out_data2_n}]

# user_led_n:0
set_property LOC AA2 [get_ports {user_led_n0}]
set_property IOSTANDARD LVCMOS15 [get_ports {user_led_n0}]

# user_led_n:1
set_property LOC AD5 [get_ports {user_led_n1}]
set_property IOSTANDARD LVCMOS15 [get_ports {user_led_n1}]

# user_led_n:2
set_property LOC W10 [get_ports {user_led_n2}]
set_property IOSTANDARD LVCMOS15 [get_ports {user_led_n2}]

# user_led_n:3
set_property LOC Y10 [get_ports {user_led_n3}]
set_property IOSTANDARD LVCMOS15 [get_ports {user_led_n3}]

# user_led_n:4
set_property LOC AE10 [get_ports {user_led_n4}]
set_property IOSTANDARD LVCMOS15 [get_ports {user_led_n4}]

# user_led_n:5
set_property LOC W11 [get_ports {user_led_n5}]
set_property IOSTANDARD LVCMOS15 [get_ports {user_led_n5}]

# user_led_n:6
set_property LOC V11 [get_ports {user_led_n6}]
set_property IOSTANDARD LVCMOS15 [get_ports {user_led_n6}]

# user_led_n:7
set_property LOC Y12 [get_ports {user_led_n7}]
set_property IOSTANDARD LVCMOS15 [get_ports {user_led_n7}]

################################################################################
# Design constraints
################################################################################


#set_property CFGBVS VCCO [current_design]
#set_property CONFIG_VOLTAGE 3.3 [current_design]
#set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]


#set_property DCI_CASCADE {32 34} [get_iobanks 33]

################################################################################
# Clock constraints
################################################################################


create_clock -name clk200_p -period 5.0 [get_ports clk200_p]

set_clock_groups -group [get_clocks -include_generated_clocks -of [get_nets sys_clk]] -group [get_clocks -include_generated_clocks -of [get_nets main_s7pll0_clkin]] -asynchronous

################################################################################
# False path constraints
################################################################################


#set_false_path -quiet -through [get_nets -hierarchical -filter {mr_ff == TRUE}]

#set_false_path -quiet -to [get_pins -filter {REF_PIN_NAME == PRE} -of_objects [get_cells -hierarchical -filter {ars_ff1 == TRUE || ars_ff2 == TRUE}]]

#set_max_delay 2 -quiet -from [get_pins -filter {REF_PIN_NAME == C} -of_objects [get_cells -hierarchical -filter {ars_ff1 == TRUE}]] -to [get_pins -filter {REF_PIN_NAME == D} -of_objects [get_cells -hierarchical -filter {ars_ff2 == TRUE}]]