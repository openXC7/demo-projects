# Vivado synth + impl + bitstream for the VC707 counter smoke-test.
# Run with:  vivado -mode batch -nojournal -nolog -source counter.tcl

set part xc7vx485tffg1761-2
set top  top

create_project -force -in_memory -part $part

read_verilog counter.v
read_xdc vc707.xdc

# ---------- synthesize ----------
synth_design -top $top -part $part -flatten_hierarchy rebuilt
write_checkpoint -force post_synth.dcp
report_utilization -file utilization_synth.rpt

# ---------- implement ----------
opt_design
place_design
route_design
write_checkpoint -force post_route.dcp

# ---------- reports (the verification surface) ----------
report_utilization     -file utilization.rpt
report_timing_summary  -file timing.rpt -max_paths 5
report_drc             -file drc.rpt
report_route_status    -file route_status.rpt
report_clocks          -file clocks.rpt

# ---------- bitstream ----------
write_bitstream -force counter.bit

# also emit the post-route netlist (useful for nextpnr comparison later)
write_verilog -force -mode timesim counter_post.v

puts ""
puts "==================== SMOKE-TEST DONE ===================="
puts "  bitstream : [pwd]/counter.bit"
puts "  reports   : utilization.rpt timing.rpt drc.rpt route_status.rpt clocks.rpt"
puts "========================================================="
