################################################################################
# IO constraints
################################################################################
# serial:0.rx
set_property LOC B12 [get_ports {serial_rx}]
set_property IOSTANDARD LVCMOS33 [get_ports {serial_rx}]

# serial:0.tx
set_property LOC B11 [get_ports {serial_tx}]
set_property IOSTANDARD LVCMOS33 [get_ports {serial_tx}]

# cpu_reset:0
set_property LOC AD21 [get_ports {cpu_reset}]
set_property IOSTANDARD LVCMOS33 [get_ports {cpu_reset}]

# clk50:0
set_property LOC F22 [get_ports {clk50}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk50}]

# ddram:0.a
set_property LOC AF5 [get_ports {ddram0_a[0]}]
set_property SLEW FAST [get_ports {ddram0_a[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[0]}]

# ddram:0.a
set_property LOC AF2 [get_ports {ddram0_a[1]}]
set_property SLEW FAST [get_ports {ddram0_a[1]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[1]}]

# ddram:0.a
set_property LOC AD6 [get_ports {ddram0_a[2]}]
set_property SLEW FAST [get_ports {ddram0_a[2]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[2]}]

# ddram:0.a
set_property LOC AC6 [get_ports {ddram0_a[3]}]
set_property SLEW FAST [get_ports {ddram0_a[3]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[3]}]

# ddram:0.a
set_property LOC AD4 [get_ports {ddram0_a[4]}]
set_property SLEW FAST [get_ports {ddram0_a[4]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[4]}]

# ddram:0.a
set_property LOC AB6 [get_ports {ddram0_a[5]}]
set_property SLEW FAST [get_ports {ddram0_a[5]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[5]}]

# ddram:0.a
set_property LOC AE2 [get_ports {ddram0_a[6]}]
set_property SLEW FAST [get_ports {ddram0_a[6]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[6]}]

# ddram:0.a
set_property LOC Y5 [get_ports {ddram0_a[7]}]
set_property SLEW FAST [get_ports {ddram0_a[7]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[7]}]

# ddram:0.a
set_property LOC AA4 [get_ports {ddram0_a[8]}]
set_property SLEW FAST [get_ports {ddram0_a[8]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[8]}]

# ddram:0.a
set_property LOC AE6 [get_ports {ddram0_a[9]}]
set_property SLEW FAST [get_ports {ddram0_a[9]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[9]}]

# ddram:0.a
set_property LOC AE3 [get_ports {ddram0_a[10]}]
set_property SLEW FAST [get_ports {ddram0_a[10]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[10]}]

# ddram:0.a
set_property LOC AD5 [get_ports {ddram0_a[11]}]
set_property SLEW FAST [get_ports {ddram0_a[11]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[11]}]

# ddram:0.a
set_property LOC AB4 [get_ports {ddram0_a[12]}]
set_property SLEW FAST [get_ports {ddram0_a[12]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[12]}]

# ddram:0.a
set_property LOC Y6 [get_ports {ddram0_a[13]}]
set_property SLEW FAST [get_ports {ddram0_a[13]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[13]}]

# ddram:0.ba
set_property LOC AD3 [get_ports {ddram0_ba[0]}]
set_property SLEW FAST [get_ports {ddram0_ba[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_ba[0]}]

# ddram:0.ba
set_property LOC AE1 [get_ports {ddram0_ba[1]}]
set_property SLEW FAST [get_ports {ddram0_ba[1]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_ba[1]}]

# ddram:0.ba
set_property LOC AE5 [get_ports {ddram0_ba[2]}]
set_property SLEW FAST [get_ports {ddram0_ba[2]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_ba[2]}]

# ddram:0.ras_n
set_property LOC AC3 [get_ports {ddram0_ras_n}]
set_property SLEW FAST [get_ports {ddram0_ras_n}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_ras_n}]

# ddram:0.cas_n
set_property LOC AC4 [get_ports {ddram0_cas_n}]
set_property SLEW FAST [get_ports {ddram0_cas_n}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_cas_n}]

