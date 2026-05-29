// BUFG.v
// Simple stub for Xilinx BUFG primitive for Verilator simulation
// In simulation, this just passes the clock through

module BUFG (
    output O,
    input  I
);

assign O = I;

endmodule
