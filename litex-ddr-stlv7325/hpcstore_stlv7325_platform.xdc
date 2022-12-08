################################################################################
# IO constraints
################################################################################
# clk200:0.p
set_property LOC AB11 [get_ports {clk200_p}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {clk200_p}]

# clk200:0.n
set_property LOC AC11 [get_ports {clk200_n}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {clk200_n}]

# clk100:0
set_property LOC F17 [get_ports {clk100}]
set_property IOSTANDARD LVCMOS15 [get_ports {clk100}]

# cpu_reset_n:0
set_property LOC AC16 [get_ports {cpu_reset_n}]
set_property IOSTANDARD LVCMOS15 [get_ports {cpu_reset_n}]

# serial:0.tx
set_property LOC M25 [get_ports {serial_tx}]
set_property IOSTANDARD LVCMOS33 [get_ports {serial_tx}]

# serial:0.rx
set_property LOC L25 [get_ports {serial_rx}]
set_property IOSTANDARD LVCMOS33 [get_ports {serial_rx}]

# ddram:0.a
set_property LOC AB7 [get_ports {ddram0_a[0]}]
set_property SLEW FAST [get_ports {ddram0_a[0]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_a[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[0]}]

# ddram:0.a
set_property LOC AD11 [get_ports {ddram0_a[1]}]
set_property SLEW FAST [get_ports {ddram0_a[1]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_a[1]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[1]}]

# ddram:0.a
set_property LOC AA8 [get_ports {ddram0_a[2]}]
set_property SLEW FAST [get_ports {ddram0_a[2]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_a[2]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[2]}]

# ddram:0.a
set_property LOC AF10 [get_ports {ddram0_a[3]}]
set_property SLEW FAST [get_ports {ddram0_a[3]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_a[3]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[3]}]

# ddram:0.a
set_property LOC AC7 [get_ports {ddram0_a[4]}]
set_property SLEW FAST [get_ports {ddram0_a[4]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_a[4]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[4]}]

# ddram:0.a
set_property LOC AE11 [get_ports {ddram0_a[5]}]
set_property SLEW FAST [get_ports {ddram0_a[5]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_a[5]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[5]}]

# ddram:0.a
set_property LOC AC8 [get_ports {ddram0_a[6]}]
set_property SLEW FAST [get_ports {ddram0_a[6]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_a[6]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[6]}]

# ddram:0.a
set_property LOC AD8 [get_ports {ddram0_a[7]}]
set_property SLEW FAST [get_ports {ddram0_a[7]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_a[7]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[7]}]

# ddram:0.a
set_property LOC AC13 [get_ports {ddram0_a[8]}]
set_property SLEW FAST [get_ports {ddram0_a[8]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_a[8]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[8]}]

# ddram:0.a
set_property LOC AF12 [get_ports {ddram0_a[9]}]
set_property SLEW FAST [get_ports {ddram0_a[9]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_a[9]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[9]}]

# ddram:0.a
set_property LOC AF9 [get_ports {ddram0_a[10]}]
set_property SLEW FAST [get_ports {ddram0_a[10]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_a[10]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[10]}]

# ddram:0.a
set_property LOC AD10 [get_ports {ddram0_a[11]}]
set_property SLEW FAST [get_ports {ddram0_a[11]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_a[11]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[11]}]

# ddram:0.a
set_property LOC AE13 [get_ports {ddram0_a[12]}]
set_property SLEW FAST [get_ports {ddram0_a[12]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_a[12]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[12]}]

# ddram:0.a
set_property LOC AF7 [get_ports {ddram0_a[13]}]
set_property SLEW FAST [get_ports {ddram0_a[13]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_a[13]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[13]}]

# ddram:0.a
set_property LOC AB12 [get_ports {ddram0_a[14]}]
set_property SLEW FAST [get_ports {ddram0_a[14]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_a[14]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_a[14]}]

# ddram:0.ba
set_property LOC AE8 [get_ports {ddram0_ba[0]}]
set_property SLEW FAST [get_ports {ddram0_ba[0]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_ba[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_ba[0]}]

# ddram:0.ba
set_property LOC AA7 [get_ports {ddram0_ba[1]}]
set_property SLEW FAST [get_ports {ddram0_ba[1]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_ba[1]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_ba[1]}]

# ddram:0.ba
set_property LOC AF13 [get_ports {ddram0_ba[2]}]
set_property SLEW FAST [get_ports {ddram0_ba[2]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_ba[2]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_ba[2]}]

# ddram:0.ras_n
set_property LOC Y7 [get_ports {ddram0_ras_n}]
set_property SLEW FAST [get_ports {ddram0_ras_n}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_ras_n}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_ras_n}]

