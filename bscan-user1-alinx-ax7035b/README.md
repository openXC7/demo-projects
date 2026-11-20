# A JTAG USER1 register on the Alinx AX7035B (BSCANE2)

A register inside the FPGA that is written and read through the board's JTAG
cable: no UART, no extra pins. `BSCANE2` connects the JTAG USER1 instruction
to user logic, and behind it sits an 8-bit shift register:

| bits | written over JTAG | read over JTAG |
| --- | --- | --- |
| 3:0 | LED4..LED1 (1 = on) | KEY4..KEY1 (1 = pressed) |
| 7:4 | ignored | the value the LEDs show |

The LEDs' value comes back in the high nibble, so a script can check the whole
path without anyone looking at the board. TCK is the only clock; the board
oscillator is not used.

## Build

```sh
make
```

The part is `xc7a35tfgg484-2`.

## Run on the board

```sh
make program
make test
```

`make program` loads the FPGA's configuration RAM with openFPGALoader through
the board's AL321 cable (an FT232H). It does not write the flash: after a power
cycle the board is back to the design it had.

`make test` runs OpenOCD with `al321-ft232h.cfg` and `user1-test.tcl`. It
writes eight values to the LEDs (LED1, LED2, LED3, LED4, all four, LED1+LED3,
LED2+LED4, none; half a second each), reads each one back and exits with an
error if one does not come back:

```
USER1 wrote 0x1, read back 0x1, keys 0x0
...
PASS: 8 values written and read back
```

Hold a key while it runs to see it in `keys`.

By hand, the same thing is two OpenOCD commands. USER1 is instruction `0x02`
of the 6-bit instruction register:

```
irscan xc7.tap 0x02
drscan xc7.tap 8 0x05
```

For another JTAG cable, replace the adapter lines at the top of
`al321-ft232h.cfg` (`adapter driver` to `ftdi layout_init`) with OpenOCD's
interface configuration for that cable. Only the AL321 was tried.

## Notes on BSCANE2

- `JTAG_CHAIN` 1 to 4 selects USER1 to USER4 (instructions `0x02`, `0x03`,
  `0x22` and `0x23`).
- CAPTURE, SHIFT and UPDATE are sampled on the rising edge of TCK, which goes
  through a BUFG.
- The register holds its value between the last shift and UPDATE. UPDATE comes
  after the TAP has left the shift state: a register that goes back to
  following its inputs as soon as SHIFT drops loses what was written before
  UPDATE can use it.
- TDI enters at bit 7 and bit 0 leaves through TDO: the least significant bit
  travels first, which is how `drscan` numbers them.
- The keys are not related to TCK: they go through two registers clocked by
  TCK before CAPTURE loads them, so a key that changes right at a TCK edge has
  a whole TCK cycle to settle before it is read.

## Tested

On an Alinx AX7035B (XC7A35T-2FGG484): the values written came back over JTAG,
the LEDs followed them and the four keys were read. In the bitstream, the
configuration of the BSCAN block (`JTAG_CHAIN_1`) is the one Vivado 2026.1
writes for this design.
