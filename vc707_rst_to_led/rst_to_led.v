// SPDX-License-Identifier: ISC
//
// VC707 minimal "press the reset pushbutton, an LED lights" passthrough.
// Pure combinational: IBUF → INT routing → OBUF. No clock, no register,
// no BUFG, no IBUFDS. The smallest possible bitstream that exercises a
// real left-side LIOB18/LIOI/INT_L → OBUF path through the open flow.
//
//   AV40  (CPU_RESET pushbutton, LIOB18_X81Y128 / LIOI_X82Y128)
//     │
//     ▼ IBUF + routing through INT_L
//   AM39  (GPIO_LED_0,           LIOB18_X81Y143 / LIOI_X82Y143)
module top (
    input  wire rst,
    output wire led
);
    assign led = rst;
endmodule