# ddram:0.cas_n
set_property LOC AE7 [get_ports {ddram0_cas_n}]
set_property SLEW FAST [get_ports {ddram0_cas_n}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_cas_n}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_cas_n}]

# ddram:0.we_n
set_property LOC AF8 [get_ports {ddram0_we_n}]
set_property SLEW FAST [get_ports {ddram0_we_n}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_we_n}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_we_n}]

# ddram:0.cs_n
set_property LOC AA13 [get_ports {ddram0_cs_n}]
set_property SLEW FAST [get_ports {ddram0_cs_n}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_cs_n}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_cs_n}]

# ddram:0.dm
set_property LOC AD16 [get_ports {ddram0_dm[0]}]
set_property SLEW FAST [get_ports {ddram0_dm[0]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dm[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dm[0]}]

# ddram:0.dm
set_property LOC AB16 [get_ports {ddram0_dm[1]}]
set_property SLEW FAST [get_ports {ddram0_dm[1]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dm[1]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dm[1]}]

# ddram:0.dm
set_property LOC AB19 [get_ports {ddram0_dm[2]}]
set_property SLEW FAST [get_ports {ddram0_dm[2]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dm[2]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dm[2]}]

# ddram:0.dm
set_property LOC V17 [get_ports {ddram0_dm[3]}]
set_property SLEW FAST [get_ports {ddram0_dm[3]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dm[3]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dm[3]}]

# ddram:0.dm
set_property LOC U1 [get_ports {ddram0_dm[4]}]
set_property SLEW FAST [get_ports {ddram0_dm[4]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dm[4]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dm[4]}]

# ddram:0.dm
set_property LOC AA3 [get_ports {ddram0_dm[5]}]
set_property SLEW FAST [get_ports {ddram0_dm[5]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dm[5]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dm[5]}]

# ddram:0.dm
set_property LOC AD6 [get_ports {ddram0_dm[6]}]
set_property SLEW FAST [get_ports {ddram0_dm[6]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dm[6]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dm[6]}]

# ddram:0.dm
set_property LOC AE1 [get_ports {ddram0_dm[7]}]
set_property SLEW FAST [get_ports {ddram0_dm[7]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dm[7]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dm[7]}]

# ddram:0.dq
set_property LOC AF17 [get_ports {ddram0_dq[0]}]
set_property SLEW FAST [get_ports {ddram0_dq[0]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[0]}]

# ddram:0.dq
set_property LOC AE17 [get_ports {ddram0_dq[1]}]
set_property SLEW FAST [get_ports {ddram0_dq[1]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[1]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[1]}]

# ddram:0.dq
set_property LOC AF15 [get_ports {ddram0_dq[2]}]
set_property SLEW FAST [get_ports {ddram0_dq[2]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[2]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[2]}]

# ddram:0.dq
set_property LOC AF14 [get_ports {ddram0_dq[3]}]
set_property SLEW FAST [get_ports {ddram0_dq[3]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[3]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[3]}]

# ddram:0.dq
set_property LOC AE15 [get_ports {ddram0_dq[4]}]
set_property SLEW FAST [get_ports {ddram0_dq[4]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[4]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[4]}]

# ddram:0.dq
set_property LOC AD15 [get_ports {ddram0_dq[5]}]
set_property SLEW FAST [get_ports {ddram0_dq[5]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[5]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[5]}]

# ddram:0.dq
set_property LOC AF20 [get_ports {ddram0_dq[6]}]
set_property SLEW FAST [get_ports {ddram0_dq[6]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[6]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[6]}]

# ddram:0.dq
set_property LOC AF19 [get_ports {ddram0_dq[7]}]
set_property SLEW FAST [get_ports {ddram0_dq[7]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[7]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[7]}]

# ddram:0.dq
set_property LOC AA15 [get_ports {ddram0_dq[8]}]
set_property SLEW FAST [get_ports {ddram0_dq[8]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[8]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[8]}]

# ddram:0.dq
set_property LOC AA14 [get_ports {ddram0_dq[9]}]
set_property SLEW FAST [get_ports {ddram0_dq[9]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[9]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[9]}]

# ddram:0.dq
set_property LOC AC14 [get_ports {ddram0_dq[10]}]
set_property SLEW FAST [get_ports {ddram0_dq[10]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[10]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[10]}]

# ddram:0.dq
set_property LOC AD14 [get_ports {ddram0_dq[11]}]
set_property SLEW FAST [get_ports {ddram0_dq[11]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[11]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[11]}]

# ddram:0.dq
set_property LOC AB14 [get_ports {ddram0_dq[12]}]
set_property SLEW FAST [get_ports {ddram0_dq[12]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[12]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[12]}]

# ddram:0.dq
set_property LOC AB15 [get_ports {ddram0_dq[13]}]
set_property SLEW FAST [get_ports {ddram0_dq[13]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[13]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[13]}]

# ddram:0.dq
set_property LOC AA18 [get_ports {ddram0_dq[14]}]
set_property SLEW FAST [get_ports {ddram0_dq[14]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[14]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[14]}]

# ddram:0.dq
set_property LOC AA17 [get_ports {ddram0_dq[15]}]
set_property SLEW FAST [get_ports {ddram0_dq[15]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[15]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[15]}]

# ddram:0.dq
set_property LOC AC18 [get_ports {ddram0_dq[16]}]
set_property SLEW FAST [get_ports {ddram0_dq[16]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[16]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[16]}]

# ddram:0.dq
set_property LOC AD18 [get_ports {ddram0_dq[17]}]
set_property SLEW FAST [get_ports {ddram0_dq[17]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[17]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[17]}]

# ddram:0.dq
set_property LOC AC17 [get_ports {ddram0_dq[18]}]
set_property SLEW FAST [get_ports {ddram0_dq[18]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[18]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[18]}]

# ddram:0.dq
set_property LOC AB17 [get_ports {ddram0_dq[19]}]
set_property SLEW FAST [get_ports {ddram0_dq[19]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[19]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[19]}]

# ddram:0.dq
set_property LOC AA20 [get_ports {ddram0_dq[20]}]
set_property SLEW FAST [get_ports {ddram0_dq[20]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[20]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[20]}]

# ddram:0.dq
set_property LOC AA19 [get_ports {ddram0_dq[21]}]
set_property SLEW FAST [get_ports {ddram0_dq[21]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[21]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[21]}]

# ddram:0.dq
set_property LOC AD19 [get_ports {ddram0_dq[22]}]
set_property SLEW FAST [get_ports {ddram0_dq[22]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[22]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[22]}]

# ddram:0.dq
set_property LOC AC19 [get_ports {ddram0_dq[23]}]
set_property SLEW FAST [get_ports {ddram0_dq[23]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[23]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[23]}]

# ddram:0.dq
set_property LOC W14 [get_ports {ddram0_dq[24]}]
set_property SLEW FAST [get_ports {ddram0_dq[24]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[24]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[24]}]

# ddram:0.dq
set_property LOC V14 [get_ports {ddram0_dq[25]}]
set_property SLEW FAST [get_ports {ddram0_dq[25]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[25]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[25]}]

# ddram:0.dq
set_property LOC V19 [get_ports {ddram0_dq[26]}]
set_property SLEW FAST [get_ports {ddram0_dq[26]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[26]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[26]}]

# ddram:0.dq
set_property LOC V18 [get_ports {ddram0_dq[27]}]
set_property SLEW FAST [get_ports {ddram0_dq[27]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[27]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[27]}]

# ddram:0.dq
set_property LOC V16 [get_ports {ddram0_dq[28]}]
set_property SLEW FAST [get_ports {ddram0_dq[28]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[28]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[28]}]

# ddram:0.dq
set_property LOC W15 [get_ports {ddram0_dq[29]}]
set_property SLEW FAST [get_ports {ddram0_dq[29]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[29]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[29]}]

# ddram:0.dq
set_property LOC W16 [get_ports {ddram0_dq[30]}]
set_property SLEW FAST [get_ports {ddram0_dq[30]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[30]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[30]}]

# ddram:0.dq
set_property LOC Y17 [get_ports {ddram0_dq[31]}]
set_property SLEW FAST [get_ports {ddram0_dq[31]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[31]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[31]}]

# ddram:0.dq
set_property LOC V4 [get_ports {ddram0_dq[32]}]
set_property SLEW FAST [get_ports {ddram0_dq[32]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[32]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[32]}]

# ddram:0.dq
set_property LOC U6 [get_ports {ddram0_dq[33]}]
set_property SLEW FAST [get_ports {ddram0_dq[33]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[33]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[33]}]

# ddram:0.dq
set_property LOC U5 [get_ports {ddram0_dq[34]}]
set_property SLEW FAST [get_ports {ddram0_dq[34]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[34]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[34]}]

# ddram:0.dq
set_property LOC U2 [get_ports {ddram0_dq[35]}]
set_property SLEW FAST [get_ports {ddram0_dq[35]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[35]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[35]}]

# ddram:0.dq
set_property LOC V3 [get_ports {ddram0_dq[36]}]
set_property SLEW FAST [get_ports {ddram0_dq[36]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[36]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[36]}]

# ddram:0.dq
set_property LOC W3 [get_ports {ddram0_dq[37]}]
set_property SLEW FAST [get_ports {ddram0_dq[37]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[37]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[37]}]

# ddram:0.dq
set_property LOC U7 [get_ports {ddram0_dq[38]}]
set_property SLEW FAST [get_ports {ddram0_dq[38]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[38]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[38]}]

# ddram:0.dq
set_property LOC V6 [get_ports {ddram0_dq[39]}]
set_property SLEW FAST [get_ports {ddram0_dq[39]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[39]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[39]}]

# ddram:0.dq
set_property LOC Y3 [get_ports {ddram0_dq[40]}]
set_property SLEW FAST [get_ports {ddram0_dq[40]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[40]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[40]}]

# ddram:0.dq
set_property LOC Y2 [get_ports {ddram0_dq[41]}]
set_property SLEW FAST [get_ports {ddram0_dq[41]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[41]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[41]}]

# ddram:0.dq
set_property LOC V2 [get_ports {ddram0_dq[42]}]
set_property SLEW FAST [get_ports {ddram0_dq[42]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[42]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[42]}]

# ddram:0.dq
set_property LOC V1 [get_ports {ddram0_dq[43]}]
set_property SLEW FAST [get_ports {ddram0_dq[43]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[43]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[43]}]

# ddram:0.dq
set_property LOC W1 [get_ports {ddram0_dq[44]}]
set_property SLEW FAST [get_ports {ddram0_dq[44]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[44]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[44]}]

# ddram:0.dq
set_property LOC Y1 [get_ports {ddram0_dq[45]}]
set_property SLEW FAST [get_ports {ddram0_dq[45]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[45]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[45]}]

# ddram:0.dq
set_property LOC AB2 [get_ports {ddram0_dq[46]}]
set_property SLEW FAST [get_ports {ddram0_dq[46]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[46]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[46]}]

# ddram:0.dq
set_property LOC AC2 [get_ports {ddram0_dq[47]}]
set_property SLEW FAST [get_ports {ddram0_dq[47]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[47]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[47]}]

# ddram:0.dq
set_property LOC AA4 [get_ports {ddram0_dq[48]}]
set_property SLEW FAST [get_ports {ddram0_dq[48]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[48]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[48]}]

# ddram:0.dq
set_property LOC AB4 [get_ports {ddram0_dq[49]}]
set_property SLEW FAST [get_ports {ddram0_dq[49]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[49]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[49]}]

# ddram:0.dq
set_property LOC AC4 [get_ports {ddram0_dq[50]}]
set_property SLEW FAST [get_ports {ddram0_dq[50]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[50]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[50]}]

# ddram:0.dq
set_property LOC AC3 [get_ports {ddram0_dq[51]}]
set_property SLEW FAST [get_ports {ddram0_dq[51]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[51]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[51]}]

# ddram:0.dq
set_property LOC AC6 [get_ports {ddram0_dq[52]}]
set_property SLEW FAST [get_ports {ddram0_dq[52]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[52]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[52]}]

# ddram:0.dq
set_property LOC AB6 [get_ports {ddram0_dq[53]}]
set_property SLEW FAST [get_ports {ddram0_dq[53]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[53]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[53]}]

# ddram:0.dq
set_property LOC Y6 [get_ports {ddram0_dq[54]}]
set_property SLEW FAST [get_ports {ddram0_dq[54]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[54]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[54]}]

# ddram:0.dq
set_property LOC Y5 [get_ports {ddram0_dq[55]}]
set_property SLEW FAST [get_ports {ddram0_dq[55]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[55]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[55]}]

# ddram:0.dq
set_property LOC AD4 [get_ports {ddram0_dq[56]}]
set_property SLEW FAST [get_ports {ddram0_dq[56]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[56]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[56]}]

# ddram:0.dq
set_property LOC AD1 [get_ports {ddram0_dq[57]}]
set_property SLEW FAST [get_ports {ddram0_dq[57]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[57]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[57]}]

# ddram:0.dq
set_property LOC AF2 [get_ports {ddram0_dq[58]}]
set_property SLEW FAST [get_ports {ddram0_dq[58]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[58]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[58]}]

# ddram:0.dq
set_property LOC AE2 [get_ports {ddram0_dq[59]}]
set_property SLEW FAST [get_ports {ddram0_dq[59]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[59]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[59]}]

# ddram:0.dq
set_property LOC AE6 [get_ports {ddram0_dq[60]}]
set_property SLEW FAST [get_ports {ddram0_dq[60]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[60]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[60]}]

# ddram:0.dq
set_property LOC AE5 [get_ports {ddram0_dq[61]}]
set_property SLEW FAST [get_ports {ddram0_dq[61]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[61]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[61]}]

# ddram:0.dq
set_property LOC AF3 [get_ports {ddram0_dq[62]}]
set_property SLEW FAST [get_ports {ddram0_dq[62]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[62]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[62]}]

# ddram:0.dq
set_property LOC AE3 [get_ports {ddram0_dq[63]}]
set_property SLEW FAST [get_ports {ddram0_dq[63]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dq[63]}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_dq[63]}]

