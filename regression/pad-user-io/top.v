// PAD available on an xc7a35tcpg236 must be the 106 user I/O pads.
// The package also bonds GTP pads and the XADC VP/VN (120 bonded pads
// in all). Those are not in this row.
module top (
    input  wire clk,
    output wire led
);
    reg [23:0] cnt = 24'd0;
    always @(posedge clk) cnt <= cnt + 1'b1;
    assign led = cnt[23];
endmodule
