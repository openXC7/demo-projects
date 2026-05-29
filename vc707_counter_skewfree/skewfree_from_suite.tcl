# Take the suite-synthesised netlist (EDIF) and run it through Vivado's
# place + route + bitstream, no re-synthesis.
set part xc7vx485tffg1761-2
create_project -force -in_memory -part $part
read_edif counter_skewfree.edif
read_xdc counter_skewfree.xdc
link_design -top top -part $part
opt_design
place_design
route_design
write_checkpoint -force counter_skewfree_suite.dcp
write_bitstream -force counter_skewfree_suite.bit
report_utilization -file utilization_suite.rpt
