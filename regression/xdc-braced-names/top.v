// A board XDC in the form of the Digilent master files: -dict { ... },
// [get_ports { name }] with spaces inside the braces, a ';' and a comment at
// the end of every line.  nextpnr-xilinx used to abort on the first such line
// (Assertion failure: str.back() == '}' in xdc.cc).
module top (
    input  wire       clk,
    output wire [3:0] led
);
    reg [27:0] cnt = 28'd0;
    always @(posedge clk) cnt <= cnt + 1'b1;
    assign led = cnt[27:24];
endmodule
