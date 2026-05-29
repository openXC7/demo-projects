module top (
    input  wire       sw_clk,
    output wire [7:0] led
);
    wire clk = sw_clk;
    reg [7:0] count = 8'h00;
    always @(posedge clk) count <= count + 8'h01;
    assign led = count;
endmodule
