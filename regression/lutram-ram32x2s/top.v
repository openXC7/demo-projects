// Regression for openXC7/nextpnr#56.
//
// RAM32X2S is instantiated directly: yosys does not infer it (memory_libmap
// maps 32-deep 2-bit memories onto other macros), but a netlist can carry
// it -- from a hand instantiation like this one, or from any synthesis that
// emits the macro -- and nextpnr listed it in dram_types with no packing
// branch, so the cells were silently skipped and the placer ended the run
// with "no BELs remaining to implement cell type 'RAM32X2S'".
//
// I/O is deliberately minimal (3 pins), like lutram-ram64x1s.
//
// PASS = the flow completes and the FASM shows the one-LUT-per-cell shape:
// both bits of the cell in ONE LUT position, bit 0 (INIT_00) in the O5
// half and bit 1 (INIT_01) in the O6 half of the same INIT[63:0], plus
// the SMALL and RAM features (check.sh).
module top (
    input  wire clk,
    input  wire we,
    output wire led
);
    reg [4:0] addr = 5'd0;
    reg [1:0] din  = 2'd1;

    always @(posedge clk) begin
        addr <= addr + 5'd1;
        din  <= din + 2'd1;
    end

    wire o0, o1;

    RAM32X2S #(
        .INIT_00(32'hCAFEBABE),
        .INIT_01(32'h12345678)
    ) u (
        .A0   (addr[0]),
        .A1   (addr[1]),
        .A2   (addr[2]),
        .A3   (addr[3]),
        .A4   (addr[4]),
        .D0   (din[0]),
        .D1   (din[1]),
        .O0   (o0),
        .O1   (o1),
        .WCLK (clk),
        .WE   (we)
    );

    // Keeps both RAM outputs alive.
    assign led = o0 ^ o1;
endmodule
