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
| project | [heavy #109](https://github.com/openXC7/demo-projects/actions/runs/44890738547) | [smoke #145](https://github.com/openXC7/demo-projects/actions/runs/44883500802) | [heavy #108](https://github.com/openXC7/demo-projects/actions/runs/44715025053) | [heavy #107](https://github.com/openXC7/demo-projects/actions/runs/44503613446) | [smoke #142](https://github.com/openXC7/demo-projects/actions/runs/44465394158) | [heavy #106](https://github.com/openXC7/demo-projects/actions/runs/44281672731) | [smoke #140](https://github.com/openXC7/demo-projects/actions/runs/44173250204) | [heavy #105](https://github.com/openXC7/demo-projects/actions/runs/44066686739) | pass rate |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `blinky-digilent-arty` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652334) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44465394158/job/135367937895) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44173250204/job/134367481162) | · | 100% |
| `blinky-digilent-basys-3` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652418) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44465394158/job/135367937935) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44173250204/job/134367481504) | · | 100% |
| `blinky-digilent-zybo` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652306) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44465394158/job/135367937953) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44173250204/job/134367481175) | · | 100% |
| `blinky-genesys2` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652172) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44465394158/job/135367937989) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44173250204/job/134367481177) | · | 100% |
| `blinky-kc705` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652198) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44465394158/job/135367937891) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44173250204/job/134367481352) | · | 100% |
| `blinky-qmtech` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652298) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44465394158/job/135367937875) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44173250204/job/134367481137) | · | 100% |
| `blinky-stlv7325` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652291) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44465394158/job/135367937900) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44173250204/job/134367481082) | · | 100% |
| `bscan-user1-alinx-ax7035b` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652332) | · | · | · | · | · | · | 100% |
| `ddr3-test-arty-s7` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652256) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44465394158/job/135367937934) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44173250204/job/134367481203) | · | 100% |
| `dsp-test-arty-s7` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652299) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44465394158/job/135367937890) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44173250204/job/134367481251) | · | 100% |
| `litex-ddr-arty-s7` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652317) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44465394158/job/135367937914) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44173250204/job/134367481180) | · | 100% |
| `litex-ddr-enclustra-kx2` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652335) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44465394158/job/135367938011) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44173250204/job/134367481259) | · | 100% |
| `litex-ddr-hdmi-enclustra-kx2` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652311) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44465394158/job/135367937921) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44173250204/job/134367481277) | · | 100% |
| `litex-ddr-hdmi-stlv7325` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652316) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44465394158/job/135367938000) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44173250204/job/134367481242) | · | 100% |
| `litex-ddr-hpcstore-k420t` | [✔](https://github.com/openXC7/demo-projects/actions/runs/44890738547/job/136806007374) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44715025053/job/136216413246) | [✔](https://github.com/openXC7/demo-projects/actions/runs/44503613446/job/135490017782) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44281672731/job/134732789411) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44066686739/job/133982840238) | 100% |
| `litex-ddr-kc705` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652297) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44465394158/job/135367937937) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44173250204/job/134367481126) | · | 100% |
| `litex-ddr-qmtech-artix7` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652331) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44465394158/job/135367938032) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44173250204/job/134367481149) | · | 100% |
| `litex-ddr-qmtech-kintex7` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652213) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44465394158/job/135367937902) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44173250204/job/134367481372) | · | 100% |
| `litex-ddr-stlv7325` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652315) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44465394158/job/135367937940) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44173250204/job/134367481293) | · | 100% |
| `litex-minimal-arty-s7` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652285) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44465394158/job/135367937969) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44173250204/job/134367481146) | · | 100% |
| `litex-sata-alientek-davincipro` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652349) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44465394158/job/135367938014) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44173250204/job/134367481417) | · | 100% |
| `picosoc` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652346) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44465394158/job/135367938088) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44173250204/job/134367481237) | · | 100% |

✔ pass · ✖ fail · … running / cancelled · · not in run. Newest run left. Cells link to the workflow job.

<!-- matrix-report:end -->

## Hardware checks

The matrix above is hardware-free: it proves a bitstream builds, not that it
behaves. Four demos ship a host-side check to run against a real board.
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
- `bscan-user1-alinx-ax7035b/user1-test.tcl` — an OpenOCD script (`make test`)
  for an 8-bit register behind the JTAG USER1 instruction (`BSCANE2`): it
  writes eight values to the board's LEDs through the JTAG cable and reads each
  one back from the register, so the write, UPDATE and capture paths are
  checked without a UART and without anyone looking at the LEDs.
