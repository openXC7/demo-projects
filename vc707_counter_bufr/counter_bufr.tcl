# Build the BUFR-clocked variant of the VC707 counter and emit the bitstream.
set part xc7vx485tffg1761-2
create_project -force -in_memory -part $part
read_verilog counter_bufr.v
read_xdc counter_bufr.xdc
synth_design -top top -part $part -flatten_hierarchy rebuilt
# Allow IBUFDS output to feed BUFR.I via general routing (CKINT).
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk_ibuf]
opt_design
place_design
route_design
write_checkpoint -force counter_bufr.dcp
write_bitstream -force counter_bufr.bit
report_utilization -file utilization.rpt
report_timing_summary -file timing.rpt -max_paths 3
