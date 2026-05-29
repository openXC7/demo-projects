set part xc7vx485tffg1761-2
create_project -force -in_memory -part $part
read_verilog counter_skewfree.v
read_xdc counter_skewfree.xdc
synth_design -top top -part $part -flatten_hierarchy rebuilt
# Explicit: no clock buffer insertion for the pushbutton net.
set_property CLOCK_BUFFER_TYPE NONE [get_nets sw_clk_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets sw_clk_IBUF]
opt_design
place_design
route_design
write_checkpoint -force counter_skewfree.dcp
write_bitstream -force counter_skewfree.bit
report_utilization -file utilization.rpt
report_clocks -file clocks.rpt
