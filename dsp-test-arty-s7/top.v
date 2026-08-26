`default_nettype none

// openXC7/nextpnr-xilinx issue #159 reproducer (Arty S7-50).
//
// The datapath below is the gist verbatim: two 16-bit counters drive one
// inferred DSP48E1 multiply (p = a * b), and an XOR tree keeps every product
// bit live.  On a buggy nextpnr-xilinx the INMODE/ALUMODE/OPMODE tile-constant
// bits are never written, INMODE[1] gates the A operand to zero, and p reads
// 0 on silicon.  The UART path snapshots (a, b, p) and prints them as
// "a=%04x b=%04x p=%08x\r\n" so a host can check p == a*b.
//
// Scaffolding split (for future DSP tests):
//   - "DSP under test" section (the counters + p = a * b + led below) is the
//     only part a new DSP test replaces.
//   - Everything after it (throttle, hex2asc, byte formatter, AXI-stream
//     sender, uart_tx instantiation) is reusable: add your own DUT instance,
//     widen/adjust the `sa/sb/sp` snapshot regs, and extend the byte-index
//     case to emit the extra fields -- do not touch the UART plumbing.
module top (
    input  wire clk,     // 12 MHz oscillator (bank 15)
    output wire led,     // ^p -- "alive" indicator, also keeps p live
    output wire tx       // UART TX, 115200 8N1
);

    // ---- DSP under test (gist verbatim) ----
    reg [15:0] a = 16'd1;
    reg [15:0] b = 16'd1;
    always @(posedge clk) begin
        a <= a + 16'd1;
        b <= b + 16'd3;
    end
    wire [31:0] p = a * b;
    assign led = ^p;

    // ---- send a snapshot line every 2^17-1 clocks (~10.9 ms @ 12 MHz) ----
    // NOTE: the period must NOT be a multiple of 2^16, otherwise the 16-bit
    // a/b counters wrap between snapshots and every line reads a=0000 (which
    // would make p=0 a *correct* answer and hide the DSP bug).  2^17-1 walks
    // a and b through all their values, so a is (almost) never zero.
    reg [16:0] throttle = 17'd0;
    wire tick = (throttle == 17'd131070);
    always @(posedge clk) begin
        if (tick)
            throttle <= 17'd0;
        else
            throttle <= throttle + 17'd1;
    end

    // ---- hex nibble -> ASCII ----
    function [7:0] hex2asc;
        input [3:0] nib;
        begin
            if (nib < 4'd10)
                hex2asc = 8'h30 + nib;  // '0'..'9'
            else
                hex2asc = 8'h57 + nib;  // 'a'..'f'
        end
    endfunction

    // ---- snapshot + byte formatting state ----
    reg [15:0] sa = 16'd0;
    reg [15:0] sb = 16'd0;
    reg [31:0] sp = 32'd0;
    reg        sending = 1'b0;
    reg [4:0]  byte_idx = 5'd0;   // 0..25, 26 bytes per line

    reg [7:0] tx_byte;
    always @(*) begin
        case (byte_idx)
            5'd0:  tx_byte = "a";
            5'd1:  tx_byte = "=";
            5'd2:  tx_byte = hex2asc(sa[15:12]);
            5'd3:  tx_byte = hex2asc(sa[11:8]);
            5'd4:  tx_byte = hex2asc(sa[7:4]);
            5'd5:  tx_byte = hex2asc(sa[3:0]);
            5'd6:  tx_byte = " ";
            5'd7:  tx_byte = "b";
            5'd8:  tx_byte = "=";
            5'd9:  tx_byte = hex2asc(sb[15:12]);
            5'd10: tx_byte = hex2asc(sb[11:8]);
            5'd11: tx_byte = hex2asc(sb[7:4]);
            5'd12: tx_byte = hex2asc(sb[3:0]);
            5'd13: tx_byte = " ";
            5'd14: tx_byte = "p";
            5'd15: tx_byte = "=";
            5'd16: tx_byte = hex2asc(sp[31:28]);
            5'd17: tx_byte = hex2asc(sp[27:24]);
            5'd18: tx_byte = hex2asc(sp[23:20]);
            5'd19: tx_byte = hex2asc(sp[19:16]);
            5'd20: tx_byte = hex2asc(sp[15:12]);
            5'd21: tx_byte = hex2asc(sp[11:8]);
            5'd22: tx_byte = hex2asc(sp[7:4]);
            5'd23: tx_byte = hex2asc(sp[3:0]);
            5'd24: tx_byte = 8'h0D;  // '\r'
            5'd25: tx_byte = 8'h0A;  // '\n'
            default: tx_byte = 8'h00;
        endcase
    end

    // ---- push bytes into the AXI-stream UART ----
    wire s_axis_tvalid = sending;
    wire s_axis_tready;
    wire [7:0] s_axis_tdata = tx_byte;

    always @(posedge clk) begin
        if (sending) begin
            if (s_axis_tvalid && s_axis_tready) begin
                if (byte_idx == 5'd25)
                    sending <= 1'b0;
                else
                    byte_idx <= byte_idx + 5'd1;
            end
        end else if (tick) begin
            sa       <= a;
            sb       <= b;
            sp       <= p;
            byte_idx <= 5'd0;
            sending  <= 1'b1;
        end
    end

    uart_tx #(
        .DATA_WIDTH(8)
    ) u_uart (
        .clk           (clk),
        .rst           (1'b0),
        .s_axis_tdata  (s_axis_tdata),
        .s_axis_tvalid (s_axis_tvalid),
        .s_axis_tready (s_axis_tready),
        .txd           (tx),
        .busy          (),
        .prescale      (16'd13)   // 12e6 / (8 * 115200) ~= 13.02
    );

endmodule