# ddram:0.we_n
set_property LOC AF4 [get_ports {ddram0_we_n}]
set_property SLEW FAST [get_ports {ddram0_we_n}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_we_n}]

# ddram:0.dm
set_property LOC V1 [get_ports {ddram0_dm[0]}]
set_property SLEW FAST [get_ports {ddram0_dm[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dm[0]}]

# ddram:0.dm
set_property LOC V3 [get_ports {ddram0_dm[1]}]
set_property SLEW FAST [get_ports {ddram0_dm[1]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dm[1]}]

# ddram:0.dq
set_property LOC W1 [get_ports {ddram0_dq[0]}]
set_property SLEW FAST [get_ports {ddram0_dq[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[0]}]

# ddram:0.dq
set_property LOC V2 [get_ports {ddram0_dq[1]}]
set_property SLEW FAST [get_ports {ddram0_dq[1]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[1]}]

# ddram:0.dq
set_property LOC Y1 [get_ports {ddram0_dq[2]}]
set_property SLEW FAST [get_ports {ddram0_dq[2]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[2]}]

# ddram:0.dq
set_property LOC Y3 [get_ports {ddram0_dq[3]}]
set_property SLEW FAST [get_ports {ddram0_dq[3]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[3]}]

# ddram:0.dq
set_property LOC AC2 [get_ports {ddram0_dq[4]}]
set_property SLEW FAST [get_ports {ddram0_dq[4]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[4]}]

# ddram:0.dq
set_property LOC Y2 [get_ports {ddram0_dq[5]}]
set_property SLEW FAST [get_ports {ddram0_dq[5]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[5]}]

# ddram:0.dq
set_property LOC AB2 [get_ports {ddram0_dq[6]}]
set_property SLEW FAST [get_ports {ddram0_dq[6]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[6]}]

# ddram:0.dq
set_property LOC AA3 [get_ports {ddram0_dq[7]}]
set_property SLEW FAST [get_ports {ddram0_dq[7]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[7]}]

# ddram:0.dq
set_property LOC U1 [get_ports {ddram0_dq[8]}]
set_property SLEW FAST [get_ports {ddram0_dq[8]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[8]}]

# ddram:0.dq
set_property LOC V4 [get_ports {ddram0_dq[9]}]
set_property SLEW FAST [get_ports {ddram0_dq[9]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[9]}]

# ddram:0.dq
set_property LOC U6 [get_ports {ddram0_dq[10]}]
set_property SLEW FAST [get_ports {ddram0_dq[10]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[10]}]

# ddram:0.dq
set_property LOC W3 [get_ports {ddram0_dq[11]}]
set_property SLEW FAST [get_ports {ddram0_dq[11]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[11]}]

# ddram:0.dq
set_property LOC V6 [get_ports {ddram0_dq[12]}]
set_property SLEW FAST [get_ports {ddram0_dq[12]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[12]}]

# ddram:0.dq
set_property LOC U2 [get_ports {ddram0_dq[13]}]
set_property SLEW FAST [get_ports {ddram0_dq[13]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[13]}]

# ddram:0.dq
set_property LOC U7 [get_ports {ddram0_dq[14]}]
set_property SLEW FAST [get_ports {ddram0_dq[14]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[14]}]

# ddram:0.dq
set_property LOC U5 [get_ports {ddram0_dq[15]}]
set_property SLEW FAST [get_ports {ddram0_dq[15]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[15]}]

# ddram:0.dqs_p
set_property LOC AB1 [get_ports {ddram0_dqs_p[0]}]
set_property SLEW FAST [get_ports {ddram0_dqs_p[0]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram0_dqs_p[0]}]

# ddram:0.dqs_p
set_property LOC W6 [get_ports {ddram0_dqs_p[1]}]
set_property SLEW FAST [get_ports {ddram0_dqs_p[1]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram0_dqs_p[1]}]

# ddram:0.dqs_n
set_property LOC AC1 [get_ports {ddram0_dqs_n[0]}]
set_property SLEW FAST [get_ports {ddram0_dqs_n[0]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram0_dqs_n[0]}]

# ddram:0.dqs_n
set_property LOC W5 [get_ports {ddram0_dqs_n[1]}]
set_property SLEW FAST [get_ports {ddram0_dqs_n[1]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram0_dqs_n[1]}]

# ddram:0.clk_p
set_property LOC AA5 [get_ports {ddram0_clk_p}]
set_property SLEW FAST [get_ports {ddram0_clk_p}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram0_clk_p}]

# ddram:0.clk_n
set_property LOC AB5 [get_ports {ddram0_clk_n}]
set_property SLEW FAST [get_ports {ddram0_clk_n}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram0_clk_n}]

