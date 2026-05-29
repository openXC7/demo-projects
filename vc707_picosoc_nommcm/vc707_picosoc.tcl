set part xc7vx485tffg1761-2
create_project -force -in_memory -part $part
read_verilog vc707_picosoc.v picosoc_noflash.v picorv32.v simpleuart.v spimemio.v progmem.v
read_xdc vc707_picosoc.xdc
synth_design -top top -part $part -flatten_hierarchy rebuilt
opt_design
place_design
route_design
write_checkpoint -force vc707_picosoc.dcp
write_bitstream -force vc707_picosoc.bit
report_timing_summary -file timing.rpt -max_paths 3
