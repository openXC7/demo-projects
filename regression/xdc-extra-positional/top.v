module top (
    input  wire clk,
    input  wire a,
    output wire y
);
    reg r;
    always @(posedge clk) r <= a;
    assign y = r;
endmodule
