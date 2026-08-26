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
| `dsp-const-only-pins` | #159 | INMODE0..4/ALUMODE2/3/OPMODE6 have no routing path into the DSP site and never got their tile constant bits, so the pins read as their complement on silicon and `INMODE[1]=1` gated the multiplier's A operand to zero |
| `lut_shared_pin` | #158 | several logical inputs of one LUT that share a physical pin got their `X_ORIG_PORT_*` map written with the separator after each name (`"I1I3 "` instead of `"I1 I3"`); the FASM then encoded the pin as I0 and permuted the LUT's INIT in the bitstream, while the routed JSON, SDF and every simulation stayed correct |

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
bug.

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
`synth_flags` (replaces the default synthesis flags), `expect.txt` (required FASM regexes),
`check.sh` (executable custom check; sees `$FASM` and `$CASE_DIR/top_routed.json`).

Constraints use `xc7a200tfbg484-2` pins (ALINX AX7203), resolved from `prjxray-db`
`package_pins.csv`. Another part needs its own `.xdc` and a matching `part.txt`.

`lut_shared_pin` targets `xc7z010clg400` (zynq7) — its `part.txt` and zynq7 CLG400 `.xdc`
differ from the artix7 cases — so it runs under `CHIPDB_DIR` mode (`chipdb/xc7z010clg400.bin`
is committed here) or with an explicit zynq7 `CHIPDB`, not the single-`CHIPDB` artix7 mode.

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
