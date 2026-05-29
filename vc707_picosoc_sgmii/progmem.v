module progmem (
    // Clock & reset
    input wire clk,
    input wire rstn,

    // PicoRV32 bus interface
    input  wire        valid,
    output wire        ready,
    input  wire [31:0] addr,
    output wire [31:0] rdata
);

  // ============================================================================

  localparam MEM_SIZE_BITS = 12;  // In 32-bit words
  localparam MEM_SIZE = 1 << MEM_SIZE_BITS;
  localparam MEM_ADDR_MASK = 32'h0010_0000;

  // ============================================================================

  wire [MEM_SIZE_BITS-1:0] mem_addr;
  reg  [             31:0] mem_data;

  // Memory implemented as synchronous case statement for better simulator compatibility
  always @(posedge clk) begin
    case (mem_addr)
      12'h000: mem_data <= 32'h00000093;
      12'h001: mem_data <= 32'h00000193;
      12'h002: mem_data <= 32'h00000213;
      12'h003: mem_data <= 32'h00000293;
      12'h004: mem_data <= 32'h00000313;
      12'h005: mem_data <= 32'h00000393;
      12'h006: mem_data <= 32'h00000413;
      12'h007: mem_data <= 32'h00000493;
      12'h008: mem_data <= 32'h00000513;
      12'h009: mem_data <= 32'h00000593;
      12'h00a: mem_data <= 32'h00000613;
      12'h00b: mem_data <= 32'h00000693;
      12'h00c: mem_data <= 32'h00000713;
      12'h00d: mem_data <= 32'h00000793;
      12'h00e: mem_data <= 32'h00000813;
      12'h00f: mem_data <= 32'h00000893;
      12'h010: mem_data <= 32'h00000913;
      12'h011: mem_data <= 32'h00000993;
      12'h012: mem_data <= 32'h00000a13;
      12'h013: mem_data <= 32'h00000a93;
      12'h014: mem_data <= 32'h00000b13;
      12'h015: mem_data <= 32'h00000b93;
      12'h016: mem_data <= 32'h00000c13;
      12'h017: mem_data <= 32'h00000c93;
      12'h018: mem_data <= 32'h00000d13;
      12'h019: mem_data <= 32'h00000d93;
      12'h01a: mem_data <= 32'h00000e13;
      12'h01b: mem_data <= 32'h00000e93;
      12'h01c: mem_data <= 32'h00000f13;
      12'h01d: mem_data <= 32'h00000f93;
      12'h01e: mem_data <= 32'h03000537;
      12'h01f: mem_data <= 32'h00100593;
      12'h020: mem_data <= 32'h00b52023;
      12'h021: mem_data <= 32'h00000513;
      12'h022: mem_data <= 32'h00052023;
      12'h023: mem_data <= 32'h00450513;
      12'h024: mem_data <= 32'hfe254ce3;
      12'h025: mem_data <= 32'h03000537;
      12'h026: mem_data <= 32'h00300593;
      12'h027: mem_data <= 32'h00b52023;
      12'h028: mem_data <= 32'h00000517;
      12'h029: mem_data <= 32'h1c450513;
      12'h02a: mem_data <= 32'h00000593;
      12'h02b: mem_data <= 32'h00000613;
      12'h02c: mem_data <= 32'h00c5dc63;
      12'h02d: mem_data <= 32'h00052683;
      12'h02e: mem_data <= 32'h00d5a023;
      12'h02f: mem_data <= 32'h00450513;
      12'h030: mem_data <= 32'h00458593;
      12'h031: mem_data <= 32'hfec5c8e3;
      12'h032: mem_data <= 32'h03000537;
      12'h033: mem_data <= 32'h00700593;
      12'h034: mem_data <= 32'h00b52023;
      12'h035: mem_data <= 32'h00000513;
      12'h036: mem_data <= 32'h00000593;
      12'h037: mem_data <= 32'h00b55863;
      12'h038: mem_data <= 32'h00052023;
      12'h039: mem_data <= 32'h00450513;
      12'h03a: mem_data <= 32'hfeb54ce3;
      12'h03b: mem_data <= 32'h03000537;
      12'h03c: mem_data <= 32'h00f00593;
      12'h03d: mem_data <= 32'h00b52023;
      12'h03e: mem_data <= 32'h0a0000ef;
      12'h03f: mem_data <= 32'h0000006f;
      12'h040: mem_data <= 32'h020002b7;
      12'h041: mem_data <= 32'h12000313;
      12'h042: mem_data <= 32'h00629023;
      12'h043: mem_data <= 32'h000281a3;
      12'h044: mem_data <= 32'h02060863;
      12'h045: mem_data <= 32'h00800f13;
      12'h046: mem_data <= 32'h0ff67393;
      12'h047: mem_data <= 32'h0073de93;
      12'h048: mem_data <= 32'h01d28023;
      12'h049: mem_data <= 32'h010eee93;
      12'h04a: mem_data <= 32'h01d28023;
      12'h04b: mem_data <= 32'h00139393;
      12'h04c: mem_data <= 32'h0ff3f393;
      12'h04d: mem_data <= 32'hffff0f13;
      12'h04e: mem_data <= 32'hfe0f12e3;
      12'h04f: mem_data <= 32'h00628023;
      12'h050: mem_data <= 32'h04058663;
      12'h051: mem_data <= 32'h00800f13;
      12'h052: mem_data <= 32'h00054383;
      12'h053: mem_data <= 32'h0073de93;
      12'h054: mem_data <= 32'h01d28023;
      12'h055: mem_data <= 32'h010eee93;
      12'h056: mem_data <= 32'h01d28023;
      12'h057: mem_data <= 32'h0002ce83;
      12'h058: mem_data <= 32'h002efe93;
      12'h059: mem_data <= 32'h001ede93;
      12'h05a: mem_data <= 32'h00139393;
      12'h05b: mem_data <= 32'h01d3e3b3;
      12'h05c: mem_data <= 32'h0ff3f393;
      12'h05d: mem_data <= 32'hffff0f13;
      12'h05e: mem_data <= 32'hfc0f1ae3;
      12'h05f: mem_data <= 32'h00750023;
      12'h060: mem_data <= 32'h00150513;
      12'h061: mem_data <= 32'hfff58593;
      12'h062: mem_data <= 32'hfb9ff06f;
      12'h063: mem_data <= 32'h08000313;
      12'h064: mem_data <= 32'h006281a3;
      12'h065: mem_data <= 32'h00008067;
      12'h066: mem_data <= 32'h03000737;
      12'h067: mem_data <= 32'h00100793;
      12'h068: mem_data <= 32'h00f72023;
      12'h069: mem_data <= 32'h43c00693;
      12'h06a: mem_data <= 32'h020007b7;
      12'h06b: mem_data <= 32'h00d7a223;
      12'h06c: mem_data <= 32'h0aa00793;
      12'h06d: mem_data <= 32'h00f72023;
      12'h06e: mem_data <= 32'h00100837;
      12'h06f: mem_data <= 32'h020006b7;
      12'h070: mem_data <= 32'h00262737;
      12'h071: mem_data <= 32'h00100793;
      12'h072: mem_data <= 32'h00868693;
      12'h073: mem_data <= 32'h59f70713;
      12'h074: mem_data <= 32'h08000893;
      12'h075: mem_data <= 32'h03000537;
      12'h076: mem_data <= 32'h24080613;
      12'h077: mem_data <= 32'h00064583;
      12'h078: mem_data <= 32'h04059a63;
      12'h079: mem_data <= 32'hff010113;
      12'h07a: mem_data <= 32'h0140006f;
      12'h07b: mem_data <= 32'h00160613;
      12'h07c: mem_data <= 32'h00b6a023;
      12'h07d: mem_data <= 32'h00064583;
      12'h07e: mem_data <= 32'hfe059ae3;
      12'h07f: mem_data <= 32'h00012623;
      12'h080: mem_data <= 32'h00c12603;
      12'h081: mem_data <= 32'h00c75c63;
      12'h082: mem_data <= 32'h03178263;
      12'h083: mem_data <= 32'h00179793;
      12'h084: mem_data <= 32'h00f52023;
      12'h085: mem_data <= 32'h24080613;
      12'h086: mem_data <= 32'hfddff06f;
      12'h087: mem_data <= 32'h00c12603;
      12'h088: mem_data <= 32'h00160613;
      12'h089: mem_data <= 32'h00c12623;
      12'h08a: mem_data <= 32'hfd9ff06f;
      12'h08b: mem_data <= 32'h00100793;
      12'h08c: mem_data <= 32'hfe1ff06f;
      12'h08d: mem_data <= 32'h00160613;
      12'h08e: mem_data <= 32'h00b6a023;
      12'h08f: mem_data <= 32'hfa1ff06f;
      12'h090: mem_data <= 32'h6f636950;
      12'h091: mem_data <= 32'h20436f53;
      12'h092: mem_data <= 32'h76696c61;
      12'h093: mem_data <= 32'h6e6f2065;
      12'h094: mem_data <= 32'h37435620;
      12'h095: mem_data <= 32'h40203730;
      12'h096: mem_data <= 32'h35323120;
      12'h097: mem_data <= 32'h7a484d20;
      12'h098: mem_data <= 32'h00000a0d;
      default: mem_data <= 32'h00000000;
    endcase
  end

  // ============================================================================

  reg o_ready;

  always @(posedge clk or negedge rstn)
    if (!rstn) o_ready <= 1'd0;
    else o_ready <= valid && ((addr & MEM_ADDR_MASK) != 0);

  // Output connectins
  assign ready    = o_ready;
  assign rdata    = mem_data;
  assign mem_addr = addr[MEM_SIZE_BITS+1:2];

endmodule
