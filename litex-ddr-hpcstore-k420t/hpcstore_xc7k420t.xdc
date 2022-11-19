################################################################################
# IO constraints
################################################################################
# clk100:0
set_property LOC U24 [get_ports {clk100}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk100}]

# cpu_reset_n:0
set_property LOC J24 [get_ports {cpu_reset_n}]
set_property IOSTANDARD LVCMOS15 [get_ports {cpu_reset_n}]

# serial:0.tx
set_property LOC D16 [get_ports {serial_tx}]
set_property IOSTANDARD LVCMOS33 [get_ports {serial_tx}]

# serial:0.rx
set_property LOC D17 [get_ports {serial_rx}]
set_property IOSTANDARD LVCMOS33 [get_ports {serial_rx}]

# ddram:0.a
set_property LOC F28 [get_ports {ddram0_a[0]}]
set_property SLEW FAST [get_ports {ddram0_a[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[0]}]

# ddram:0.a
set_property LOC E29 [get_ports {ddram0_a[1]}]
set_property SLEW FAST [get_ports {ddram0_a[1]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[1]}]

# ddram:0.a
set_property LOC F26 [get_ports {ddram0_a[2]}]
set_property SLEW FAST [get_ports {ddram0_a[2]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[2]}]

# ddram:0.a
set_property LOC D29 [get_ports {ddram0_a[3]}]
set_property SLEW FAST [get_ports {ddram0_a[3]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[3]}]

# ddram:0.a
set_property LOC B29 [get_ports {ddram0_a[4]}]
set_property SLEW FAST [get_ports {ddram0_a[4]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[4]}]

# ddram:0.a
set_property LOC C30 [get_ports {ddram0_a[5]}]
set_property SLEW FAST [get_ports {ddram0_a[5]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[5]}]

# ddram:0.a
set_property LOC A30 [get_ports {ddram0_a[6]}]
set_property SLEW FAST [get_ports {ddram0_a[6]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[6]}]

# ddram:0.a
set_property LOC B28 [get_ports {ddram0_a[7]}]
set_property SLEW FAST [get_ports {ddram0_a[7]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[7]}]

# ddram:0.a
set_property LOC C29 [get_ports {ddram0_a[8]}]
set_property SLEW FAST [get_ports {ddram0_a[8]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[8]}]

# ddram:0.a
set_property LOC B30 [get_ports {ddram0_a[9]}]
set_property SLEW FAST [get_ports {ddram0_a[9]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[9]}]

# ddram:0.a
set_property LOC E30 [get_ports {ddram0_a[10]}]
set_property SLEW FAST [get_ports {ddram0_a[10]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[10]}]

# ddram:0.a
set_property LOC E26 [get_ports {ddram0_a[11]}]
set_property SLEW FAST [get_ports {ddram0_a[11]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[11]}]

# ddram:0.a
set_property LOC A28 [get_ports {ddram0_a[12]}]
set_property SLEW FAST [get_ports {ddram0_a[12]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[12]}]

# ddram:0.a
set_property LOC H29 [get_ports {ddram0_a[13]}]
set_property SLEW FAST [get_ports {ddram0_a[13]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[13]}]

# ddram:0.a
set_property LOC F25 [get_ports {ddram0_a[14]}]
set_property SLEW FAST [get_ports {ddram0_a[14]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[14]}]

# ddram:0.ba
set_property LOC F30 [get_ports {ddram0_ba[0]}]
set_property SLEW FAST [get_ports {ddram0_ba[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_ba[0]}]

# ddram:0.ba
set_property LOC G28 [get_ports {ddram0_ba[1]}]
set_property SLEW FAST [get_ports {ddram0_ba[1]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_ba[1]}]

# ddram:0.ba
set_property LOC E28 [get_ports {ddram0_ba[2]}]
set_property SLEW FAST [get_ports {ddram0_ba[2]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_ba[2]}]

# ddram:0.ras_n
set_property LOC H27 [get_ports {ddram0_ras_n}]
set_property SLEW FAST [get_ports {ddram0_ras_n}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_ras_n}]

# ddram:0.cas_n
set_property LOC G30 [get_ports {ddram0_cas_n}]
set_property SLEW FAST [get_ports {ddram0_cas_n}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_cas_n}]

