################################################################################
# IO constraints
################################################################################
# cpu_reset:0
set_property LOC P4 [get_ports {cpu_reset}]
set_property IOSTANDARD LVCMOS33 [get_ports {cpu_reset}]

# clk50:0
set_property LOC U22 [get_ports {clk50}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk50}]

# serial:0.rx
set_property LOC G22 [get_ports {serial_rx}]
set_property IOSTANDARD LVCMOS33 [get_ports {serial_rx}]

# serial:0.tx
set_property LOC F22 [get_ports {serial_tx}]
set_property IOSTANDARD LVCMOS33 [get_ports {serial_tx}]

# ddram:0.a
set_property LOC E17 [get_ports {ddram_a[0]}]
set_property SLEW FAST [get_ports {ddram_a[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_a[0]}]

# ddram:0.a
set_property LOC G17 [get_ports {ddram_a[1]}]
set_property SLEW FAST [get_ports {ddram_a[1]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_a[1]}]

# ddram:0.a
set_property LOC F17 [get_ports {ddram_a[2]}]
set_property SLEW FAST [get_ports {ddram_a[2]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_a[2]}]

# ddram:0.a
set_property LOC C17 [get_ports {ddram_a[3]}]
set_property SLEW FAST [get_ports {ddram_a[3]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_a[3]}]

# ddram:0.a
set_property LOC G16 [get_ports {ddram_a[4]}]
set_property SLEW FAST [get_ports {ddram_a[4]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_a[4]}]

# ddram:0.a
set_property LOC D16 [get_ports {ddram_a[5]}]
set_property SLEW FAST [get_ports {ddram_a[5]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_a[5]}]

# ddram:0.a
set_property LOC H16 [get_ports {ddram_a[6]}]
set_property SLEW FAST [get_ports {ddram_a[6]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_a[6]}]

# ddram:0.a
set_property LOC E16 [get_ports {ddram_a[7]}]
set_property SLEW FAST [get_ports {ddram_a[7]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_a[7]}]

# ddram:0.a
set_property LOC H14 [get_ports {ddram_a[8]}]
set_property SLEW FAST [get_ports {ddram_a[8]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_a[8]}]

# ddram:0.a
set_property LOC F15 [get_ports {ddram_a[9]}]
set_property SLEW FAST [get_ports {ddram_a[9]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_a[9]}]

# ddram:0.a
set_property LOC F20 [get_ports {ddram_a[10]}]
set_property SLEW FAST [get_ports {ddram_a[10]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_a[10]}]

# ddram:0.a
set_property LOC H15 [get_ports {ddram_a[11]}]
set_property SLEW FAST [get_ports {ddram_a[11]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_a[11]}]

# ddram:0.a
set_property LOC C18 [get_ports {ddram_a[12]}]
set_property SLEW FAST [get_ports {ddram_a[12]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_a[12]}]

# ddram:0.a
set_property LOC G15 [get_ports {ddram_a[13]}]
set_property SLEW FAST [get_ports {ddram_a[13]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_a[13]}]

# ddram:0.ba
set_property LOC B17 [get_ports {ddram_ba[0]}]
set_property SLEW FAST [get_ports {ddram_ba[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_ba[0]}]

# ddram:0.ba
set_property LOC D18 [get_ports {ddram_ba[1]}]
set_property SLEW FAST [get_ports {ddram_ba[1]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_ba[1]}]

# ddram:0.ba
set_property LOC A17 [get_ports {ddram_ba[2]}]
set_property SLEW FAST [get_ports {ddram_ba[2]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_ba[2]}]

# ddram:0.ras_n
set_property LOC A19 [get_ports {ddram_ras_n}]
set_property SLEW FAST [get_ports {ddram_ras_n}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_ras_n}]

# ddram:0.cas_n
set_property LOC B19 [get_ports {ddram_cas_n}]
set_property SLEW FAST [get_ports {ddram_cas_n}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_cas_n}]

