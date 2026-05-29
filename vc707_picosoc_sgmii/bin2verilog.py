#!/usr/bin/env python3
"""
bin2verilog.py - Convert binary firmware to Verilog memory initialization module

Usage:
    python3 bin2verilog.py [firmware.bin]

Arguments:
    firmware.bin    Binary file to convert (default: firmware.bin)

Output:
    Verilog module 'progmem' with initialized memory array
    Output is written to stdout, redirect to save to file:
        python3 bin2verilog.py firmware.bin > progmem.v
"""

import struct
import sys
import os

def print_usage():
    """Print usage information"""
    print(__doc__, file=sys.stderr)

def bin2verilog(binary_file):
    """
    Convert binary file to Verilog memory initialization module

    Args:
        binary_file: Path to binary firmware file

    Returns:
        0 on success, 1 on error
    """
    # Check if file exists
    if not os.path.isfile(binary_file):
        print(f"Error: File not found: {binary_file}", file=sys.stderr)
        return 1

    # Read binary data
    try:
        with open(binary_file, "rb") as f:
            data = f.read()
    except IOError as e:
        print(f"Error reading file: {e}", file=sys.stderr)
        return 1

    # Check for empty file
    if len(data) == 0:
        print(f"Warning: Empty binary file: {binary_file}", file=sys.stderr)

    # Print file info to stderr for debugging
    print(f"Converting: {binary_file} ({len(data)} bytes, {(len(data)+3)//4} words)",
          file=sys.stderr)

    # Generate Verilog module
    print(f"module progmem (")
    print(f"    // Clock & reset")
    print(f"    input wire clk,")
    print(f"    input wire rstn,")
    print(f"")
    print(f"    // PicoRV32 bus interface")
    print(f"    input  wire        valid,")
    print(f"    output wire        ready,")
    print(f"    input  wire [31:0] addr,")
    print(f"    output wire [31:0] rdata")
    print(f");")
    print(f"")
    print(f"  // ============================================================================")
    print(f"")
    print(f"  localparam MEM_SIZE_BITS = 12;  // In 32-bit words")
    print(f"  localparam MEM_SIZE = 1 << MEM_SIZE_BITS;")
    print(f"  localparam MEM_ADDR_MASK = 32'h0010_0000;")
    print(f"")
    print(f"  // ============================================================================")
    print(f"")
    print(f"  wire [MEM_SIZE_BITS-1:0] mem_addr;")
    print(f"  reg  [             31:0] mem_data;")
    print(f"")
    print(f"  // Memory implemented as synchronous case statement for better simulator compatibility")
    print(f"  always @(posedge clk) begin")
    print(f"    case (mem_addr)")

    # Convert binary data to 32-bit words
    num_words = (len(data) + 3) // 4
    for i in range(0, len(data), 4):
        word = data[i:i+4].ljust(4, b'\x00')
        value = struct.unpack("<I", word)[0]
        print(f"      12'h{i//4:03x}: mem_data <= 32'h{value:08x};")

    print(f"      default: mem_data <= 32'h00000000;")
    print(f"    endcase")
    print(f"  end")
    print(f"")
    print(f"  // ============================================================================")
    print(f"")
    print(f"  reg o_ready;")
    print(f"")
    print(f"  always @(posedge clk or negedge rstn)")
    print(f"    if (!rstn) o_ready <= 1'd0;")
    print(f"    else o_ready <= valid && ((addr & MEM_ADDR_MASK) != 0);")
    print(f"")
    print(f"  // Output connectins")
    print(f"  assign ready    = o_ready;")
    print(f"  assign rdata    = mem_data;")
    print(f"  assign mem_addr = addr[MEM_SIZE_BITS+1:2];")
    print(f"")
    print(f"endmodule")

    return 0

def main():
    """Main entry point"""
    # Parse command line arguments
    if len(sys.argv) > 2:
        print("Error: Too many arguments", file=sys.stderr)
        print_usage()
        return 1

    if len(sys.argv) == 2 and sys.argv[1] in ['-h', '--help', 'help']:
        print_usage()
        return 0

    # Get binary filename (default to firmware.bin for backward compatibility)
    binary_file = sys.argv[1] if len(sys.argv) == 2 else "firmware.bin"

    # Convert and return exit code
    return bin2verilog(binary_file)

if __name__ == "__main__":
    sys.exit(main())

