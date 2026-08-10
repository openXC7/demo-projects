// Regression for openXC7/nextpnr-xilinx#112.
//
// A simple-dual-port BRAM: port A writes, port B reads, port A's read path unused.
// Before #112 the FASM backend emitted a width configuration bit for the unused port
// that conflicted with the used one, and NO bitstream was produced at all -- the
// failure was in fasm generation, not in placement.
//
// I/O is deliberately minimal (3 pins) so the test needs almost no constraints and
// the BRAM stays the only interesting thing in it.
//
// PASS = a .fasm is produced. FAIL = fasm generation errors on a conflicting bit.
module top (
    input  wire clk,
    input  wire we,
    output wire led
);
    reg [17:0] mem [0:1023];
    reg [9:0]  waddr = 10'd0;
    reg [9:0]  raddr = 10'd0;
    reg [17:0] din   = 18'd1;
    reg [17:0] dout  = 18'd0;

    always @(posedge clk) begin
        waddr <= waddr + 1'b1;
        raddr <= raddr + 2'd2;
        din   <= din + 1'b1;
        if (we) mem[waddr] <= din;   // port A: write only
        dout  <= mem[raddr];         // port B: read only
    end
    assign led = ^dout;              // keep dout live so the BRAM is not optimised away
endmodule
