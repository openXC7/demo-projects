// Bank of N chained 16-deep by 6-bit FIFOs in distributed RAM.
//
// Each stage's memory is 16 words deep, so yosys maps it to a RAM32M with
// address bit 4 (LUT pin 5 of every lane) tied to GND.  The read and write
// pointers of the stage fan out to the lane address pins of the same
// RAM32M, which is the routing pattern that starved the constant router
// of the GFAN wires in the original design (openXC7/nextpnr-xilinx#180).
// Stages advance at different, data-dependent rates so nothing is merged
// or trimmed.
//
// The bug is seed-dependent, so the case pins --seed 1 via nextpnr_flags
// (nextpnr's seedless default RNG stream happens not to reproduce it).
// Measured on xc7a35tcsg324: at seed 1 with N=48, the pre-fix fill leaves
// 124 GND sinks unreached and 11 of the 48 RAM32M slices read their
// address bit 4 as 1; N=16 leaves no broken slice at the same seed.
module top #(
    parameter N = 48
) (
    input clk100,
    input cpu_reset_n,
    input [3:0] sw,
    output reg [3:0] led
);
    wire clk = clk100;
    reg rst = 1'b1;
    always @(posedge clk) rst <= ~cpu_reset_n;

    // Data source and per-stage pop pattern.
    reg [15:0] rnd = 16'hACE1;
    always @(posedge clk)
        if (!sw[1]) rnd <= {rnd[14:0], rnd[15] ^ rnd[13] ^ rnd[12] ^ rnd[10]};

    wire [6*(N+1)-1:0] d;
    wire [N:0] v;
    wire [N-1:0] full, empty;
    assign d[5:0] = rnd[5:0];
    assign v[0] = sw[0] & rnd[7];

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : stage
            reg [5:0] mem [0:15];
            reg [4:0] wp = 5'd0, rp = 5'd0;
            wire we = v[i] & ~full[i];
            wire re = ~empty[i] & rnd[(3*i+1) % 16];
            assign empty[i] = (wp == rp);
            assign full[i] = (wp[3:0] == rp[3:0]) & (wp[4] ^ rp[4]);

            always @(posedge clk)
                if (we) mem[wp[3:0]] <= d[6*i +: 6];
            wire [5:0] q = mem[rp[3:0]];

            always @(posedge clk)
                if (rst) begin
                    wp <= 5'd0;
                    rp <= 5'd0;
                end else begin
                    if (we) wp <= wp + 5'd1;
                    if (re) rp <= rp + 5'd1;
                end

            reg [5:0] q_r = 6'd0;
            reg v_r = 1'b0;
            always @(posedge clk) begin
                v_r <= re & ~rst;
                if (re) q_r <= {q[4:0], q[5]};
            end
            assign d[6*(i+1) +: 6] = q_r;
            assign v[i+1] = v_r;
        end
    endgenerate

    always @(posedge clk)
        led <= {^d[6*N +: 6], v[N], |full, sw[2] ^ empty[N-1]};
endmodule
