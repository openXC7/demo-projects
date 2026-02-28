module top(
    input  wire clk,
    output wire [2:0] led
);
    reg [25:0] ctr = 26'd0;
    always @(posedge clk) ctr <= ctr + 1'b1;

    // Walk through each LED, then all-on, so pin mapping is obvious on hardware.
    wire [1:0] phase = ctr[25:24];
    assign led = (phase == 2'b00) ? 3'b001 :
                 (phase == 2'b01) ? 3'b010 :
                 (phase == 2'b10) ? 3'b100 :
                                    3'b111;
endmodule
