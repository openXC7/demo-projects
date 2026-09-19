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
| project | [heavy #46](https://github.com/openXC7/demo-projects/actions/runs/35428925793) | [smoke #77](https://github.com/openXC7/demo-projects/actions/runs/35420795217) | [smoke #76](https://github.com/openXC7/demo-projects/actions/runs/35419597782) | [smoke #75](https://github.com/openXC7/demo-projects/actions/runs/35409536459) | [heavy #45](https://github.com/openXC7/demo-projects/actions/runs/35319052127) | [heavy #44](https://github.com/openXC7/demo-projects/actions/runs/35195230900) | [heavy #43](https://github.com/openXC7/demo-projects/actions/runs/35069581628) | [heavy #42](https://github.com/openXC7/demo-projects/actions/runs/34942875200) | pass rate |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `blinky-digilent-arty` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023375) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35409536459/job/105810604340) | · | · | · | · | 100% |
| `blinky-digilent-basys-3` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023448) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35409536459/job/105810604300) | · | · | · | · | 100% |
| `blinky-digilent-zybo` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023394) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35409536459/job/105810604354) | · | · | · | · | 100% |
| `blinky-genesys2` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023367) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35409536459/job/105810604327) | · | · | · | · | 100% |
| `blinky-kc705` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023420) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35409536459/job/105810604328) | · | · | · | · | 100% |
| `blinky-qmtech` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023374) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35409536459/job/105810604332) | · | · | · | · | 100% |
| `blinky-stlv7325` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023419) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35409536459/job/105810604361) | · | · | · | · | 100% |
| `ddr3-test-arty-s7` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023386) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35409536459/job/105810604318) | · | · | · | · | 100% |
| `dsp-test-arty-s7` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023377) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35409536459/job/105810604383) | · | · | · | · | 100% |
| `litex-ddr-arty-s7` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023458) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35409536459/job/105810604323) | · | · | · | · | 100% |
| `litex-ddr-enclustra-kx2` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023468) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35409536459/job/105810604359) | · | · | · | · | 100% |
| `litex-ddr-hdmi-enclustra-kx2` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023441) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35409536459/job/105810604406) | · | · | · | · | 100% |
| `litex-ddr-hdmi-stlv7325` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023409) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35409536459/job/105810604386) | · | · | · | · | 100% |
| `litex-ddr-hpcstore-k420t` | [✔](https://github.com/openXC7/demo-projects/actions/runs/35428925793/job/105864672300) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35319052127/job/105519253948) | [✔](https://github.com/openXC7/demo-projects/actions/runs/35195230900/job/105118968222) | [✔](https://github.com/openXC7/demo-projects/actions/runs/35069581628/job/104710328809) | [✔](https://github.com/openXC7/demo-projects/actions/runs/34942875200/job/104297422090) | 100% |
| `litex-ddr-kc705` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023434) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35409536459/job/105810604379) | · | · | · | · | 100% |
| `litex-ddr-qmtech-artix7` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023506) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35409536459/job/105810604420) | · | · | · | · | 100% |
| `litex-ddr-qmtech-kintex7` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023384) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35409536459/job/105810604363) | · | · | · | · | 100% |
| `litex-ddr-stlv7325` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023390) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35409536459/job/105810604349) | · | · | · | · | 100% |
| `litex-minimal-arty-s7` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023444) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35409536459/job/105810604351) | · | · | · | · | 100% |
| `litex-sata-alientek-davincipro` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023466) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35409536459/job/105810604401) | · | · | · | · | 100% |
| `picosoc` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35420795217/job/105843023398) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/35409536459/job/105810604389) | · | · | · | · | 100% |

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
