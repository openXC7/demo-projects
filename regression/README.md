# xc7 regression cases

Moved here from `openXC7/nextpnr-xilinx` at the maintainer's request
([nextpnr-xilinx#118](https://github.com/openXC7/nextpnr-xilinx/pull/118)): the cases need a
generated chipdb, and this repository already has the `chipdb/` directory, the `CHIPDB`
variable in `openXC7.mk`, and working CI — none of which `nextpnr-xilinx` has.

One directory per fixed bug. Each design **failed before its patch** and builds after it.

| Case | Guards | Failure before the fix |
|---|---|---|
| `clock-srcc-bufg` | #110 | clock-buffer preplace BFS gave up at 50,000 visited pips; the SRCC-pin-to-BUFG path spans 75,492 wires on xc7a200t, so the clock read as unroutable |
| `bram-sdp-unused-port` | #112 | a width configuration bit was emitted for the unused port of an SDP BRAM and conflicted with the used one, so no bitstream was produced at all |
| `bufg-fabric-driven` | #111 | the placer aborted instead of pre-placing a BUFG driven from the fabric, so any design that divides or gates a clock in logic and re-buffers it failed to place |
| `config-primitive-startupe2` | #113 | the single-site configuration primitives had no pre-placement, so instantiating `STARTUPE2` failed to place |
| `iddr-four-iff-flops` | #115 | only Q1/Q2 of the four-flop IFF were initialised; on silicon the outputs then read Q1=0, Q2=1 despite both being programmed INIT=0 |
| `dsp-const-only-pins` | #159 | **disabled — expected-red until #159 lands in nextpnr-xilinx main.** INMODE0..4/ALUMODE2/3/OPMODE6 have no routing path into the DSP site and never got their tile constant bits, so the pins read as their complement on silicon and `INMODE[1]=1` gated the multiplier's A operand to zero |
| `lut_shared_pin` | #158 | several logical inputs of one LUT that share a physical pin got their `X_ORIG_PORT_*` map written with the separator after each name (`"I1I3 "` instead of `"I1 I3"`); the FASM then encoded the pin as I0 and permuted the LUT's INIT in the bitstream, while the routed JSON, SDF and every simulation stayed correct |
| `fdse-fdpe-undefined-init` | #179 | an FDSE/FDPE whose INIT parameter is *present but undefined* (`x`) was read as INIT=0 — `int_or_default` only falls back to the type default when the key is absent — so the FF got a ZINI feature and powered up 0 on silicon instead of the primitive's INIT=1 default (a Vivado netlist omits the parameter and was already handled; a yosys netlist leaves `INIT=x`) |
| `const-holdout` | #184 | the post-router constant fill counted a sink it could not reach and moved on, so the pin's IMUX stayed unprogrammed, which reads 1 on xc7; GND-tied RAM32M address bits then floated high and the 16-deep FIFO wrote at 16–31 while reading at 0–15, with a clean exit 0. The check walks the routed JSON: every GND-tied RAMD32 `A<k>`/`WA<k>` pin must be reached at its slice site pin by the GND net or by a constant-0 holdout LUT |
| `lutram-ram64x1s` | #195 | a 64-deep distributed RAM (`reg [W-1:0] m [0:63]`, one shared read/write address) is inferred by yosys as `RAM64X1S` — one cell per data bit — which `dram_types` knew about but the dispatch chain had no arm for, so packing aborted with `Cannot pack unsupported primitive: RAM64X1S` and no bitstream was produced. Its `check.sh` asserts the shape of the fix (8 LUT-RAMs in 2 SLICEM sites, 4 per slice, no `WA7USED`/`WA8USED` write-address mux), because a partial fix can still exit 0 with a plausible-looking FASM |
| `lutram-clkinv` | #201 | a LUT-RAM whose write clock is inverted (`IS_WCLK_INVERTED = 1`, i.e. the `RAM64X1S_1` Unisim variants and Vivado-imported netlists) never reached the half-slice's `CLKINV` bit, which is shared with the FFs: the flow packed, placed, routed and wrote a FASM byte-identical to the non-inverted design and exited 0, so the memory wrote on the opposite clock edge on silicon. Its `check.sh` asserts the `SLICEM_X0` half-slice programs `CLKINV` and not `NOCLKINV` while the 64x1 RAM mode bits are still emitted |
| `srl-init` | #181 | `get_lut_init()` built every LUT's `INIT[63:0]` by mapping `X_ORIG_PORT_A1..A6` through the LUT's logical inputs, and a packed SRL16E/SRLC32E has none of those, so every SRL powered up cleared regardless of its declared INIT. Its `check.sh` asserts the exact doubled pattern (SRL INIT bit k lives at LUT INIT bits 2k and 2k+1), because pre-fix the flow exited 0 with a plausible-looking wrong INIT |
| `xorigport-unknown-name` | `7cfd1e90` | `get_lut_init()` used `operator[]` on the logical-input-name map, so a name the cell does not have was silently encoded as if the pin drove I0 — only the bitstream disagreed with the netlist. The normal flow can't produce such a name, so its `check.sh` corrupts the synthesised JSON (renames a LUT2's `I0` port to `A1`, which the packer records as `X_ORIG_PORT_A1="A1"`) and re-runs nextpnr, asserting the unknown-name guard rejects it |
| `srl-wemux` | `ccfae5ae` | the WEMUX driving an SRL/DRAM's WE pin is shared across a SLICEM half, so two SRLs/DRAMs from independent write-enable domains cannot share a half-tile; the placer co-placed them and the router then died on an overused `WEMUX_OUT` wire. 40+40 SRL16E in two WE domains forces the conflict pre-fix and routes cleanly with the WE-agreement check |
| `dup-package-pin` | #8 | two ports constrained to the same package pin were only reported by the placer as a bel collision between `$iopadmap$...` cells — never naming the pin the user wrote. The fix warns at pack time in the user's names; the design is still unplaceable, so the case is expected-fail and its `check.sh` asserts the warning |
| `bufio-in-use` | #167 | a placed BUFIO never emitted `BUFIO_Y*.IN_USE`, so the buffer was never switched on. The fix (packer + `write_bufio`) is in, and the pad→BUFIO `I2IOCLK` segbits landed in prjxray-db 77e52f10 (`f2a469b8`); with the pin bumped the design routes and `expect.txt` asserts `BUFIO_Y[0-3].IN_USE` |
| `bufr-pad-site` | `7c4f00df` | a pad-fed BUFR's I pin is reached only by the `I2IOCLK` leg of its own clock-capable pad, so exactly one `BUFR_BUFR` site of a tile is routable from a given pad; the placer took any free one and the router died on `net 'clk_ibuf'`. The case is placement-level (`--no-route`, its I pin cannot route until the prjxray-db bump) and asserts the BUFR's `NEXTPNR_BEL` is the site next to the pad's IOB tile |
| `bufr-sink-region` | `20dc8309` | a BUFR drives one clock region, and nothing told the placer that the flops it clocks have to live there, so they followed their data pin to an LED half a die away and the router died on the clock arc. The case is placement-level (`--no-route`) and asserts every flop clocked by the BUFR sits inside the clock region the fix logs (`Constrained N sink(s) ... to its clock region x0..x1 y0..y1`) |
| `bufh-clock-constraint` | `13d88882` | `create_clock` stayed on the pad-side net, so the nets that actually reach the flops (the BUFH output, …) carried no constraint and the domain was analysed against the `--freq` default. The case asserts the `Derived frequency constraint` log line for the BUFH output net; the same pass covers BUFGCTRL I0/I1, BUFR with its divider, BUFIO and BUFMRCE |
The default run executes **18** cases — every row above except `dsp-const-only-pins` (#159), which is expected-red until that fix lands in `nextpnr-xilinx` main; run it explicitly with `run.sh <case>`. `fdse-fdpe-undefined-init` (#179), `const-holdout` (#184), `lutram-ram64x1s` (#195, fixed by #196), `lutram-clkinv` (#201), `srl-init` (#181), `xorigport-unknown-name` (`7cfd1e90`), `srl-wemux` (`ccfae5ae`), `dup-package-pin` (#8), `bufio-in-use` (#167), `bufr-pad-site` (`7c4f00df`), `bufr-sink-region` (`20dc8309`) and `bufh-clock-constraint` (`13d88882`) all landed and are enabled.

## Running

```bash
CHIPDB=/path/to/xc7a200tfbg484-2.bin regression/run.sh          # one chipdb for all cases
CHIPDB_DIR=/path/to/chipdb-dir regression/run.sh                # per-case part.txt lookup
CHIPDB=/path/to/xc7a200tfbg484-2.bin regression/run.sh dsp-const-only-pins
```

Needs `yosys` and `nextpnr-xilinx` on `PATH`. **No hardware and no prjxray** — the pass
criterion stops at the FASM, which is where all of these bugs bit.

In `CHIPDB_DIR` mode each case declares its part in `part.txt` and the runner resolves
`<part>.bin`; a case whose part is not in the directory is skipped. A run in which every
case was skipped fails — it proved nothing.

## Why the pass criterion checks content, not just exit status

A case passes when a **non-empty** `.fasm` is produced. Every bug guarded here stopped the
flow outright, so there is no partial-credit case.

The size check is not decoration. A target that exists but is truncated is exactly how a
failing stage reports success — the same defect class as
[openXC7/demo-projects#13](https://github.com/openXC7/demo-projects/pull/13), where a partial
`.frames` yielded a normal-looking 9.7 MB bitstream that flashed, reported `done 1`, and left
the board silent. An existence check whose negative is unobservable carries no information.

## Three kinds of criterion

Most cases pass on **a non-empty `.fasm`**, because the bug stopped the flow outright.

`iddr-four-iff-flops` is the other kind: #115 changed *which bits are emitted*, not whether the
flow completes, so "it built" would have passed before the fix too. That case carries an
`expect.txt` of regexes which must all appear in the FASM:

```
ILOGIC_Y[01]\.IFF\.ZINIT_Q1
ILOGIC_Y[01]\.IFF\.ZINIT_Q2
ILOGIC_Y[01]\.IFF\.ZINIT_Q3
ILOGIC_Y[01]\.IFF\.ZINIT_Q4
```

Any case may add an `expect.txt`; it is checked after the size check.

`dsp-const-only-pins` needs the strongest form: presence alone is not enough, because a
partially broken writer that ties only some of the eight pins would still match per-pin
regexes. That case carries an executable `check.sh` instead; the runner exports `FASM` and
the script's exit status is the verdict, so it can assert structure — here, *every* placed
DSP site must carry all eight const-only pins tied, and a design that placed no DSP at all
must fail. Any case may add a `check.sh`; it is checked after `expect.txt`.

`lut_shared_pin` is a third shape of `check.sh`: the bug is in a metadata attribute of the
**routed JSON**, not in the FASM bytes, so the runner also writes `top_routed.json` and
exports `CASE_DIR`; the case's `check.sh` runs `check_orig_port.py` on that JSON.  A
`check.sh` may therefore use `$FASM` or `$CASE_DIR/top_routed.json`, whichever exposes the
bug.  `const-holdout` is a fourth: `check_const_pins.py` asserts completeness over the
routed JSON — *every* GND-tied RAMD32 address pin, not just some, must be delivered at its
slice site pin — because a design that dropped only a few pins is exactly the bug.
`lutram-ram64x1s` is a fifth, on the FASM: it asserts the *shape* of a packer fix (how many
SLICEM LUT-RAMs, in how many sites, and that no 128/256-deep write-address mux is
programmed) rather than mere presence, since a partial fix emits a FASM that looks
plausible and exits 0.

`lutram-clkinv` is of that same kind: pre-fix the flow exited 0 with a FASM identical to the
non-inverted design, so its `check.sh` asserts that the half-slice holding the RAM programs
`CLKINV` and not `NOCLKINV`, and that the 64x1 mode bits are still emitted.

A case that needs DSP inference replaces the runner's default synthesis flags
(`-flatten -abc9 -nocarry -nodsp`) with its own via `synth_flags` — `dsp-const-only-pins`
drops `-nodsp`, without which the design would infer no DSP and the check would fail even
with the fix.

## Still missing: #109

`set_multicycle_path` being parsed and silently dropped **does not stop the build**, so neither
criterion above catches it. A test needs the constraint's *effect* to be observable, which is
what #117 adds — once that is in, the case becomes "the warning is absent when the selector
resolves, present when it does not".

## Adding a case

A directory with `top.v` and `top.xdc`, plus a row above naming the patch and the failure.
Keep the I/O minimal: `bram-sdp-unused-port` drives its address and data from internal
counters, so it needs three pins and almost no constraints, which leaves the feature under
test as the only interesting thing in the design.

Optional per-case files, all read by `run.sh`: `part.txt` (part for `CHIPDB_DIR` mode),
`synth_flags` (replaces the default synthesis flags), `nextpnr_flags` (extra
nextpnr-xilinx flags, e.g. `--seed 1` when the bug is seed-dependent),
`expect.txt` (required FASM regexes), `check.sh` (executable custom check; sees `$FASM`
and `$CASE_DIR/top_routed.json`), `no_route` (an empty marker that appends `--no-route`:
the case stops after placement and its pass criterion is a non-empty `top_routed.json`
plus `check.sh`, because the bug is a placement property and the design cannot reach a
FASM on the current chipdb — e.g. `bufr-pad-site`/`bufr-sink-region`, whose BUFR I pin
routes only once the pad→BUFIO `I2IOCLK` segbits land in prjxray-db).

Constraints use `xc7a200tfbg484-2` pins (ALINX AX7203), resolved from `prjxray-db`
`package_pins.csv`. Another part needs its own `.xdc` and a matching `part.txt`.

`lut_shared_pin` targets `xc7z010clg400` (zynq7) — its `part.txt` and zynq7 CLG400 `.xdc`
differ from the artix7 cases — so it runs under `CHIPDB_DIR` mode (`chipdb/xc7z010clg400.bin`
is committed here) or with an explicit zynq7 `CHIPDB`, not the single-`CHIPDB` artix7 mode.
`const-holdout` targets `xc7a35tcsg324-1` (Arty A7 pins) — the part the nextpnr-xilinx
`demos.yml` gate already builds a chipdb for, so the case runs on the CI's artix7 row.

## What is lost by living here, and the mitigation

Two things, worth naming rather than glossing:

1. **Atomicity.** In `nextpnr-xilinx` a fix and its regression case could land in one PR and
   review would see both. Here they cannot, so a fix may merge without its case.
   *Mitigation:* the table above names the guarding patch for every case, so a reader can go
   the other way — from a case to the patch it protects.
2. **Bisectability.** `git bisect` over `nextpnr-xilinx` cannot run these directly; it needs
   a version pair.

If `nextpnr-xilinx` gains CI, moving them back becomes the better trade.

## Chipdb

The runner takes a single `CHIPDB` file and hard-codes no part, so it fits whatever this
repository's CI already caches; with `CHIPDB_DIR` it resolves each case's `part.txt`. For
reference, `xc7a200tfbg484-2` costs a 939 MB `.bba` and a 318 MB `.bin`, which is why the
chipdb is generated rather than committed.
