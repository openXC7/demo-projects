// Regression for the RAM32X1S fix posted on openXC7/nextpnr#56: four
// RAM32X1S that share clock, write enable and address.
//
// With #56 one RAM32X1S places, but two or more with the same control set
// did not ("Unable to find legal placement ... SLICE_LUTX").  A RAM32X1S
// fills only the 6LUT of its position, so a slice whose D 6LUT held one was
// checked as 64-deep, the X inputs of C and B stayed reserved for WA7/WA8,
// and the next RAM32X1S, whose data comes in through that X input, was
// rejected.  Vivado packs four of them in one SLICEM, every LUT in the
// 32-deep mode (SMALL), each with its data on its own X input.
//
// Same four cells and INITs as the measured case; the address and the data
// come from a counter so the case needs only three pins, like
// lutram-ram32x1s.
//
// PASS = the four cells in the LUTs of ONE SLICEM, each with RAM and SMALL,
// its INIT in both halves of the LUT, no WA7USED/WA8USED (check.sh).
module top (
    input  wire clk,
    input  wire we,
    output wire led
);
    reg [4:0] addr = 5'd0;

    always @(posedge clk) begin
        addr <= addr + 5'd1;
    end

    wire [3:0] d = addr[3:0] ^ {4{addr[4]}};
    wire [3:0] o;

    RAM32X1S #(.INIT(32'h8badf00d)) u0 (.O(o[0]), .A0(addr[0]), .A1(addr[1]), .A2(addr[2]), .A3(addr[3]), .A4(addr[4]), .D(d[0]), .WCLK(clk), .WE(we));
    RAM32X1S #(.INIT(32'h8aacf10c)) u1 (.O(o[1]), .A0(addr[0]), .A1(addr[1]), .A2(addr[2]), .A3(addr[3]), .A4(addr[4]), .D(d[1]), .WCLK(clk), .WE(we));
    RAM32X1S #(.INIT(32'h89aff20f)) u2 (.O(o[2]), .A0(addr[0]), .A1(addr[1]), .A2(addr[2]), .A3(addr[3]), .A4(addr[4]), .D(d[2]), .WCLK(clk), .WE(we));
    RAM32X1S #(.INIT(32'h88aef30e)) u3 (.O(o[3]), .A0(addr[0]), .A1(addr[1]), .A2(addr[2]), .A3(addr[3]), .A4(addr[4]), .D(d[3]), .WCLK(clk), .WE(we));

    assign led = ^o;
endmodule
