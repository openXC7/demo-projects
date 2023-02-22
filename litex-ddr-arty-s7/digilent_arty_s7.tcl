
# Create Project

create_project -force -name digilent_arty_s7 -part xc7s50csga324-1
set_msg_config -id {Common 17-55} -new_severity {Warning}

# Add Sources

read_verilog {../vexriscv/VexRiscv.v}
read_verilog {digilent_arty_s7.v}

# Add EDIFs


# Add IPs


# Add constraints

read_xdc digilent_arty_s7.xdc
set_property PROCESSING_ORDER EARLY [get_files digilent_arty_s7.xdc]

# Add pre-synthesis commands


# Synthesis

synth_design -directive default -top digilent_arty_s7 -part xc7s50csga324-1

# Synthesis report

report_timing_summary -file digilent_arty_s7_timing_synth.rpt
report_utilization -hierarchical -file digilent_arty_s7_utilization_hierarchical_synth.rpt
report_utilization -file digilent_arty_s7_utilization_synth.rpt

# Optimize design

opt_design -directive default

# Add pre-placement commands


# Placement

place_design -directive default

# Placement report

report_utilization -hierarchical -file digilent_arty_s7_utilization_hierarchical_place.rpt
report_utilization -file digilent_arty_s7_utilization_place.rpt
report_io -file digilent_arty_s7_io.rpt
report_control_sets -verbose -file digilent_arty_s7_control_sets.rpt
report_clock_utilization -file digilent_arty_s7_clock_utilization.rpt

# Add pre-routing commands


# Routing

route_design -directive default
phys_opt_design -directive default
write_checkpoint -force digilent_arty_s7_route.dcp

# Routing report

report_timing_summary -no_header -no_detailed_paths
report_route_status -file digilent_arty_s7_route_status.rpt
report_drc -file digilent_arty_s7_drc.rpt
report_timing_summary -datasheet -max_paths 10 -file digilent_arty_s7_timing.rpt
report_power -file digilent_arty_s7_power.rpt
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]

# Bitstream generation

write_bitstream -force digilent_arty_s7.bit 
write_cfgmem -force -format bin -interface spix4 -size 16 -loadbit "up 0x0 digilent_arty_s7.bit" -file digilent_arty_s7.bin

# End

quit