// A BEL attribute in the form nextpnr writes into NEXTPNR_BEL, <site>/<bel>.
// The flip-flop is fed by its own inverter, a LUT the packer pairs with it.
module top(input clk_in, output led);
  wire q;
  (* BEL = "SLICE_X0Y0/BFF" *) FDRE ff (.C(clk_in), .CE(1'b1), .R(1'b0), .D(~q), .Q(q));
  assign led = q;
endmodule
