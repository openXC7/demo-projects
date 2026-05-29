// Sonata "telegraph" smoke test — VC707 125 MHz variant.
// 115200-baud 8N1 bit-banged UART walking A..Z with 100 ms per char,
// recalculated for CLK_HZ = 125_000_000 (SGMIICLK_Q0 crystal × fixed mul).
//
//   CLKS_PER_BIT  = 125e6 / 115200 = 1085         (was 217  at 25 MHz)
//   DELAY_CYCLES  = 125e6 / 10     = 12_500_000   (was 2.5M at 25 MHz)
//
// Register widths widened to hold the larger counts: baud_cnt 9→11 bits,
// pause_cnt 22→24 bits.

module sonata_top (
    input        clk,
    input        nrst,
    input        ser_rx,
    output reg   ser_tx = 1'b1,
    output       led__0,
    output       led__1,
    output       led__2,
    output       led__3
);
  wire _unused = &{1'b0, ser_rx};

  localparam integer CLK_HZ        = 125_000_000;
  localparam integer BAUD          = 115_200;
  localparam integer CLKS_PER_BIT  = CLK_HZ / BAUD;   // 1085
  localparam integer DELAY_CYCLES  = CLK_HZ / 10;     // 12_500_000

  localparam S_START = 3'd0;
  localparam S_DATA  = 3'd1;
  localparam S_STOP  = 3'd2;
  localparam S_PAUSE = 3'd3;

  reg [2:0]  state     = S_START;
  reg [7:0]  ch        = "A";
  reg [2:0]  bit_idx   = 3'd0;
  reg [10:0] baud_cnt  = 11'd0;   // widened 9→11 (CLKS_PER_BIT=1085 < 2048)
  reg [23:0] pause_cnt = 24'd0;   // widened 22→24 (DELAY_CYCLES=12.5M < 16M)

  reg [25:0] heartbeat = 26'd0;
  always @(posedge clk) begin
    if (!nrst) heartbeat <= 26'd0;
    else       heartbeat <= heartbeat + 26'd1;
  end

  assign led__0 = heartbeat[25];   // bumped up from [23] to slow blink at 125 MHz
  assign led__1 = ser_tx;
  assign led__2 = (state == S_PAUSE);
  assign led__3 = ~nrst;

  always @(posedge clk) begin
    if (!nrst) begin
      state    <= S_START;
      ch       <= "A";
      bit_idx  <= 3'd0;
      baud_cnt <= 11'd0;
      pause_cnt<= 24'd0;
      ser_tx   <= 1'b1;
    end else begin
      case (state)
        S_START: begin
          ser_tx <= 1'b0;
          if (baud_cnt == CLKS_PER_BIT - 1) begin
            baud_cnt <= 11'd0;
            bit_idx  <= 3'd0;
            state    <= S_DATA;
          end else baud_cnt <= baud_cnt + 11'd1;
        end
        S_DATA: begin
          ser_tx <= ch[bit_idx];
          if (baud_cnt == CLKS_PER_BIT - 1) begin
            baud_cnt <= 11'd0;
            if (bit_idx == 3'd7) state <= S_STOP;
            else                 bit_idx <= bit_idx + 3'd1;
          end else baud_cnt <= baud_cnt + 11'd1;
        end
        S_STOP: begin
          ser_tx <= 1'b1;
          if (baud_cnt == CLKS_PER_BIT - 1) begin
            baud_cnt <= 11'd0;
            state    <= S_PAUSE;
          end else baud_cnt <= baud_cnt + 11'd1;
        end
        S_PAUSE: begin
          if (pause_cnt == DELAY_CYCLES - 1) begin
            pause_cnt <= 24'd0;
            ch <= (ch == "Z") ? "A" : ch + 8'd1;
            state <= S_START;
          end else pause_cnt <= pause_cnt + 24'd1;
        end
      endcase
    end
  end
endmodule
