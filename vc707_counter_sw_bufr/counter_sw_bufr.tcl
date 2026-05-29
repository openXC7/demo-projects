set part xc7vx485tffg1761-2
create_project -force -in_memory -part $part
read_verilog counter_sw_bufr.v
read_xdc counter_sw_bufr.xdc
synth_design -top top -part $part -flatten_hierarchy rebuilt
# The pushbutton drives BUFR.I via general routing rather than a dedicated
# clock pin, so disable the dedicated-route check.
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets sw_clk_IBUF]
opt_design
place_design
route_design
write_checkpoint -force counter_sw_bufr.dcp
write_bitstream -force counter_sw_bufr.bit
report_utilization -file utilization.rpt
report_timing_summary -file timing.rpt -max_paths 3