# ddram:0.we_n
set_property LOC A18 [get_ports {ddram_we_n}]
set_property SLEW FAST [get_ports {ddram_we_n}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_we_n}]

# ddram:0.dm
set_property LOC A22 [get_ports {ddram_dm[0]}]
set_property SLEW FAST [get_ports {ddram_dm[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_dm[0]}]

# ddram:0.dm
set_property LOC C22 [get_ports {ddram_dm[1]}]
set_property SLEW FAST [get_ports {ddram_dm[1]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_dm[1]}]

# ddram:0.dq
set_property LOC D21 [get_ports {ddram_dq[0]}]
set_property SLEW FAST [get_ports {ddram_dq[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_dq[0]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddram_dq[0]}]

# ddram:0.dq
set_property LOC C21 [get_ports {ddram_dq[1]}]
set_property SLEW FAST [get_ports {ddram_dq[1]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_dq[1]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddram_dq[1]}]

# ddram:0.dq
set_property LOC B22 [get_ports {ddram_dq[2]}]
set_property SLEW FAST [get_ports {ddram_dq[2]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_dq[2]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddram_dq[2]}]

# ddram:0.dq
set_property LOC B21 [get_ports {ddram_dq[3]}]
set_property SLEW FAST [get_ports {ddram_dq[3]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_dq[3]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddram_dq[3]}]

# ddram:0.dq
set_property LOC D19 [get_ports {ddram_dq[4]}]
set_property SLEW FAST [get_ports {ddram_dq[4]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_dq[4]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddram_dq[4]}]

# ddram:0.dq
set_property LOC E20 [get_ports {ddram_dq[5]}]
set_property SLEW FAST [get_ports {ddram_dq[5]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_dq[5]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddram_dq[5]}]

# ddram:0.dq
set_property LOC C19 [get_ports {ddram_dq[6]}]
set_property SLEW FAST [get_ports {ddram_dq[6]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_dq[6]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddram_dq[6]}]

# ddram:0.dq
set_property LOC D20 [get_ports {ddram_dq[7]}]
set_property SLEW FAST [get_ports {ddram_dq[7]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_dq[7]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddram_dq[7]}]

# ddram:0.dq
set_property LOC C23 [get_ports {ddram_dq[8]}]
set_property SLEW FAST [get_ports {ddram_dq[8]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_dq[8]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddram_dq[8]}]

# ddram:0.dq
set_property LOC D23 [get_ports {ddram_dq[9]}]
set_property SLEW FAST [get_ports {ddram_dq[9]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_dq[9]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddram_dq[9]}]

# ddram:0.dq
set_property LOC B24 [get_ports {ddram_dq[10]}]
set_property SLEW FAST [get_ports {ddram_dq[10]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_dq[10]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddram_dq[10]}]

# ddram:0.dq
set_property LOC B25 [get_ports {ddram_dq[11]}]
set_property SLEW FAST [get_ports {ddram_dq[11]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_dq[11]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddram_dq[11]}]

# ddram:0.dq
set_property LOC C24 [get_ports {ddram_dq[12]}]
set_property SLEW FAST [get_ports {ddram_dq[12]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_dq[12]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddram_dq[12]}]

# ddram:0.dq
set_property LOC C26 [get_ports {ddram_dq[13]}]
set_property SLEW FAST [get_ports {ddram_dq[13]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_dq[13]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddram_dq[13]}]

# ddram:0.dq
set_property LOC A25 [get_ports {ddram_dq[14]}]
set_property SLEW FAST [get_ports {ddram_dq[14]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_dq[14]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddram_dq[14]}]

# ddram:0.dq
set_property LOC B26 [get_ports {ddram_dq[15]}]
set_property SLEW FAST [get_ports {ddram_dq[15]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_dq[15]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddram_dq[15]}]

# ddram:0.dqs_p
set_property LOC B20 [get_ports {ddram_dqs_p[0]}]
set_property SLEW FAST [get_ports {ddram_dqs_p[0]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram_dqs_p[0]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddram_dqs_p[0]}]

# ddram:0.dqs_p
set_property LOC A23 [get_ports {ddram_dqs_p[1]}]
set_property SLEW FAST [get_ports {ddram_dqs_p[1]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram_dqs_p[1]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddram_dqs_p[1]}]

# ddram:0.dqs_n
set_property LOC A20 [get_ports {ddram_dqs_n[0]}]
set_property SLEW FAST [get_ports {ddram_dqs_n[0]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram_dqs_n[0]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddram_dqs_n[0]}]

# ddram:0.dqs_n
set_property LOC A24 [get_ports {ddram_dqs_n[1]}]
set_property SLEW FAST [get_ports {ddram_dqs_n[1]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram_dqs_n[1]}]
set_property IN_TERM UNTUNED_SPLIT_40 [get_ports {ddram_dqs_n[1]}]

# ddram:0.clk_p
set_property LOC F18 [get_ports {ddram_clk_p}]
set_property SLEW FAST [get_ports {ddram_clk_p}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram_clk_p}]

# ddram:0.clk_n
set_property LOC F19 [get_ports {ddram_clk_n}]
set_property SLEW FAST [get_ports {ddram_clk_n}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram_clk_n}]

