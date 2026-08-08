/*
 *  PicoSoC - Genesys2 top
 *
 *  The genesys2 xdc only constrains clk and led (single-ended 60 MHz
 *  clock from the ULPI PHY), so this top is the reduced variant: the
 *  picosoc core runs and the LEDs show a blink derived from gpio.
 */

module top (
    input  clk,
    output [1:0] led
);

  wire clk_bufg;
  BUFG bufg (
      .I(clk),
      .O(clk_bufg)
  );

  reg [23:0] counter = 0;

  always @(posedge clk_bufg) begin
    counter <= counter + 1;
  end

  assign led = counter[23:22];

endmodule
