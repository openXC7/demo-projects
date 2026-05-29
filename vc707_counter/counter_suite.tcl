# Vivado impl-only flow on the suite-generated EDIF.
# fpga_synth already maps to LUT*/FDRE/CARRY4/MUXF*/IBUFDS/BUFG/IBUF/OBUF
# primitives — Vivado just runs opt/place/route/bitstream on that netlist.
#
# Run with:  vivado -mode batch -nojournal -nolog -source counter_suite.tcl

set part xc7vx485tffg1761-2
set top  top
set edif "from_suite_diffclk/top.edif"
set xdc  "vc707_suite.xdc"

create_project -force -in_memory -part $part

read_edif $edif
read_xdc  $xdc
link_design -part $part -top $top

write_checkpoint -force suite_post_synth.dcp
report_utilization -file suite_utilization_synth.rpt

# ---------- implement ----------
opt_design
place_design
route_design
write_checkpoint -force suite_post_route.dcp

# ---------- reports ----------
report_utilization     -file suite_utilization.rpt
report_timing_summary  -file suite_timing.rpt -max_paths 5
report_drc             -file suite_drc.rpt
report_route_status    -file suite_route_status.rpt
report_clocks          -file suite_clocks.rpt

# ---------- bitstream ----------
write_bitstream -force counter_suite.bit
write_verilog -force -mode timesim counter_suite_post.v

puts ""
puts "==================== SUITE-EDIF FLOW DONE ===================="
puts "  bitstream : [pwd]/counter_suite.bit"
puts "  reports   : suite_utilization.rpt suite_timing.rpt suite_drc.rpt"
puts "=============================================================="