# ddram:0.cke
set_property LOC E18 [get_ports {ddram_cke}]
set_property SLEW FAST [get_ports {ddram_cke}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_cke}]

# ddram:0.odt
set_property LOC G19 [get_ports {ddram_odt}]
set_property SLEW FAST [get_ports {ddram_odt}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_odt}]

# ddram:0.reset_n
set_property LOC H17 [get_ports {ddram_reset_n}]
set_property SLEW FAST [get_ports {ddram_reset_n}]
set_property IOSTANDARD SSTL15 [get_ports {ddram_reset_n}]

# user_led:0
set_property LOC P23 [get_ports {user_led0}]
set_property IOSTANDARD LVCMOS33 [get_ports {user_led0}]

# user_led:1
set_property LOC P24 [get_ports {user_led1}]
set_property IOSTANDARD LVCMOS33 [get_ports {user_led1}]

# user_led:2
set_property LOC N21 [get_ports {user_led2}]
set_property IOSTANDARD LVCMOS33 [get_ports {user_led2}]

# user_led:3
set_property LOC N22 [get_ports {user_led3}]
set_property IOSTANDARD LVCMOS33 [get_ports {user_led3}]

# user_led:4
set_property LOC M24 [get_ports {user_led4}]
set_property IOSTANDARD LVCMOS33 [get_ports {user_led4}]

################################################################################
# Design constraints
################################################################################

#set_property INTERNAL_VREF 0.750 [get_iobanks 16]

#set_property CFGBVS VCCO [current_design]

#set_property CONFIG_VOLTAGE 3.3 [current_design]

################################################################################
# Clock constraints
################################################################################


create_clock -name clk50 -period 20.0 [get_ports clk50]

#set_clock_groups -group [get_clocks -include_generated_clocks -of [get_nets sys_clk]] -group [get_clocks -include_generated_clocks -of [get_nets main_crg_clkin]] -asynchronous

################################################################################
# False path constraints
################################################################################


#set_false_path -quiet -through [get_nets -hierarchical -filter {mr_ff == TRUE}]

#set_false_path -quiet -to [get_pins -filter {REF_PIN_NAME == PRE} -of_objects [get_cells -hierarchical -filter {ars_ff1 == TRUE || ars_ff2 == TRUE}]]

#set_max_delay 2 -quiet -from [get_pins -filter {REF_PIN_NAME == C} -of_objects [get_cells -hierarchical -filter {ars_ff1 == TRUE}]] -to [get_pins -filter {REF_PIN_NAME == D} -of_objects [get_cells -hierarchical -filter {ars_ff2 == TRUE}]]