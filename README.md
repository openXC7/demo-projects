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
| project | [heavy #61](https://github.com/openXC7/demo-projects/actions/runs/37188769174) | [heavy #60](https://github.com/openXC7/demo-projects/actions/runs/37108327803) | [heavy #59](https://github.com/openXC7/demo-projects/actions/runs/36984002067) | [heavy #58](https://github.com/openXC7/demo-projects/actions/runs/36838792300) | [heavy #57](https://github.com/openXC7/demo-projects/actions/runs/36689832202) | [smoke #96](https://github.com/openXC7/demo-projects/actions/runs/36666688945) | [smoke #95](https://github.com/openXC7/demo-projects/actions/runs/36644711973) | [heavy #56](https://github.com/openXC7/demo-projects/actions/runs/36542483939) | pass rate |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `blinky-digilent-arty` | · | · | · | · | · | [✖](https://github.com/openXC7/demo-projects/actions/runs/36666688945/job/109737927204) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307218) | · | 50% |
| `blinky-digilent-basys-3` | · | · | · | · | · | [✖](https://github.com/openXC7/demo-projects/actions/runs/36666688945/job/109737927192) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307257) | · | 50% |
| `blinky-digilent-zybo` | · | · | · | · | · | [✖](https://github.com/openXC7/demo-projects/actions/runs/36666688945/job/109737927345) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307704) | · | 50% |
| `blinky-genesys2` | · | · | · | · | · | [✖](https://github.com/openXC7/demo-projects/actions/runs/36666688945/job/109737927154) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307269) | · | 50% |
| `blinky-kc705` | · | · | · | · | · | [✖](https://github.com/openXC7/demo-projects/actions/runs/36666688945/job/109737927229) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307281) | · | 50% |
| `blinky-qmtech` | · | · | · | · | · | [✖](https://github.com/openXC7/demo-projects/actions/runs/36666688945/job/109737927305) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307321) | · | 50% |
| `blinky-stlv7325` | · | · | · | · | · | [✖](https://github.com/openXC7/demo-projects/actions/runs/36666688945/job/109737927242) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307236) | · | 50% |
| `ddr3-test-arty-s7` | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/36666688945/job/109737927314) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307675) | · | 100% |
| `dsp-test-arty-s7` | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/36666688945/job/109737927289) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307548) | · | 100% |
| `litex-ddr-arty-s7` | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/36666688945/job/109737927313) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307591) | · | 100% |
| `litex-ddr-enclustra-kx2` | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/36666688945/job/109737927271) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307578) | · | 100% |
| `litex-ddr-hdmi-enclustra-kx2` | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/36666688945/job/109737927392) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307712) | · | 100% |
| `litex-ddr-hdmi-stlv7325` | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/36666688945/job/109737927343) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307648) | · | 100% |
| `litex-ddr-hpcstore-k420t` | [✔](https://github.com/openXC7/demo-projects/actions/runs/37188769174/job/111396546590) | [✔](https://github.com/openXC7/demo-projects/actions/runs/37108327803/job/111161291687) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36984002067/job/110765010228) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36838792300/job/110292921282) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36689832202/job/109811722426) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/36542483939/job/109321274677) | 100% |
| `litex-ddr-kc705` | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/36666688945/job/109737927337) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307691) | · | 100% |
| `litex-ddr-qmtech-artix7` | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/36666688945/job/109737927364) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307589) | · | 100% |
| `litex-ddr-qmtech-kintex7` | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/36666688945/job/109737927286) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307649) | · | 100% |
| `litex-ddr-stlv7325` | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/36666688945/job/109737927406) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307600) | · | 100% |
| `litex-minimal-arty-s7` | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/36666688945/job/109737927324) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307477) | · | 100% |
| `litex-sata-alientek-davincipro` | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/36666688945/job/109737927427) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307631) | · | 100% |
| `picosoc` | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/36666688945/job/109737927357) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307516) | · | 100% |

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
