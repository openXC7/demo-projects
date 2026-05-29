set part xc7vx485tffg1761-2
create_project -force -in_memory -part $part
read_verilog counter_2bufg.v
read_xdc counter_2bufg.xdc
synth_design -top top -part $part -flatten_hierarchy rebuilt
opt_design
place_design
route_design
write_checkpoint -force counter_2bufg.dcp
write_bitstream -force counter_2bufg.bit
report_utilization -file utilization.rpt
