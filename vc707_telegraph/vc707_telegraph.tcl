set part xc7vx485tffg1761-2
create_project -force -in_memory -part $part
read_verilog vc707_telegraph.v telegraph.v
read_xdc vc707_telegraph.xdc
synth_design -top top -part $part -flatten_hierarchy rebuilt
opt_design
place_design
route_design
write_checkpoint -force vc707_telegraph.dcp
write_bitstream -force vc707_telegraph.bit