# ddram:0.dqs_p
set_property LOC AE18 [get_ports {ddram0_dqs_p[0]}]
set_property SLEW FAST [get_ports {ddram0_dqs_p[0]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dqs_p[0]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram0_dqs_p[0]}]

# ddram:0.dqs_p
set_property LOC Y15 [get_ports {ddram0_dqs_p[1]}]
set_property SLEW FAST [get_ports {ddram0_dqs_p[1]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dqs_p[1]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram0_dqs_p[1]}]

# ddram:0.dqs_p
set_property LOC AD20 [get_ports {ddram0_dqs_p[2]}]
set_property SLEW FAST [get_ports {ddram0_dqs_p[2]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dqs_p[2]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram0_dqs_p[2]}]

# ddram:0.dqs_p
set_property LOC W18 [get_ports {ddram0_dqs_p[3]}]
set_property SLEW FAST [get_ports {ddram0_dqs_p[3]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dqs_p[3]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram0_dqs_p[3]}]

# ddram:0.dqs_p
set_property LOC W6 [get_ports {ddram0_dqs_p[4]}]
set_property SLEW FAST [get_ports {ddram0_dqs_p[4]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dqs_p[4]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram0_dqs_p[4]}]

# ddram:0.dqs_p
set_property LOC AB1 [get_ports {ddram0_dqs_p[5]}]
set_property SLEW FAST [get_ports {ddram0_dqs_p[5]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dqs_p[5]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram0_dqs_p[5]}]