# ddram:0.we_n
set_property LOC G29 [get_ports {ddram0_we_n}]
set_property SLEW FAST [get_ports {ddram0_we_n}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_we_n}]

# ddram:0.cs_n
set_property LOC H30 [get_ports {ddram0_cs_n}]
set_property SLEW FAST [get_ports {ddram0_cs_n}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_cs_n}]

# ddram:0.dm
set_property LOC B22 [get_ports {ddram0_dm[0]}]
set_property SLEW FAST [get_ports {ddram0_dm[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dm[0]}]

# ddram:0.dm
set_property LOC E19 [get_ports {ddram0_dm[1]}]
set_property SLEW FAST [get_ports {ddram0_dm[1]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dm[1]}]

# ddram:0.dm
set_property LOC F22 [get_ports {ddram0_dm[2]}]
set_property SLEW FAST [get_ports {ddram0_dm[2]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dm[2]}]

# ddram:0.dm
set_property LOC K19 [get_ports {ddram0_dm[3]}]
set_property SLEW FAST [get_ports {ddram0_dm[3]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dm[3]}]

# ddram:0.dm
set_property LOC M23 [get_ports {ddram0_dm[4]}]
set_property SLEW FAST [get_ports {ddram0_dm[4]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dm[4]}]

# ddram:0.dm
set_property LOC P18 [get_ports {ddram0_dm[5]}]
set_property SLEW FAST [get_ports {ddram0_dm[5]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dm[5]}]

# ddram:0.dm
set_property LOC P26 [get_ports {ddram0_dm[6]}]
set_property SLEW FAST [get_ports {ddram0_dm[6]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dm[6]}]

# ddram:0.dm
set_property LOC N29 [get_ports {ddram0_dm[7]}]
set_property SLEW FAST [get_ports {ddram0_dm[7]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dm[7]}]

# ddram:0.dq
set_property LOC A21 [get_ports {ddram0_dq[0]}]
set_property SLEW FAST [get_ports {ddram0_dq[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[0]}]

# ddram:0.dq
set_property LOC A22 [get_ports {ddram0_dq[1]}]
set_property SLEW FAST [get_ports {ddram0_dq[1]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[1]}]

# ddram:0.dq
set_property LOC A23 [get_ports {ddram0_dq[2]}]
set_property SLEW FAST [get_ports {ddram0_dq[2]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[2]}]

# ddram:0.dq
set_property LOC B23 [get_ports {ddram0_dq[3]}]
set_property SLEW FAST [get_ports {ddram0_dq[3]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[3]}]

# ddram:0.dq
set_property LOC B19 [get_ports {ddram0_dq[4]}]
set_property SLEW FAST [get_ports {ddram0_dq[4]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[4]}]

# ddram:0.dq
set_property LOC C19 [get_ports {ddram0_dq[5]}]
set_property SLEW FAST [get_ports {ddram0_dq[5]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[5]}]

# ddram:0.dq
set_property LOC A20 [get_ports {ddram0_dq[6]}]
set_property SLEW FAST [get_ports {ddram0_dq[6]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[6]}]

# ddram:0.dq
set_property LOC B20 [get_ports {ddram0_dq[7]}]
set_property SLEW FAST [get_ports {ddram0_dq[7]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[7]}]

# ddram:0.dq
set_property LOC C21 [get_ports {ddram0_dq[8]}]
set_property SLEW FAST [get_ports {ddram0_dq[8]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[8]}]

# ddram:0.dq
set_property LOC D21 [get_ports {ddram0_dq[9]}]
set_property SLEW FAST [get_ports {ddram0_dq[9]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[9]}]

# ddram:0.dq
set_property LOC C22 [get_ports {ddram0_dq[10]}]
set_property SLEW FAST [get_ports {ddram0_dq[10]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[10]}]

# ddram:0.dq
set_property LOC D22 [get_ports {ddram0_dq[11]}]
set_property SLEW FAST [get_ports {ddram0_dq[11]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[11]}]

# ddram:0.dq
set_property LOC E18 [get_ports {ddram0_dq[12]}]
set_property SLEW FAST [get_ports {ddram0_dq[12]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[12]}]

# ddram:0.dq
set_property LOC D18 [get_ports {ddram0_dq[13]}]
set_property SLEW FAST [get_ports {ddram0_dq[13]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[13]}]

# ddram:0.dq
set_property LOC E20 [get_ports {ddram0_dq[14]}]
set_property SLEW FAST [get_ports {ddram0_dq[14]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[14]}]

# ddram:0.dq
set_property LOC E21 [get_ports {ddram0_dq[15]}]
set_property SLEW FAST [get_ports {ddram0_dq[15]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[15]}]

# ddram:0.dq
set_property LOC G18 [get_ports {ddram0_dq[16]}]
set_property SLEW FAST [get_ports {ddram0_dq[16]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[16]}]

# ddram:0.dq
set_property LOC F18 [get_ports {ddram0_dq[17]}]
set_property SLEW FAST [get_ports {ddram0_dq[17]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[17]}]

# ddram:0.dq
set_property LOC G20 [get_ports {ddram0_dq[18]}]
set_property SLEW FAST [get_ports {ddram0_dq[18]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[18]}]

# ddram:0.dq
set_property LOC F20 [get_ports {ddram0_dq[19]}]
set_property SLEW FAST [get_ports {ddram0_dq[19]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[19]}]

# ddram:0.dq
set_property LOC H20 [get_ports {ddram0_dq[20]}]
set_property SLEW FAST [get_ports {ddram0_dq[20]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[20]}]

# ddram:0.dq
set_property LOC G22 [get_ports {ddram0_dq[21]}]
set_property SLEW FAST [get_ports {ddram0_dq[21]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[21]}]

# ddram:0.dq
set_property LOC G23 [get_ports {ddram0_dq[22]}]
set_property SLEW FAST [get_ports {ddram0_dq[22]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[22]}]

# ddram:0.dq
set_property LOC F23 [get_ports {ddram0_dq[23]}]
set_property SLEW FAST [get_ports {ddram0_dq[23]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[23]}]

# ddram:0.dq
set_property LOC L18 [get_ports {ddram0_dq[24]}]
set_property SLEW FAST [get_ports {ddram0_dq[24]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[24]}]

# ddram:0.dq
set_property LOC J18 [get_ports {ddram0_dq[25]}]
set_property SLEW FAST [get_ports {ddram0_dq[25]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[25]}]

# ddram:0.dq
set_property LOC J19 [get_ports {ddram0_dq[26]}]
set_property SLEW FAST [get_ports {ddram0_dq[26]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[26]}]

# ddram:0.dq
set_property LOC K20 [get_ports {ddram0_dq[27]}]
set_property SLEW FAST [get_ports {ddram0_dq[27]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[27]}]

# ddram:0.dq
set_property LOC J22 [get_ports {ddram0_dq[28]}]
set_property SLEW FAST [get_ports {ddram0_dq[28]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[28]}]

# ddram:0.dq
set_property LOC H22 [get_ports {ddram0_dq[29]}]
set_property SLEW FAST [get_ports {ddram0_dq[29]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[29]}]

# ddram:0.dq
set_property LOC K23 [get_ports {ddram0_dq[30]}]
set_property SLEW FAST [get_ports {ddram0_dq[30]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[30]}]

# ddram:0.dq
set_property LOC J23 [get_ports {ddram0_dq[31]}]
set_property SLEW FAST [get_ports {ddram0_dq[31]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[31]}]

# ddram:0.dq
set_property LOC N24 [get_ports {ddram0_dq[32]}]
set_property SLEW FAST [get_ports {ddram0_dq[32]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[32]}]

# ddram:0.dq
set_property LOC N22 [get_ports {ddram0_dq[33]}]
set_property SLEW FAST [get_ports {ddram0_dq[33]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[33]}]

# ddram:0.dq
set_property LOC P24 [get_ports {ddram0_dq[34]}]
set_property SLEW FAST [get_ports {ddram0_dq[34]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[34]}]

# ddram:0.dq
set_property LOC P23 [get_ports {ddram0_dq[35]}]
set_property SLEW FAST [get_ports {ddram0_dq[35]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[35]}]

# ddram:0.dq
set_property LOC L20 [get_ports {ddram0_dq[36]}]
set_property SLEW FAST [get_ports {ddram0_dq[36]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[36]}]

# ddram:0.dq
set_property LOC M22 [get_ports {ddram0_dq[37]}]
set_property SLEW FAST [get_ports {ddram0_dq[37]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[37]}]

# ddram:0.dq
set_property LOC M24 [get_ports {ddram0_dq[38]}]
set_property SLEW FAST [get_ports {ddram0_dq[38]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[38]}]

# ddram:0.dq
set_property LOC N25 [get_ports {ddram0_dq[39]}]
set_property SLEW FAST [get_ports {ddram0_dq[39]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[39]}]

# ddram:0.dq
set_property LOC M17 [get_ports {ddram0_dq[40]}]
set_property SLEW FAST [get_ports {ddram0_dq[40]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[40]}]

# ddram:0.dq
set_property LOC N19 [get_ports {ddram0_dq[41]}]
set_property SLEW FAST [get_ports {ddram0_dq[41]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[41]}]

# ddram:0.dq
set_property LOC N17 [get_ports {ddram0_dq[42]}]
set_property SLEW FAST [get_ports {ddram0_dq[42]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[42]}]

# ddram:0.dq
set_property LOC P17 [get_ports {ddram0_dq[43]}]
set_property SLEW FAST [get_ports {ddram0_dq[43]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[43]}]

# ddram:0.dq
set_property LOC N20 [get_ports {ddram0_dq[44]}]
set_property SLEW FAST [get_ports {ddram0_dq[44]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[44]}]

# ddram:0.dq
set_property LOC N21 [get_ports {ddram0_dq[45]}]
set_property SLEW FAST [get_ports {ddram0_dq[45]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[45]}]

# ddram:0.dq
set_property LOC P21 [get_ports {ddram0_dq[46]}]
set_property SLEW FAST [get_ports {ddram0_dq[46]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[46]}]

# ddram:0.dq
set_property LOC P19 [get_ports {ddram0_dq[47]}]
set_property SLEW FAST [get_ports {ddram0_dq[47]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[47]}]

# ddram:0.dq
set_property LOC K26 [get_ports {ddram0_dq[48]}]
set_property SLEW FAST [get_ports {ddram0_dq[48]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[48]}]

# ddram:0.dq
set_property LOC K25 [get_ports {ddram0_dq[49]}]
set_property SLEW FAST [get_ports {ddram0_dq[49]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[49]}]

# ddram:0.dq
set_property LOC L26 [get_ports {ddram0_dq[50]}]
set_property SLEW FAST [get_ports {ddram0_dq[50]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[50]}]

# ddram:0.dq
set_property LOC L25 [get_ports {ddram0_dq[51]}]
set_property SLEW FAST [get_ports {ddram0_dq[51]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[51]}]

# ddram:0.dq
set_property LOC M25 [get_ports {ddram0_dq[52]}]
set_property SLEW FAST [get_ports {ddram0_dq[52]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[52]}]

# ddram:0.dq
set_property LOC N26 [get_ports {ddram0_dq[53]}]
set_property SLEW FAST [get_ports {ddram0_dq[53]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[53]}]

# ddram:0.dq
set_property LOC P28 [get_ports {ddram0_dq[54]}]
set_property SLEW FAST [get_ports {ddram0_dq[54]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[54]}]

# ddram:0.dq
set_property LOC P27 [get_ports {ddram0_dq[55]}]
set_property SLEW FAST [get_ports {ddram0_dq[55]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[55]}]

# ddram:0.dq
set_property LOC L30 [get_ports {ddram0_dq[56]}]
set_property SLEW FAST [get_ports {ddram0_dq[56]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[56]}]

# ddram:0.dq
set_property LOC M29 [get_ports {ddram0_dq[57]}]
set_property SLEW FAST [get_ports {ddram0_dq[57]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[57]}]

# ddram:0.dq
set_property LOC P29 [get_ports {ddram0_dq[58]}]
set_property SLEW FAST [get_ports {ddram0_dq[58]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[58]}]

# ddram:0.dq
set_property LOC R29 [get_ports {ddram0_dq[59]}]
set_property SLEW FAST [get_ports {ddram0_dq[59]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[59]}]

# ddram:0.dq
set_property LOC K28 [get_ports {ddram0_dq[60]}]
set_property SLEW FAST [get_ports {ddram0_dq[60]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[60]}]

# ddram:0.dq
set_property LOC K29 [get_ports {ddram0_dq[61]}]
set_property SLEW FAST [get_ports {ddram0_dq[61]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[61]}]

# ddram:0.dq
set_property LOC K30 [get_ports {ddram0_dq[62]}]
set_property SLEW FAST [get_ports {ddram0_dq[62]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[62]}]

# ddram:0.dq
set_property LOC M28 [get_ports {ddram0_dq[63]}]
set_property SLEW FAST [get_ports {ddram0_dq[63]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[63]}]

# ddram:0.dqs_p
set_property LOC B18 [get_ports {ddram0_dqs_p[0]}]
set_property SLEW FAST [get_ports {ddram0_dqs_p[0]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram0_dqs_p[0]}]

# ddram:0.dqs_p
set_property LOC E23 [get_ports {ddram0_dqs_p[1]}]
set_property SLEW FAST [get_ports {ddram0_dqs_p[1]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram0_dqs_p[1]}]

# ddram:0.dqs_p
set_property LOC H19 [get_ports {ddram0_dqs_p[2]}]
set_property SLEW FAST [get_ports {ddram0_dqs_p[2]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram0_dqs_p[2]}]

# ddram:0.dqs_p
set_property LOC K21 [get_ports {ddram0_dqs_p[3]}]
set_property SLEW FAST [get_ports {ddram0_dqs_p[3]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram0_dqs_p[3]}]

# ddram:0.dqs_n
set_property LOC A18 [get_ports {ddram0_dqs_n[0]}]
set_property SLEW FAST [get_ports {ddram0_dqs_n[0]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram0_dqs_n[0]}]

# ddram:0.dqs_n
set_property LOC D23 [get_ports {ddram0_dqs_n[1]}]
set_property SLEW FAST [get_ports {ddram0_dqs_n[1]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram0_dqs_n[1]}]

# ddram:0.dqs_n
set_property LOC G19 [get_ports {ddram0_dqs_n[2]}]
set_property SLEW FAST [get_ports {ddram0_dqs_n[2]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram0_dqs_n[2]}]

# ddram:0.dqs_n
set_property LOC J21 [get_ports {ddram0_dqs_n[3]}]
set_property SLEW FAST [get_ports {ddram0_dqs_n[3]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram0_dqs_n[3]}]

# ddram:0.clk_p
set_property LOC J26 [get_ports {ddram0_clk_p}]
set_property SLEW FAST [get_ports {ddram0_clk_p}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram0_clk_p}]
set_property IO_BUFFER_TYPE NONE [get_ports {ddram0_clk_p}]

# ddram:0.clk_n
set_property LOC J27 [get_ports {ddram0_clk_n}]
set_property SLEW FAST [get_ports {ddram0_clk_n}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram0_clk_n}]
set_property IO_BUFFER_TYPE NONE [get_ports {ddram0_clk_n}]

