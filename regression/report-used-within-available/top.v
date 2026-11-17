// A counter is enough: packing ties the reset and the unused DSP-less
// constants, and those drivers are the rows whose used count used to
// exceed the available count.
module top (
    input  wire clk,
    output wire [3:0] led
);
    reg [23:0] cnt = 24'd0;
    always @(posedge clk) cnt <= cnt + 1'b1;
    assign led = cnt[23:20];
endmodule
