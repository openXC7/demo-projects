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
| `iob-lvcmos33-drive-slew` | [nextpnr-xilinx#120](https://github.com/openXC7/nextpnr-xilinx/pull/120) | an LVCMOS33 output at the default drive got the `I12_I8` bit pattern where Vivado emits `I12_I16`, and every input-only pad got output `SLEW.SLOW` bits |

## `reject.txt`: patterns that must *not* appear

`expect.txt` cannot guard a fix that makes us **stop** emitting a wrong bit — the bit's
absence is not a string you can grep for. Those cases carry a `reject.txt` instead, with
the same one-regex-per-line format; the case fails if any of them matches.

`iob-lvcmos33-drive-slew` uses both: `expect.txt` for the drive pattern that should now
appear on the output pad, `reject.txt` for the wrong drive pattern and for the slew bits
that should no longer appear on the input pad.

## Where the `iob-lvcmos33-drive-slew` expectations come from

This is the first case whose criterion is not "the flow used to fall over". Both bugs
produced a perfectly valid bitstream that merely programmed the pad differently from
Vivado, so the expected values are transcribed from **vendor output**, not from ours.

`prjxray-db` ships four Vivado-built bitstreams together with their design checkpoints:

```
artix7/harness/arty-a7/{swbut,uart,pmod}/design.bit
artix7/harness/basys3/swbut/design.bit
```

`prjxray/utils/bit2fasm.py` turns them back into FASM, and each `.dcp` contains Vivado's
own `top_late.xdc`, which constrains nothing but `PACKAGE_PIN` and `IOSTANDARD LVCMOS33`
— so every pad sits at Vivado's defaults and the comparison is like-for-like. Across all
four, 35 output pads:

* the drive pattern is `LVCMOS33_LVTTL.DRIVE.I12_I16` on every one, and `I12_I8` does not
  occur once — note that `prjxray-db` names *both* patterns as covering drive 12, which
  cannot both be right; the vendor bitstreams are what break the tie;
* `SLEW.SLOW` appears exactly as many times as there are output pads, and never on an
  input pad.

Two classes of difference are artefacts of the comparison and must be filtered out before
reading anything into a FASM-to-disassembled-FASM diff:

* features whose segbits are **all negated** (`IN_TERM.NONE`, `SLEW.FAST`,
  `IDELMUXE3.P1`, `ISERDES.MODE.MASTER`, …) set no bits at all, so emitting them or not
  cannot change the bitstream;
* `always` pseudo-pips from `ppips_*.db` have no bits either, so `bit2fasm` can never
  recover them from a bitstream even though nextpnr emits them.

In the arty-a7/swbut comparison those two classes accounted for 84 and 42 lines
respectively; filtering them left exactly the two differences above.

## Running

```bash
CHIPDB=/path/to/xc7a200t.bin regression/run.sh
```

Needs `yosys` and `nextpnr-xilinx` on `PATH`. **No hardware and no prjxray** — the pass
criterion stops at the FASM, which is where all of these bugs bit.

## Why the pass criterion checks content, not just exit status

A case passes when a **non-empty** `.fasm` is produced. Every bug guarded here stopped the
flow outright, so there is no partial-credit case.

The size check is not decoration. A target that exists but is truncated is exactly how a
failing stage reports success — the same defect class as
[openXC7/demo-projects#13](https://github.com/openXC7/demo-projects/pull/13), where a partial
`.frames` yielded a normal-looking 9.7 MB bitstream that flashed, reported `done 1`, and left
the board silent. An existence check whose negative is unobservable carries no information.

## Two kinds of criterion

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

Constraints use `xc7a200tfbg484-2` pins (ALINX AX7203), resolved from `prjxray-db`
`package_pins.csv`. Another part needs its own `.xdc`.

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

The runner takes `CHIPDB` from the environment and hard-codes no part, so it fits whatever
this repository's CI already caches. For reference, `xc7a200tfbg484-2` costs a 939 MB `.bba`
and a 318 MB `.bin`, which is why the chipdb is generated rather than committed.
