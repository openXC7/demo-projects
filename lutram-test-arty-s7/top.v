`default_nettype none

// Arty S7-50 hardware test for 64-deep distributed RAM (RAM64X1S).
//
// yosys memory_libmap emits one RAM64X1S per data bit for ANY 64-deep memory
// with one shared read/write address -- here `reg [7:0] mem [0:63]` becomes
// 8 x RAM64X1S, all sharing one write address/WCLK/WE control set, i.e. two
// SLICEM sites (4 LUTs each).  nextpnr-xilinx used to abort on this shape:
//
//     ERROR: Cannot pack unsupported primitive: RAM64X1S
//
// so the design could not be placed at all.  With the pack_dram RAM64X1S
// path it places and must read back exactly what was written.
//
// Four write/read passes are streamed to the host as
//
//     p<pass> a=<addr> d=<data> e=<on-chip error count>\r\n
//
//   pass 1  d = a              write address / read address aliasing
//   pass 2  d = ~a             bit-level
//   pass 3  d = 0xa5^(a*7)     mixed bits from both halves of the byte
//   pass 4  d = 0x6d^(a*0x1f)  mixed, arithmetic (injective mod 256)
//
// Each read is compared on-chip (e is the running mismatch count, and led is
// lit while it is zero) *and* independently re-checked by verify.py, so a
// wrong-but-consistent packer cannot pass by agreeing with itself.
//
// Note: no `initial` contents -- yosys 0.67 drops LUTRAM initialisation for
// xc7 (both `initial` assignment lists and $readmemh) and emits RAM64X1S
// without an INIT parameter, so the LUT INIT bits cannot be exercised from a
// yosys flow at all (that path is only reachable from an imported netlist).
//
// Pattern definitions are shared with verify.py -- keep the two in sync.
module top (
    input  wire clk,     // 12 MHz oscillator (bank 15)
    output wire led,     // lit while no mismatch has been seen
    output wire tx       // UART TX, 115200 8N1
);

    function [7:0] wr_pat;
        input [2:0] p;
        input [5:0] a;
        begin
            case (p)
                3'd1:    wr_pat = {2'b00, a};                       // address as data
                3'd2:    wr_pat = ~{2'b00, a};                      // complement
                3'd3:    wr_pat = 8'hA5 ^ ({2'b00, a} * 8'h07);     // mixed
                3'd4:    wr_pat = 8'h6D ^ ({2'b00, a} * 8'h1F);     // mixed, injective
                default: wr_pat = 8'h00;
            endcase
        end
    endfunction

    // ---- memory under test: 64 x 8, one shared address (single-port) ----
    reg [7:0] mem [0:63];
    reg [5:0] addr = 6'd0;
    reg [7:0] wdata = 8'd0;
    reg       we = 1'b0;
    wire [7:0] rdata = mem[addr];

    always @(posedge clk)
        if (we) mem[addr] <= wdata;

    // ---- write / check / stream state machine ----
    localparam S_DELAY = 3'd0, S_WR_SET = 3'd1, S_WR_NEXT = 3'd2, S_RD_SET = 3'd3,
               S_RD_CMP = 3'd4, S_SEND = 3'd5, S_PASS_END = 3'd6;

    reg [2:0]  state   = S_DELAY;
    reg [5:0]  idx     = 6'd0;
    reg [2:0]  pass    = 3'd1;
    reg [21:0] delay   = 22'd0;
    reg [15:0] err_cnt = 16'd0;

    reg        sending  = 1'b0;
    reg [4:0]  byte_idx = 5'd0;
    reg [2:0]  spass    = 3'd0;     // latched line fields
    reg [5:0]  saddr    = 6'd0;
    reg [7:0]  sdata    = 8'd0;

    wire [7:0] exp_rd = wr_pat(pass, addr);

    // ---- hex nibble -> ASCII ----
    function [7:0] hex2asc;
        input [3:0] n;
        begin
            hex2asc = n < 4'd10 ? ("0" + {4'b0000, n}) : ("a" + {4'b0000, n} - 4'd10);
        end
    endfunction

    // ---- one 21-byte line: "p<p> a=<aa> d=<dd> e=<err>\r\n" ----
    reg [7:0] tx_byte;
    always @(*) begin
        case (byte_idx)
            5'd0:  tx_byte = "p";
            5'd1:  tx_byte = "0" + {5'b00000, spass};
            5'd2:  tx_byte = " ";
            5'd3:  tx_byte = "a";
            5'd4:  tx_byte = "=";
            5'd5:  tx_byte = hex2asc(saddr[5:4]);
            5'd6:  tx_byte = hex2asc(saddr[3:0]);
            5'd7:  tx_byte = " ";
            5'd8:  tx_byte = "d";
            5'd9:  tx_byte = "=";
            5'd10: tx_byte = hex2asc(sdata[7:4]);
            5'd11: tx_byte = hex2asc(sdata[3:0]);
            5'd12: tx_byte = " ";
            5'd13: tx_byte = "e";
            5'd14: tx_byte = "=";
            5'd15: tx_byte = hex2asc(err_cnt[15:12]);
            5'd16: tx_byte = hex2asc(err_cnt[11:8]);
            5'd17: tx_byte = hex2asc(err_cnt[7:4]);
            5'd18: tx_byte = hex2asc(err_cnt[3:0]);
            5'd19: tx_byte = 8'h0D;  // '\r'
            5'd20: tx_byte = 8'h0A;  // '\n'
            default: tx_byte = 8'h00;
        endcase
    end

    wire s_axis_tvalid = sending;
    wire s_axis_tready;
    wire [7:0] s_axis_tdata = tx_byte;

    always @(posedge clk) begin
        case (state)
            S_DELAY: begin
                if (delay == 22'hFFFFF)      // ~87 ms @ 12 MHz between cycles
                    state <= S_WR_SET;
                else
                    delay <= delay + 22'd1;
            end
            S_WR_SET: begin
                addr   <= idx;
                wdata  <= wr_pat(pass, idx);
                we     <= 1'b1;
                state  <= S_WR_NEXT;
            end
            S_WR_NEXT: begin
                we <= 1'b0;
                if (idx == 6'd63) begin
                    idx   <= 6'd0;
                    state <= S_RD_SET;       // whole pattern written, read it back
                end else begin
                    idx   <= idx + 6'd1;
                    state <= S_WR_SET;
                end
            end
            S_RD_SET: begin
                addr  <= idx;
                state <= S_RD_CMP;
            end
            S_RD_CMP: begin
                if (rdata != exp_rd)
                    err_cnt <= err_cnt + 16'd1;
                spass    <= pass;
                saddr    <= idx;
                sdata    <= rdata;
                byte_idx <= 5'd0;
                sending  <= 1'b1;
                state    <= S_SEND;
            end
            S_SEND: begin
                if (s_axis_tready) begin
                    if (byte_idx == 5'd20) begin
                        sending <= 1'b0;
                        if (idx == 6'd63) begin
                            state <= S_PASS_END;
                        end else begin
                            idx   <= idx + 6'd1;
                            state <= S_RD_SET;
                        end
                    end else begin
                        byte_idx <= byte_idx + 5'd1;
                    end
                end
            end
            S_PASS_END: begin
                idx   <= 6'd0;
                pass  <= (pass == 3'd4) ? 3'd1 : (pass + 3'd1);
                delay <= 22'd0;
                state <= S_DELAY;
            end
            default: state <= S_DELAY;
        endcase
    end

    assign led = (err_cnt == 16'd0);

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
