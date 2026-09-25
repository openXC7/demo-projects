# OpenXC7 FPGA toolchain demo projects

This repository contains demo projects for various Xilinx Series 7
development boards. They are intended to give you a quick
and easy template to use as a basis for your own projects,
and also to demonstrate the current capabilites of the toolchain.

[![NLnet Foundation](https://img.shields.io/badge/funded%20by-NLnet%20Foundation-74AA00)](https://nlnet.nl/)
[![smoke](https://github.com/openXC7/demo-projects/actions/workflows/smoke.yml/badge.svg)](https://github.com/openXC7/demo-projects/actions/workflows/smoke.yml)
[![test matrix](https://img.shields.io/badge/test%20matrix-dashboard-blue)](https://openXC7.github.io/demo-projects/)

The [test matrix dashboard](https://openXC7.github.io/demo-projects/) shows
the pass/fail status of every demo project across recent CI runs; the table
below is the same matrix, embedded and updated by CI.

<!-- matrix-report:start -->
| project | [smoke #86](https://github.com/openXC7/demo-projects/actions/runs/36100561885) | [smoke #81](https://github.com/openXC7/demo-projects/actions/runs/36076371898) | [heavy #51](https://github.com/openXC7/demo-projects/actions/runs/35970263755) | [smoke #80](https://github.com/openXC7/demo-projects/actions/runs/35926533625) | [heavy #50](https://github.com/openXC7/demo-projects/actions/runs/35833112294) | [heavy #49](https://github.com/openXC7/demo-projects/actions/runs/35700760320) | [heavy #48](https://github.com/openXC7/demo-projects/actions/runs/35575249960) | [smoke #79](https://github.com/openXC7/demo-projects/actions/runs/35548618043) | pass rate |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `blinky-digilent-arty` | … | [✔](https://github.com/openXC7/demo-projects/actions/runs/36076371898/job/107893644485) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35926533625/job/107415968903) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608051) | 100% |
| `blinky-digilent-basys-3` | … | [✔](https://github.com/openXC7/demo-projects/actions/runs/36076371898/job/107893644476) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35926533625/job/107415968885) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608117) | 100% |
| `blinky-digilent-zybo` | [✔](https://github.com/openXC7/demo-projects/actions/runs/36100561885/job/107967254564) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36076371898/job/107893644555) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35926533625/job/107415968899) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608114) | 100% |
| `blinky-genesys2` | [✔](https://github.com/openXC7/demo-projects/actions/runs/36100561885/job/107967254495) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36076371898/job/107893644434) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35926533625/job/107415968945) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608062) | 100% |
| `blinky-kc705` | … | [✔](https://github.com/openXC7/demo-projects/actions/runs/36076371898/job/107893644518) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35926533625/job/107415968862) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608069) | 100% |
| `blinky-qmtech` | … | [✔](https://github.com/openXC7/demo-projects/actions/runs/36076371898/job/107893644500) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35926533625/job/107415968883) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608093) | 100% |
| `blinky-stlv7325` | [✔](https://github.com/openXC7/demo-projects/actions/runs/36100561885/job/107967254569) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36076371898/job/107893644504) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35926533625/job/107415968922) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608059) | 100% |
| `ddr3-test-arty-s7` | … | [✖](https://github.com/openXC7/demo-projects/actions/runs/36076371898/job/107893644448) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35926533625/job/107415968971) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608127) | 67% |
| `dsp-test-arty-s7` | [✔](https://github.com/openXC7/demo-projects/actions/runs/36100561885/job/107967254505) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36076371898/job/107893644451) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35926533625/job/107415968909) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608272) | 100% |
| `litex-ddr-arty-s7` | [✔](https://github.com/openXC7/demo-projects/actions/runs/36100561885/job/107967254661) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36076371898/job/107893644461) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35926533625/job/107415969025) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608128) | 100% |
| `litex-ddr-enclustra-kx2` | … | [✖](https://github.com/openXC7/demo-projects/actions/runs/36076371898/job/107893644462) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35926533625/job/107415969008) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608169) | 67% |
| `litex-ddr-hdmi-enclustra-kx2` | … | [✖](https://github.com/openXC7/demo-projects/actions/runs/36076371898/job/107893644468) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35926533625/job/107415969208) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608181) | 67% |
| `litex-ddr-hdmi-stlv7325` | [✔](https://github.com/openXC7/demo-projects/actions/runs/36100561885/job/107967254754) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36076371898/job/107893644514) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35926533625/job/107415969076) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608113) | 100% |
| `litex-ddr-hpcstore-k420t` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35970263755/job/107549535334) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35833112294/job/107092217229) | [✔](https://github.com/openXC7/demo-projects/actions/runs/35700760320/job/106660542021) | [✔](https://github.com/openXC7/demo-projects/actions/runs/35575249960/job/106257320552) | · | 100% |
| `litex-ddr-kc705` | … | [✖](https://github.com/openXC7/demo-projects/actions/runs/36076371898/job/107893644464) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35926533625/job/107415969010) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608160) | 67% |
| `litex-ddr-qmtech-artix7` | [✔](https://github.com/openXC7/demo-projects/actions/runs/36100561885/job/107967254637) | [✖](https://github.com/openXC7/demo-projects/actions/runs/36076371898/job/107893644572) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35926533625/job/107415969150) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608178) | 75% |
| `litex-ddr-qmtech-kintex7` | … | [✖](https://github.com/openXC7/demo-projects/actions/runs/36076371898/job/107893644490) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35926533625/job/107415968980) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608184) | 67% |
| `litex-ddr-stlv7325` | … | [✖](https://github.com/openXC7/demo-projects/actions/runs/36076371898/job/107893644565) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35926533625/job/107415969051) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608107) | 67% |
| `litex-minimal-arty-s7` | … | [✔](https://github.com/openXC7/demo-projects/actions/runs/36076371898/job/107893644520) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35926533625/job/107415969052) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608119) | 100% |
| `litex-sata-alientek-davincipro` | … | [✖](https://github.com/openXC7/demo-projects/actions/runs/36076371898/job/107893644488) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35926533625/job/107415969096) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608233) | 67% |
| `picosoc` | … | [✔](https://github.com/openXC7/demo-projects/actions/runs/36076371898/job/107893644618) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35926533625/job/107415969257) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608122) | 100% |

✔ pass · ✖ fail · … running / cancelled · · not in run. Newest run left. Cells link to the workflow job.

<!-- matrix-report:end -->

## Hardware checks

The matrix above is hardware-free: it proves a bitstream builds, not that it
behaves. Three demos ship a host-side console check to run against a real board.
These are manual checks by design — CI has no board attached, so nothing here
runs in a workflow; flash the design and run the script yourself.

- `dsp-test-arty-s7/verify.py` — captures the UART (115200 8N1) and checks
  `p == a*b` on every snapshot line, which is the signature of
  nextpnr-xilinx#159's missing DSP tile-constant bits.
- `lutram-test-arty-s7/verify.py` — checks a 64 x 8 distributed RAM, which
  yosys infers as 8 x `RAM64X1S` in 2 SLICEM sites (nextpnr-xilinx#195: those
  used to abort at packing). Four write/read passes (address-as-data,
  complement, and two mixed patterns) are re-derived host-side from the
  streamed `p<a> a=<addr> d=<data> e=<on-chip error count>` lines, so a packer
  that agrees with itself still fails. This demo cannot be built by the pinned
  toolchain until #195 is released, so it is not in the matrix yet.
- `ddr3-test-arty-s7/verify.py` — drives the controller's UART bridge
  (9600 8N1: write bytes `'a'..'z'`, read them back with `'A'..'Z'`) and
  checks the write/read-back pairs. A served read proves the controller
  reached DONE_CALIBRATE and that data survives the DDR3 round trip; the four
  debug LEDs only show the calibration state and cannot be scripted.
