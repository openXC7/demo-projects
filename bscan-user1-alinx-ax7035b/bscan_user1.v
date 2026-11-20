`default_nettype none   //do not allow undeclared wires

// An 8-bit register behind the JTAG USER1 instruction (BSCANE2).
//
//   written over JTAG:  bits 3:0 -> LED4..LED1 (1 = on)
//   read over JTAG:     bits 7:4 =  the value the LEDs show now
//                       bits 3:0 =  KEY4..KEY1 (1 = pressed)
//
// Writing a value and scanning again returns it in the high nibble, so a
// script can check the whole path without anyone looking at the board.
// LEDs and keys are active low on the AX7035B. No board clock is used.
module bscan_user1 (
    input  wire [3:0] keys,
    output wire [3:0] leds
    );

    wire tck;
    wire tdi;
    wire sel;
    wire capture;
    wire shift;
    wire update;
    wire jtag_clk;

    reg [7:0] shift_reg = 8'h00;
    reg [3:0] led_value = 4'h0;

    BSCANE2 #(
        .JTAG_CHAIN(1)
    ) bscan (
        .TCK(tck),
        .TDI(tdi),
        .TDO(shift_reg[0]),
        .SEL(sel),
        .CAPTURE(capture),
        .SHIFT(shift),
        .UPDATE(update),
        .DRCK(),
        .RESET(),
        .RUNTEST(),
        .TMS()
    );

    BUFG tck_bufg (
        .I(tck),
        .O(jtag_clk)
    );

    // One clock, TCK. A scan through USER1 is CAPTURE (load the register),
    // SHIFT (TDI in at bit 7, bit 0 out to TDO: the least significant bit
    // travels first) and, a couple of TCK cycles after the last shift,
    // UPDATE. The register holds its value in between, so UPDATE still
    // finds what was shifted in.
    always @(posedge jtag_clk) begin
        if (sel && capture)
            shift_reg <= {led_value, ~keys};
        else if (sel && shift)
            shift_reg <= {tdi, shift_reg[7:1]};

        if (sel && update)
            led_value <= shift_reg[3:0];
    end

    assign leds = ~led_value;
endmodule
