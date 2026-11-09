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
| project | [heavy #97](https://github.com/openXC7/demo-projects/actions/runs/42595352274) | [smoke #130](https://github.com/openXC7/demo-projects/actions/runs/42518393575) | [heavy #96](https://github.com/openXC7/demo-projects/actions/runs/42464952980) | [heavy #95](https://github.com/openXC7/demo-projects/actions/runs/42356557515) | [heavy #94](https://github.com/openXC7/demo-projects/actions/runs/42194045475) | [heavy #93](https://github.com/openXC7/demo-projects/actions/runs/42002047809) | [heavy #92](https://github.com/openXC7/demo-projects/actions/runs/41804353476) | [heavy #91](https://github.com/openXC7/demo-projects/actions/runs/41611216832) | pass rate |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `blinky-digilent-arty` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42518393575/job/128850619259) | · | · | · | · | · | · | 100% |
| `blinky-digilent-basys-3` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42518393575/job/128850619182) | · | · | · | · | · | · | 100% |
| `blinky-digilent-zybo` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42518393575/job/128850619227) | · | · | · | · | · | · | 100% |
| `blinky-genesys2` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42518393575/job/128850619162) | · | · | · | · | · | · | 100% |
| `blinky-kc705` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42518393575/job/128850619254) | · | · | · | · | · | · | 100% |
| `blinky-qmtech` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42518393575/job/128850619146) | · | · | · | · | · | · | 100% |
| `blinky-stlv7325` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42518393575/job/128850619298) | · | · | · | · | · | · | 100% |
| `ddr3-test-arty-s7` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42518393575/job/128850619247) | · | · | · | · | · | · | 100% |
| `dsp-test-arty-s7` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42518393575/job/128850619249) | · | · | · | · | · | · | 100% |
| `litex-ddr-arty-s7` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42518393575/job/128850619313) | · | · | · | · | · | · | 100% |
| `litex-ddr-enclustra-kx2` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42518393575/job/128850619187) | · | · | · | · | · | · | 100% |
| `litex-ddr-hdmi-enclustra-kx2` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42518393575/job/128850619242) | · | · | · | · | · | · | 100% |
| `litex-ddr-hdmi-stlv7325` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42518393575/job/128850619226) | · | · | · | · | · | · | 100% |
| `litex-ddr-hpcstore-k420t` | [✔](https://github.com/openXC7/demo-projects/actions/runs/42595352274/job/129086910865) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42464952980/job/128682428995) | [✔](https://github.com/openXC7/demo-projects/actions/runs/42356557515/job/128356008062) | [✔](https://github.com/openXC7/demo-projects/actions/runs/42194045475/job/127815286758) | [✔](https://github.com/openXC7/demo-projects/actions/runs/42002047809/job/127159923827) | [✔](https://github.com/openXC7/demo-projects/actions/runs/41804353476/job/126488016066) | [✔](https://github.com/openXC7/demo-projects/actions/runs/41611216832/job/125836584493) | 100% |
| `litex-ddr-kc705` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42518393575/job/128850619245) | · | · | · | · | · | · | 100% |
| `litex-ddr-qmtech-artix7` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42518393575/job/128850619255) | · | · | · | · | · | · | 100% |
| `litex-ddr-qmtech-kintex7` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42518393575/job/128850619290) | · | · | · | · | · | · | 100% |
| `litex-ddr-stlv7325` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42518393575/job/128850619221) | · | · | · | · | · | · | 100% |
| `litex-minimal-arty-s7` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42518393575/job/128850619286) | · | · | · | · | · | · | 100% |
| `litex-sata-alientek-davincipro` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42518393575/job/128850619237) | · | · | · | · | · | · | 100% |
| `picosoc` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42518393575/job/128850619307) | · | · | · | · | · | · | 100% |

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