# ddram:0.dqs_p
set_property LOC AA5 [get_ports {ddram0_dqs_p[6]}]
set_property SLEW FAST [get_ports {ddram0_dqs_p[6]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dqs_p[6]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram0_dqs_p[6]}]

# ddram:0.dqs_p
set_property LOC AF5 [get_ports {ddram0_dqs_p[7]}]
set_property SLEW FAST [get_ports {ddram0_dqs_p[7]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dqs_p[7]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram0_dqs_p[7]}]

# ddram:0.dqs_n
set_property LOC AF18 [get_ports {ddram0_dqs_n[0]}]
set_property SLEW FAST [get_ports {ddram0_dqs_n[0]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dqs_n[0]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram0_dqs_n[0]}]

# ddram:0.dqs_n
set_property LOC Y16 [get_ports {ddram0_dqs_n[1]}]
set_property SLEW FAST [get_ports {ddram0_dqs_n[1]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dqs_n[1]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram0_dqs_n[1]}]

# ddram:0.dqs_n
set_property LOC AE20 [get_ports {ddram0_dqs_n[2]}]
set_property SLEW FAST [get_ports {ddram0_dqs_n[2]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dqs_n[2]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram0_dqs_n[2]}]

# ddram:0.dqs_n
set_property LOC W19 [get_ports {ddram0_dqs_n[3]}]
set_property SLEW FAST [get_ports {ddram0_dqs_n[3]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dqs_n[3]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram0_dqs_n[3]}]

