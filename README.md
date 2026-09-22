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
| project | [heavy #49](https://github.com/openXC7/demo-projects/actions/runs/35700760320) | [heavy #48](https://github.com/openXC7/demo-projects/actions/runs/35575249960) | [smoke #79](https://github.com/openXC7/demo-projects/actions/runs/35548618043) | [smoke #78](https://github.com/openXC7/demo-projects/actions/runs/35546435491) | [heavy #47](https://github.com/openXC7/demo-projects/actions/runs/35497590884) | [heavy #46](https://github.com/openXC7/demo-projects/actions/runs/35428925793) | [smoke #77](https://github.com/openXC7/demo-projects/actions/runs/35420795217) | [smoke #76](https://github.com/openXC7/demo-projects/actions/runs/35419597782) | pass rate |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `blinky-digilent-arty` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608051) | … | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023375) | · | 100% |
| `blinky-digilent-basys-3` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608117) | [✔](https://github.com/openXC7/demo-projects/actions/runs/35546435491/job/106177262862) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023448) | · | 100% |
| `blinky-digilent-zybo` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608114) | … | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023394) | · | 100% |
| `blinky-genesys2` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608062) | [✔](https://github.com/openXC7/demo-projects/actions/runs/35546435491/job/106177262924) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023367) | · | 100% |
| `blinky-kc705` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608069) | … | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023420) | · | 100% |
| `blinky-qmtech` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608093) | [✔](https://github.com/openXC7/demo-projects/actions/runs/35546435491/job/106177262921) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023374) | · | 100% |
| `blinky-stlv7325` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608059) | [✔](https://github.com/openXC7/demo-projects/actions/runs/35546435491/job/106177262955) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023419) | · | 100% |
| `ddr3-test-arty-s7` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608127) | [✔](https://github.com/openXC7/demo-projects/actions/runs/35546435491/job/106177263029) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023386) | · | 100% |
| `dsp-test-arty-s7` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608272) | [✔](https://github.com/openXC7/demo-projects/actions/runs/35546435491/job/106177262913) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023377) | · | 100% |
| `litex-ddr-arty-s7` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608128) | [✔](https://github.com/openXC7/demo-projects/actions/runs/35546435491/job/106177262984) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023458) | · | 100% |
| `litex-ddr-enclustra-kx2` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608169) | [✔](https://github.com/openXC7/demo-projects/actions/runs/35546435491/job/106177263118) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023468) | · | 100% |
| `litex-ddr-hdmi-enclustra-kx2` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608181) | [✔](https://github.com/openXC7/demo-projects/actions/runs/35546435491/job/106177262985) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023441) | · | 100% |
| `litex-ddr-hdmi-stlv7325` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608113) | [✔](https://github.com/openXC7/demo-projects/actions/runs/35546435491/job/106177262947) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023409) | · | 100% |
| `litex-ddr-hpcstore-k420t` | [✔](https://github.com/openXC7/demo-projects/actions/runs/35700760320/job/106660542021) | [✔](https://github.com/openXC7/demo-projects/actions/runs/35575249960/job/106257320552) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35497590884/job/106044250541) | [✔](https://github.com/openXC7/demo-projects/actions/runs/35428925793/job/105864672300) | · | · | 100% |
| `litex-ddr-kc705` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608160) | [✔](https://github.com/openXC7/demo-projects/actions/runs/35546435491/job/106177262996) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023434) | · | 100% |
| `litex-ddr-qmtech-artix7` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608178) | [✔](https://github.com/openXC7/demo-projects/actions/runs/35546435491/job/106177263115) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023506) | · | 100% |
| `litex-ddr-qmtech-kintex7` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608184) | [✔](https://github.com/openXC7/demo-projects/actions/runs/35546435491/job/106177262916) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023384) | · | 100% |
| `litex-ddr-stlv7325` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608107) | [✔](https://github.com/openXC7/demo-projects/actions/runs/35546435491/job/106177262944) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023390) | · | 100% |
| `litex-minimal-arty-s7` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608119) | [✔](https://github.com/openXC7/demo-projects/actions/runs/35546435491/job/106177262992) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023444) | · | 100% |
| `litex-sata-alientek-davincipro` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608233) | [✔](https://github.com/openXC7/demo-projects/actions/runs/35546435491/job/106177263009) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023466) | · | 100% |
| `picosoc` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35548618043/job/106183608122) | … | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023398) | · | 100% |

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
