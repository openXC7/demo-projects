// Reproducer for openXC7/nextpnr-xilinx#159.
// One 16x16 multiply; the XOR keeps every product bit live so nothing trims.
module top (input wire clk, output wire led);
    reg [15:0] a = 16'd1, b = 16'd1;
    always @(posedge clk) begin
        a <= a + 16'd1;
        b <= b + 16'd3;
    end
    wire [31:0] p = a * b;
    assign led = ^p;
endmodule
