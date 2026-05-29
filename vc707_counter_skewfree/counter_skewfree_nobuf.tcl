set part xc7vx485tffg1761-2
create_project -force -in_memory -part $part
read_verilog counter_skewfree_nobuf.v
read_xdc counter_skewfree_nobuf.xdc
synth_design -top top -part $part -flatten_hierarchy rebuilt
# Suppress all the clock-routing rules — if BUFG-free is possible, this
# is the configuration that would do it.
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets *sw_clk*]
opt_design
place_design
route_design
write_checkpoint -force counter_skewfree_nobuf.dcp
write_bitstream -force counter_skewfree_nobuf.bit
report_utilization -file utilization.rpt