# ddram:0.cke
set_property LOC AD1 [get_ports {ddram0_cke}]
set_property SLEW FAST [get_ports {ddram0_cke}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_cke}]

# ddram:0.odt
set_property LOC AF3 [get_ports {ddram0_odt}]
set_property SLEW FAST [get_ports {ddram0_odt}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_odt}]

# ddram:0.reset_n
set_property LOC W4 [get_ports {ddram0_reset_n}]
set_property SLEW FAST [get_ports {ddram0_reset_n}]
set_property IOSTANDARD LVCMOS15 [get_ports {ddram0_reset_n}]

# user_led:0
set_property LOC A18 [get_ports {user_led0}]
set_property IOSTANDARD LVCMOS33 [get_ports {user_led0}]

# user_led:1
set_property LOC A19 [get_ports {user_led1}]
set_property IOSTANDARD LVCMOS33 [get_ports {user_led1}]

# user_led:2
set_property LOC C17 [get_ports {user_led2}]
set_property IOSTANDARD LVCMOS33 [get_ports {user_led2}]

# user_led:3
set_property LOC C18 [get_ports {user_led3}]
set_property IOSTANDARD LVCMOS33 [get_ports {user_led3}]

# user_led:4
set_property LOC E18 [get_ports {user_led4}]
set_property IOSTANDARD LVCMOS33 [get_ports {user_led4}]

# seven_seg:0
set_property LOC B16 [get_ports {seven_seg0[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seven_seg0[0]}]

# seven_seg:0
set_property LOC C14 [get_ports {seven_seg0[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seven_seg0[1]}]

# seven_seg:0
set_property LOC B15 [get_ports {seven_seg0[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seven_seg0[2]}]

# seven_seg:0
set_property LOC C16 [get_ports {seven_seg0[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seven_seg0[3]}]

# seven_seg:0
set_property LOC B17 [get_ports {seven_seg0[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seven_seg0[4]}]

# seven_seg:0
set_property LOC D16 [get_ports {seven_seg0[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seven_seg0[5]}]

# seven_seg:0
set_property LOC C13 [get_ports {seven_seg0[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seven_seg0[6]}]

# seven_seg:0
set_property LOC D15 [get_ports {seven_seg0[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seven_seg0[7]}]

# seven_seg_ctl:0
set_property LOC A17 [get_ports {seven_seg_ctl0}]
set_property IOSTANDARD LVCMOS33 [get_ports {seven_seg_ctl0}]

# seven_seg_ctl:1
set_property LOC A15 [get_ports {seven_seg_ctl1}]
set_property IOSTANDARD LVCMOS33 [get_ports {seven_seg_ctl1}]

# seven_seg_ctl:2
set_property LOC D18 [get_ports {seven_seg_ctl2}]
set_property IOSTANDARD LVCMOS33 [get_ports {seven_seg_ctl2}]

################################################################################
# Design constraints
################################################################################

#set_property INTERNAL_VREF 0.750 [get_iobanks 34]

#set_property INTERNAL_VREF 0.90  [get_iobanks 33]

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