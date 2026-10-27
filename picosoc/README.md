# xc7k325t-picosoc-nextpnr
Picosoc for the XC7K325T using yosys+nextpnr

Status: It works on the QMTech board!

Instructions for building are identical to:
https://github.com/kintex-chatter/xc7k325t-blinky-nextpnr/#readme

Baudrate to connect to the UART: 227894 (QMTech board)

## Arty S7, and changing the program without a full build

```bash
make BOARD=arty_s7 picosoc.bit
openFPGALoader --cable digilent --bitstream picosoc.bit
```

The UART runs at 460800 on this board.

`progmem.v` loads its contents from `progmem.hex` with `$readmemh`: 1024 lines,
one 32-bit word per line in address order. Keep the file at exactly 1024 words.
The inferred memory shape decides how the router packs the contents, so a file
whose length follows the program would move that packing on every edit.

With the shape fixed, a program change needs neither yosys nor place and route.
`xcbrup` (from the `xcbrup` repository) rewrites the memory init bits in the
routed FASM, using the map calibrated for this geometry:

```bash
xcbrup patch --fasm picosoc.fasm --json picosoc.json \
    --map xcbrup/maps/spartan7-ramb18-w36-1024x32.json \
    --mem soc.progmem.mem=progmem.hex \
    --new-mem soc.progmem.mem=new.hex --output new.fasm
```

`--mem` names the memory the design was built from and is checked against the
routed JSON before anything is written; `--new-mem` is the program you want.
