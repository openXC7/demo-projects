// Block RAM content test for xcbrup.
//
// Two memories, both initialised from hex files, both read out over a 1 Mbaud
// UART so the host can compare every word against a reproducible pattern.
//
//   mem0   8192 x 32   yosys maps this to RAMB18E1 x 15 (READ_WIDTH_A = 9)
//   mem36  4096 x 18   yosys maps this to RAMB36E1 x 2
//
// The two cell types take different paths through xcbrup's init handling: a
// RAMB18 half holds its own 18432 bits, while a RAMB36 cell interleaves the
// INIT_xx pair by bit parity into the two halves of its tile. Streaming both
// puts both paths on silicon.
//
// Frame format, little endian data bytes:
//
//   0xA5 0x5A b0 b1 b2 b3        mem0  word (32 bits)
//   0xA5 0x5B b0 b1 [b2 & 0x03]  mem36 word (18 bits)
//
// Contents come from gen_pattern.py, driven by one integer seed. The design
// streams mem0 then mem36, forever.

module uart_tx (
    input  wire       clk,
    input  wire [7:0] din,
    input  wire       strobe,
    output wire       busy,
    output reg        tx
);

  // 100 MHz / 100 = 1 Mbaud
  localparam DIV = 100;

  reg [9:0] frame;
  reg [3:0] left;
  reg [6:0] cnt;
  reg       run = 1'b0;

  assign busy = run;

  always @(posedge clk) begin
    if (!run) begin
      if (strobe) begin
        frame <= {1'b1, din, 1'b0};
        left  <= 4'd10;
        cnt   <= 7'd0;
        run   <= 1'b1;
        tx    <= 1'b0;
      end
    end else if (cnt == DIV - 1) begin
      cnt   <= 7'd0;
      frame <= {1'b1, frame[9:1]};
      left  <= left - 1'b1;
      tx    <= frame[1];
      if (left == 4'd1) begin
        run <= 1'b0;
        tx  <= 1'b1;
      end
    end else begin
      cnt <= cnt + 1'b1;
    end
  end

endmodule


module top (
    input  wire       clk,
    output wire       tx,
    output wire [3:0] led
);

  localparam N0 = 8192;
  localparam N1 = 4096;

  reg [31:0] mem0  [0:N0-1];
  reg [17:0] mem36 [0:N1-1];

  initial $readmemh("bramtest.hex", mem0);
  initial $readmemh("bramtest36.hex", mem36);

  reg [12:0] addr0 = 0;
  reg [11:0] addr1 = 0;
  reg [31:0] d0;
  reg [17:0] d1;

  always @(posedge clk) begin
    d0 <= mem0[addr0];
    d1 <= mem36[addr1];
  end

  assign led = d0[3:0];

  localparam S_READ    = 3'd0;
  localparam S_SEND    = 3'd1;
  localparam S_STARTED = 3'd2;
  localparam S_WAIT    = 3'd3;
  localparam S_NEXT    = 3'd4;

  reg [2:0] bidx   = 3'd0;
  reg [2:0] st     = S_READ;
  reg       strobe = 1'b0;
  reg       phase  = 1'b0;    // 0 = mem0, 1 = mem36

  wire       tx_busy;
  wire [2:0] last_byte = phase ? 3'd4 : 3'd5;

  wire [7:0] din =
      phase == 1'b0 ?
          (bidx == 3'd0 ? 8'hA5 :
           bidx == 3'd1 ? 8'h5A :
           bidx == 3'd2 ? d0[7:0] :
           bidx == 3'd3 ? d0[15:8] :
           bidx == 3'd4 ? d0[23:16] : d0[31:24]) :
          (bidx == 3'd0 ? 8'hA5 :
           bidx == 3'd1 ? 8'h5B :
           bidx == 3'd2 ? d1[7:0] :
           bidx == 3'd3 ? d1[15:8] : {6'b0, d1[17:16]});

  always @(posedge clk) begin
    strobe <= 1'b0;
    case (st)
      S_READ: st <= S_SEND;
      S_SEND: begin
        if (!tx_busy) begin
          strobe <= 1'b1;
          st     <= S_STARTED;
        end
      end
      S_STARTED: begin
        if (tx_busy)
          st <= S_WAIT;
      end
      S_WAIT: begin
        if (!tx_busy) begin
          if (bidx == last_byte)
            st <= S_NEXT;
          else begin
            bidx <= bidx + 1'b1;
            st   <= S_SEND;
          end
        end
      end
      S_NEXT: begin
        bidx <= 3'd0;
        if (phase == 1'b0) begin
          if (addr0 == N0 - 1) begin
            addr0 <= 13'd0;
            phase <= 1'b1;
          end else begin
            addr0 <= addr0 + 1'b1;
          end
        end else begin
          if (addr1 == N1 - 1) begin
            addr1 <= 12'd0;
            phase <= 1'b0;
          end else begin
            addr1 <= addr1 + 1'b1;
          end
        end
        st <= S_READ;
      end
      default: st <= S_READ;
    endcase
  end

  uart_tx uart (
      .clk   (clk),
      .din   (din),
      .strobe(strobe),
      .busy  (tx_busy),
      .tx    (tx)
  );

endmodule
