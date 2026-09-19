// Regression for openXC7/nextpnr-xilinx#195.
//
// A 64 x 8 distributed RAM: yosys memory_libmap emits one RAM64X1S per data
// bit, all sharing one write address/WCLK/WE control set.  Before #195 the
// packer fell through to "Cannot pack unsupported primitive: RAM64X1S" and no
// bitstream was produced at all -- the flow stopped in packing.
//
// I/O is deliberately minimal (3 pins) so the design needs almost no
// constraints and the LUT RAM stays the only interesting thing in it.
//
// PASS = the .fasm carries 8 SLICEM LUT-as-RAM features, 4 per site in 2
// sites, with no upper write-address mux (check.sh).
module top (
    input  wire clk,
    input  wire we,
    output wire led
);
    reg [5:0] addr = 6'd0;
    reg [7:0] din  = 8'd1;
    reg [7:0] mem [0:63];

    // One shared read/write address: this is what makes the macro RAM64X1S
    // (single port) rather than RAM64X1D.
    always @(posedge clk) begin
        addr <= addr + 6'd1;
        din  <= din + 8'd7;
        if (we)
            mem[addr] <= din;
    end

    // Keeps the read port (and with it the whole LUT RAM) live.
    assign led = ^mem[addr];
endmodule
