open_checkpoint /tmp/rst_to_led.dcp
puts "----- design summary -----"
puts "  part:     [get_property PART [current_design]]"
puts "  cells:    [llength [get_cells -hier]]"
puts "  nets:     [llength [get_nets -hier]]"
puts "  IOBs:     [llength [get_cells -hier -filter REF_NAME==IBUF || REF_NAME==OBUF]]"
puts "  ----- IOB props -----"
foreach c [get_cells -hier -filter {REF_NAME==IBUF || REF_NAME==OBUF}] {
    puts "  $c  ref=[get_property REF_NAME $c]  loc=[get_property LOC $c]"
}
exit
