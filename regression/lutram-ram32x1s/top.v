// Regression for openXC7/nextpnr#56 (same PR as lutram-ram32x2s).
//
// RAM32X1S is instantiated directly; like RAM32X2S it was listed in
// dram_types with no packing branch, so the cells were silently skipped and
// the placer ended the run with "no BELs remaining to implement cell type
// 'RAM32X1S'".  It is a separate case from the RAM32X2S one because the two
// pack through different halves: RAM32X1S is a single 6LUT-half RAMD32
// whose 32-bit INIT must land in BOTH halves of the LUT, so the read does
// not depend on the unconnected A6.
//
// I/O is deliberately minimal (3 pins), like lutram-ram64x1s.
//
// PASS = the flow completes and the FASM shows one LUT-as-RAM with the
// 32-bit INIT duplicated across both halves, reading through O6 (check.sh).
module top (
    input  wire clk,
    input  wire we,
    output wire led
);
    reg [4:0] addr = 5'd0;

    always @(posedge clk) begin
        addr <= addr + 5'd1;
    end

    wire o;

    RAM32X1S #(
        .INIT(32'hDEADBEEF)
    ) u (
        .A0   (addr[0]),
        .A1   (addr[1]),
        .A2   (addr[2]),
        .A3   (addr[3]),
        .A4   (addr[4]),
        .D    (addr[0] & addr[4]),
        .O    (o),
        .WCLK (clk),
        .WE   (we)
    );

    assign led = o;
endmodule