# ddram:0.cke
set_property LOC G25 [get_ports {ddram0_cke}]
set_property SLEW FAST [get_ports {ddram0_cke}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_cke}]

# ddram:0.odt
set_property LOC J28 [get_ports {ddram0_odt}]
set_property SLEW FAST [get_ports {ddram0_odt}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_odt}]

# ddram:0.reset_n
set_property LOC F27 [get_ports {ddram0_reset_n}]
set_property SLEW FAST [get_ports {ddram0_reset_n}]
set_property IOSTANDARD LVCMOS15 [get_ports {ddram0_reset_n}]

# user_led_n:0
set_property LOC A27 [get_ports {user_led_n0}]
set_property IOSTANDARD LVCMOS15 [get_ports {user_led_n0}]

# user_led_n:1
set_property LOC E24 [get_ports {user_led_n1}]
set_property IOSTANDARD LVCMOS15 [get_ports {user_led_n1}]

# user_led_n:2
set_property LOC G24 [get_ports {user_led_n2}]
set_property IOSTANDARD LVCMOS15 [get_ports {user_led_n2}]

# user_led_n:3
set_property LOC H21 [get_ports {user_led_n3}]
set_property IOSTANDARD LVCMOS15 [get_ports {user_led_n3}]

# user_led_n:4
set_property LOC G27 [get_ports {user_led_n4}]
set_property IOSTANDARD LVCMOS15 [get_ports {user_led_n4}]

