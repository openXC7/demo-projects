# GitHub Actions CI

CI tests the **latest toolchain-nix build of the whole toolchain** and
runs the demo projects against it. All workflows check out
`openXC7/toolchain-nix` as a sibling repo and build it with the Nix
flake, so a change anywhere in the toolchain (nextpnr-xilinx,
prjxray, fasm, prjxray-db, yosys integration, chipdb generation) is
exercised end to end.

| Workflow | When | What it does |
| --- | --- | --- |
| [smoke.yml](smoke.yml) | every push/PR to main | builds chipdb for artix7/kintex7/spartan7/zynq7, builds every blinky-class project to `.bit`, compares against committed golden bitstreams, checks build determinism |
| [heavy.yml](heavy.yml) | nightly 02:15 UTC + manual | builds the slow projects (picosoc, LiteX DDR designs) |
| [unit-tests.yml](unit-tests.yml) | every push/PR to main | nextpnr-xilinx gtest suite (`ARCH=generic`) |

## How it works

1. **chipdb stage** (`nix build ./toolchain-nix#nextpnr-xilinx-chipdb.<family>`):
   builds the whole toolchain plus the chip database for one FPGA family
   per job. This is the long pole: `bbaexport` takes 1-3 h per family on
   the first run. The [magic-nix-cache action](https://github.com/DeterminateSystems/magic-nix-cache-action)
   stores build results in the GitHub Actions cache, so reruns with an
   unchanged toolchain are fast. Only the `.bin` files the projects
   actually need are uploaded as artifacts (`matrix.bins`).
2. **project stage**: runs inside `nix develop ./toolchain-nix`, which
   provides yosys, nextpnr-xilinx, fasm2frames, xc7frames2bit and the
   python path plumbing. The `${FAMILY}_CHIPDB` env var (e.g.
   `ARTIX7_CHIPDB`) points at the downloaded chipdb artifacts — without
   it the project Makefiles fall back to a broken `/xc7a35t.bin` path.

## Golden bitstreams (regression check)

The blinky projects commit their `.bit` files. CI rebuilds them and
compares `sha256`; a mismatch fails the run. If the toolchain change is
intentional, re-run the workflow with the `update-goldens` input set:
the comparison is skipped and the freshly built bitstreams are uploaded
as an artifact (`regenerated-goldens-<family>`) for manual commit.

## Known gaps

- **virtex7**: no demo project uses a virtex7 part, so that chipdb
  family is not built in CI.
- **nextpnr-xilinx ARCH=xilinx unit tests**: the `tests/` submodule
  (YosysHQ/nextpnr-tests) has no `tests/xilinx` directory, and CMake
  fails at configure time when it is missing
  (`aux_source_directory`). Only `ARCH=generic` has a test suite.
- **fasm pytest**: `doCheck = false` in
  `toolchain-nix/nix/fasm/default.nix` ("broken upstream").
- **prjxray tests**: `tests/` contains only `test_util.py`.
- **litex-ddr-hdmi-\***: Makefiles hardcode the snap layout
  (`PREFIX ?= /snap/openxc7/current`), not usable from nix.
- **vexriscv_smp**: no Makefile. `vexriscv` itself is checked out from
  `SpinalHDL/VexRiscv` in CI (required by `litex-ddr-kc705` and
  `litex-sata-alientek-davincipro`).
- **blinky-colorlight**: ECP5 (colorlight_i5), not a Xilinx 7-series
  project; build via its own script.

## Prerequisites / first-time setup

- `toolchain-nix` must contain the `ci-tests` devshell (cmake,
  pkg-config, python3, boost, eigen) — added in the flake for the unit
  test job. If you fork either repo, update `TOOLCHAIN_NIX_REPO` (and
  `NEXTPNR_XILINX_REF`, which must stay in sync with
  `toolchain-nix/nix/nextpnr-xilinx.nix`).
- Action tags (`@v4`, `@v14`, `@v8`) are mutable; pin to commit SHAs
  if you want supply-chain hardening.
- First run of each family builds the chipdb from scratch and can take
  up to ~6 h (the GitHub-hosted job limit). Later runs hit the cache.