# ddram:0.dqs_n
set_property LOC W5 [get_ports {ddram0_dqs_n[4]}]
set_property SLEW FAST [get_ports {ddram0_dqs_n[4]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dqs_n[4]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram0_dqs_n[4]}]

# ddram:0.dqs_n
set_property LOC AC1 [get_ports {ddram0_dqs_n[5]}]
set_property SLEW FAST [get_ports {ddram0_dqs_n[5]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dqs_n[5]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram0_dqs_n[5]}]

# ddram:0.dqs_n
set_property LOC AB5 [get_ports {ddram0_dqs_n[6]}]
set_property SLEW FAST [get_ports {ddram0_dqs_n[6]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dqs_n[6]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram0_dqs_n[6]}]

# ddram:0.dqs_n
set_property LOC AF4 [get_ports {ddram0_dqs_n[7]}]
set_property SLEW FAST [get_ports {ddram0_dqs_n[7]}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_dqs_n[7]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram0_dqs_n[7]}]

# ddram:0.clk_p
set_property LOC AC9 [get_ports {ddram0_clk_p}]
set_property SLEW FAST [get_ports {ddram0_clk_p}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_clk_p}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram0_clk_p}]

# ddram:0.clk_n
set_property LOC AD9 [get_ports {ddram0_clk_n}]
set_property SLEW FAST [get_ports {ddram0_clk_n}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_clk_n}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddram0_clk_n}]

# ddram:0.cke
set_property LOC AB9 [get_ports {ddram0_cke}]
set_property SLEW FAST [get_ports {ddram0_cke}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_cke}]
set_property IOSTANDARD SSTL15 [get_ports {ddram0_cke}]

# ddram:0.reset_n
set_property LOC AB20 [get_ports {ddram0_reset_n}]
set_property SLEW FAST [get_ports {ddram0_reset_n}]
set_property VCCAUX_IO NORMAL [get_ports {ddram0_reset_n}]
set_property IOSTANDARD LVCMOS15 [get_ports {ddram0_reset_n}]

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

# i2c:0.scl
set_property LOC U19 [get_ports {i2c_scl}]
set_property IOSTANDARD LVCMOS33 [get_ports {i2c_scl}]

# i2c:0.sda
set_property LOC U20 [get_ports {i2c_sda}]
set_property IOSTANDARD LVCMOS33 [get_ports {i2c_sda}]

################################################################################
# Design constraints
################################################################################


set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 2.5 [current_design]