# user_led_n:5
set_property LOC H26 [get_ports {user_led_n5}]
set_property IOSTANDARD LVCMOS15 [get_ports {user_led_n5}]

# user_led_n:6
set_property LOC H25 [get_ports {user_led_n6}]
set_property IOSTANDARD LVCMOS15 [get_ports {user_led_n6}]

# user_led_n:7
set_property LOC H24 [get_ports {user_led_n7}]
set_property IOSTANDARD LVCMOS15 [get_ports {user_led_n7}]

# i2c:0.scl
set_property LOC C17 [get_ports {i2c_scl}]
set_property IOSTANDARD LVCMOS33 [get_ports {i2c_scl}]

# i2c:0.sda
set_property LOC C16 [get_ports {i2c_sda}]
set_property IOSTANDARD LVCMOS33 [get_ports {i2c_sda}]

################################################################################
# Design constraints
################################################################################


set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]

#set_property INTERNAL_VREF 0.750 [get_iobanks 11]
#set_property INTERNAL_VREF 0.750 [get_iobanks 12]
#set_property INTERNAL_VREF 0.750 [get_iobanks 13]
#set_property INTERNAL_VREF 0.750 [get_iobanks 16]
#set_property INTERNAL_VREF 0.750 [get_iobanks 17]

################################################################################
# Clock constraints
################################################################################


create_clock -name clk100 -period 10.0 [get_ports clk100]

set_clock_groups -group [get_clocks -include_generated_clocks -of [get_nets sys_clk]] -group [get_clocks -include_generated_clocks -of [get_nets main_crg_clkin0]] -asynchronous

################################################################################
# False path constraints
################################################################################


set_false_path -quiet -through [get_nets -hierarchical -filter {mr_ff == TRUE}]

set_false_path -quiet -to [get_pins -filter {REF_PIN_NAME == PRE} -of_objects [get_cells -hierarchical -filter {ars_ff1 == TRUE || ars_ff2 == TRUE}]]

set_max_delay 2 -quiet -from [get_pins -filter {REF_PIN_NAME == C} -of_objects [get_cells -hierarchical -filter {ars_ff1 == TRUE}]] -to [get_pins -filter {REF_PIN_NAME == D} -of_objects [get_cells -hierarchical -filter {ars_ff2 == TRUE}]]
