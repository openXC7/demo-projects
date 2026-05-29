# VC707 (xc7vx485tffg1761-2) demo designs — openXC7 open-flow validation

Reference designs that exercise the `openXC7/prjxray` virtex7-support branch
through the open-flow bit-encoding chain:

```
Verilog → Vivado synth + place + route → write_bitstream → reference .bit
                                                ↓
                       bit2fasm (virtex7 prjxray DB, 0 unknown_bits)
                                                ↓
                  fasm2frames (auto-injects HP-bank glue / PUDC_B /
                  DCI cascade / GFAN T-tie / HCLK_L BUFRCLK / IBUFDS)
                                                ↓
                                       xc7frames2bit
                                                ↓
                                       open-flow .bit
                                                ↓
                                  openFPGALoader -c digilent
                                                ↓
                                      VC707 hardware (verified)
```

| Dir | Demo | Clock | What it validates |
|---|---|---|---|
| `vc707_rst_to_led/` | IBUF→OBUF passthrough | none | IOSTANDARD bits, PUDC_B, GFAN T-tie |
| `vc707_counter_skewfree/` | 8-bit counter, 2-stage skew-tolerant pipeline | AV40 pushbutton (general routing) | LIOB18 bank-glue, IOB→fabric paths |
| `vc707_counter_sw_bufr/` | 8-bit counter via BUFR | AV40 → BUFR | HCLK_IOI, BUFR site config |
| `vc707_counter_bufr/` | 8-bit counter, 200 MHz LVDS | IBUFDS + BUFR (BYPASS) | IBUFDS bank glue, HP-bank diff input |
| `vc707_counter_2bufg/` | 2-BUFG fan-out | IBUFDS → BUFG×2 | BUFGCTRL site placement (X0Y0, X0Y1) |
| `vc707_telegraph/` | bit-banged UART (no CPU) | SGMIICLK_Q0 (125 MHz crystal × fixed mul) → IBUFDS_GTE2 → BUFG | MGT REFCLK entry, CLB FSM, IOB out |
| `vc707_picosoc/` | picorv32 + simpleuart + BRAM | 200 MHz LVDS → MMCM ÷4 → BUFG → 50 MHz | MMCM, large CLB usage, BRAM init |
| `vc707_picosoc_nommcm/` | same picosoc, no MMCM | 200 MHz LVDS → IBUFDS → BUFG (200 MHz, fails -2 timing in practice) | as picosoc, sans MMCM glue |
| `vc707_picosoc_sgmii/` | **picorv32 + UART running at 125 MHz on VC707** | SGMIICLK_Q0 → IBUFDS_GTE2 → BUFG | full end-to-end open-flow SoC validation |
| `vc707_passthrough/` | trivial port passthrough | — | minimal smoke test |

Per-design layout:
- `*.v`, `*.xdc`, `*.tcl` — source
- `*.bit` — Vivado-built reference
- `*_openflow.bit` — our open-flow output (when round-trip + patch produced one)
- `*.fasm` — bit2fasm output (round-trip)
- `utilization.rpt`, `timing.rpt` — Vivado reports
- For picosoc / telegraph: `picorv32.v`, `simpleuart.v`, `picosoc_noflash.v`,
  `progmem.v`, `firmware.{c,bin,elf,hex,map}`, `start.s`, `sections.lds`

Hardware flash command (all designs):
```sh
openFPGALoader -c digilent --freq 15M <design>/<design>.bit
```

Picosoc UART read:
```sh
picocom -b 115200 /dev/ttyUSB0
```

See `~/.claude/projects/-home-jonathan-f4pga/memory/virtex7-*.md` for the
detailed engineering history behind each design.
