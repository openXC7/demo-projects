// Regression for openXC7/nextpnr-xilinx#167.
//
// A pad-fed BUFIO (undivided I/O clock buffer) must emit BUFIO_Yn.IN_USE.
// #157 gave BUFIO a packer -- the cell is renamed to BUFIO_BUFIO and binds to
// the bel -- but nothing then switched the buffer on: no BUFIO_Y*.IN_USE ever
// appeared in the FASM, so the bitstream assembled with the enable clear and
// the I/O clock never started -- the same silent-death shape as the RCLK2IO
// leaf on the BUFR side.
//
// expect.txt asserts BUFIO_Y*.IN_USE.  Pre-fix the design dies at placement
// ("no Bels remaining of type 'BUFIO'" -- there is no packer).
//
// NOTE: this case cannot currently reach the FASM on this tree.  The BUFIO's I
// pin is reachable only through the HCLK_IOI_I2IOCLK leg, and the segbits for
// that path (segbits_hclk_ioi3.db) only landed in the fork's prjxray-db
// 77e52f10 (nextpnr-xilinx f2a469b8); this tree's chipdb is generated from
// prjxray-db ab1fc60c, whose HCLK_IOI3 database has neither the I2IOCLK bits
// nor BUFIO_Y*.IN_USE, so the router rejects the path ("Failed to route arc
// ... INBUF_EN_OUT to ... BUFIO_X0Y<y>.I").  Once the chipdb is regenerated
// from a prjxray-db with those bits, the design places and routes and the
// enable appears.
//
// IBUF -> BUFIO -> ODDR: the clock reaches the I/O tile through ordinary
// routing, the ODDR's Q drives the LED, and the BUFIO enable is the one bit
// the route does not carry.  Clock on E3 (MRCC, bank 35), LED on D4 (same
// bank, Arty A7).
module top (
    input  wire clk,
    output wire led
);
    wire clk_ibuf, bufio_out;

    IBUF clk_ibuf_i (.I(clk), .O(clk_ibuf));
    BUFIO bufio_i (.I(clk_ibuf), .O(bufio_out));

    ODDR #(
        .DDR_CLK_EDGE("OPPOSITE_EDGE"),
        .INIT(1'b0),
        .SRTYPE("SYNC")
    ) oddr_i (
        .Q(led),
        .C(bufio_out),
        .CE(1'b1),
        .D1(1'b1),
        .D2(1'b0),
        .R(1'b0),
        .S(1'b0)
    );
endmodule
