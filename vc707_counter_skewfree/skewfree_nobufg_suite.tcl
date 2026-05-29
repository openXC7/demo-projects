set part xc7vx485tffg1761-2
create_project -force -in_memory -part $part
read_edif top.edif
read_xdc counter_skewfree.xdc
link_design -top top -part $part
# The suite-emitted netlist has the IBUF output going directly to FF clock
# pins (no BUFG). Vivado's placer would normally object via CLOCK_DEDICATED_ROUTE
# DRC; disable that and let it route the clock through general fabric.
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets -of [get_pins -of [get_cells -hierarchical *IBUF*] -filter {DIRECTION == OUT}]]
opt_design
place_design
route_design
write_checkpoint -force counter_skewfree_nobufg_suite.dcp
write_bitstream -force counter_skewfree_nobufg_suite.bit
report_utilization -file utilization_nobufg.rpt
