// SPDX-License-Identifier: ISC
//
// Suite-frontend friendly counter core for VC707.
// No board-specific I/O primitives here — purely logic.
// `fpga_synth ~io:true` wraps top pads in IBUF/OBUF and clock in IBUF+BUFG.
// The VC707 differential sysclk is converted to a single-ended `clk` by
// a tiny wrapper (vc707_top.v) outside this compilation unit.

module top (
    input  wire       clk,
    input  wire       rst,
    output wire [7:0] led
);

    // 24-bit prescaler at 200 MHz -> ~12 Hz tick
    reg [23:0] prescaler;
    wire       tick = (prescaler == 24'h000000);
    always @(posedge clk) begin
        if (rst) prescaler <= 24'h000000;
        else     prescaler <= prescaler + 24'h000001;
    end

    // 8-bit binary counter -> LEDs
    reg [7:0] count;
    always @(posedge clk) begin
        if (rst)       count <= 8'h00;
        else if (tick) count <= count + 8'h01;
    end

    assign led = count;

endmodule
