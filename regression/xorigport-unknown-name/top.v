// Regression for openXC7/nextpnr-xilinx#7cfd1e90.
//
// get_lut_init() built each LUT's INIT[63:0] by mapping X_ORIG_PORT_A1..A6
// through the LUT's logical inputs, using operator[] on an unordered_map of
// logical-input name -> bit.  operator[] inserts a missing key with value 0,
// so any name the cell does not have was silently encoded as if the pin drove
// I0 -- no error, no warning, only the bitstream disagreed with the netlist.
// The fix uses find() and log_error() on an unknown name.
//
// The normal yosys flow cannot produce such a name (the separator half of this
// pair, 2d3005e7, is already fixed), so check.sh corrupts the synthesised JSON
// -- it renames this LUT2's I0 port to "A1", a physical pin name that the
// packer keeps and records as X_ORIG_PORT_A1="A1", which is not one of the
// LUT2's logical inputs -- and re-runs nextpnr.  Pre-fix the name was accepted
// and encoded as I0 (a silent wrong truth table); post-fix the unknown-name
// guard rejects it with an error naming the offending name.
//
// A LUT2 keeps the design a single cell, so the corruption and the guard are
// the only interesting things in the netlist.
module top(input a, input b, output y);
    assign y = a & b;
endmodule
