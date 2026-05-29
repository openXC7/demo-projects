set part xc7vx485tffg1761-2
create_project -force -in_memory -part $part
read_verilog counter_no_bufr.v
read_xdc counter_no_bufr.xdc
synth_design -top top -part $part -flatten_hierarchy rebuilt
set_property CLOCK_BUFFER_TYPE NONE [get_nets sw_clk_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets sw_clk_IBUF]
opt_design
place_design
route_design
write_checkpoint -force counter_no_bufr.dcp
write_bitstream -force counter_no_bufr.bit
