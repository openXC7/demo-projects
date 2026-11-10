module top (
    input  wire clk,
    input  wire a,
    output wire y
);
    reg r1, r2;
    always @(posedge clk) begin
        r1 <= a;
        r2 <= r1;
    end
    assign y = r2;
endmodule
