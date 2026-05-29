// SPDX-License-Identifier: ISC
//
// VC707 8-bit counter clocked from the CPU_RESET pushbutton via BUFR.
// Pushbutton bounce → counter advances erratically; that's fine for proof
// of the clock-distribution path. Single-ended, single clock region.
//
//   AV40 pushbutton (LIOB18_X81Y128) → IBUF → BUFR → counter flops → LEDs
//
// Why this design:
//   • avoids BUFG entirely (CLK_BUFG_* segbits all empty)
//   • avoids IBUFDS (suite-frontend can't bind diff inputs)
//   • avoids the 24-bit prescaler (pushbutton is human-paced)
//   • all I/O on LEFT-side bank 15 → one HCLK row, one INT column-group
module top (
    input  wire       sw_clk,
    output wire [7:0] led
);
    wire sw_buf;
    wire clk;

    // IBUF is inferred from the port + IOSTANDARD constraint; BUFR is
    // explicit because the placer otherwise picks BUFG by default.
    (* DONT_TOUCH = "true" *)
    BUFR #(
        .BUFR_DIVIDE("BYPASS"),
        .SIM_DEVICE ("7SERIES")
    ) clk_bufr (
        .CE (1'b1),
        .CLR(1'b0),
        .I  (sw_clk),
        .O  (clk)
    );

    reg [7:0] count = 8'h00;
    always @(posedge clk) count <= count + 8'h01;
    assign led = count;
endmodule
