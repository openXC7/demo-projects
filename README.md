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
| project | [heavy #102](https://github.com/openXC7/demo-projects/actions/runs/43578029516) | [heavy #101](https://github.com/openXC7/demo-projects/actions/runs/43401453225) | [heavy #100](https://github.com/openXC7/demo-projects/actions/runs/43194022881) | [heavy #99](https://github.com/openXC7/demo-projects/actions/runs/42993938885) | [smoke #136](https://github.com/openXC7/demo-projects/actions/runs/42978709291) | [heavy #98](https://github.com/openXC7/demo-projects/actions/runs/42792846059) | [smoke #133](https://github.com/openXC7/demo-projects/actions/runs/42791804133) | [heavy #97](https://github.com/openXC7/demo-projects/actions/runs/42595352274) | pass rate |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `blinky-digilent-arty` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42978709291/job/130390285689) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42791804133/job/129753593955) | · | 100% |
| `blinky-digilent-basys-3` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42978709291/job/130390285737) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42791804133/job/129753594040) | · | 100% |
| `blinky-digilent-zybo` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42978709291/job/130390285770) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42791804133/job/129753594035) | · | 100% |
| `blinky-genesys2` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42978709291/job/130390285773) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42791804133/job/129753594007) | · | 100% |
| `blinky-kc705` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42978709291/job/130390285753) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42791804133/job/129753593892) | · | 100% |
| `blinky-qmtech` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42978709291/job/130390285847) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42791804133/job/129753593930) | · | 100% |
| `blinky-stlv7325` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42978709291/job/130390285727) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42791804133/job/129753593863) | · | 100% |
| `ddr3-test-arty-s7` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42978709291/job/130390285739) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42791804133/job/129753594070) | · | 100% |
| `dsp-test-arty-s7` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42978709291/job/130390285700) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42791804133/job/129753593713) | · | 100% |
| `litex-ddr-arty-s7` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42978709291/job/130390285725) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42791804133/job/129753594134) | · | 100% |
| `litex-ddr-enclustra-kx2` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42978709291/job/130390285900) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42791804133/job/129753593906) | · | 100% |
| `litex-ddr-hdmi-enclustra-kx2` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42978709291/job/130390285875) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42791804133/job/129753594076) | · | 100% |
| `litex-ddr-hdmi-stlv7325` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42978709291/job/130390285897) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42791804133/job/129753594005) | · | 100% |
| `litex-ddr-hpcstore-k420t` | [✔](https://github.com/openXC7/demo-projects/actions/runs/43578029516/job/132396755659) | [✔](https://github.com/openXC7/demo-projects/actions/runs/43401453225/job/131805406178) | [✔](https://github.com/openXC7/demo-projects/actions/runs/43194022881/job/131100674547) | [✔](https://github.com/openXC7/demo-projects/actions/runs/42993938885/job/130433656142) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42792846059/job/129750817748) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42595352274/job/129086910865) | 100% |
| `litex-ddr-kc705` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42978709291/job/130390285911) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42791804133/job/129753594078) | · | 100% |
| `litex-ddr-qmtech-artix7` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42978709291/job/130390285876) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42791804133/job/129753593821) | · | 100% |
| `litex-ddr-qmtech-kintex7` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42978709291/job/130390285723) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42791804133/job/129753593871) | · | 100% |
| `litex-ddr-stlv7325` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42978709291/job/130390285913) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42791804133/job/129753593973) | · | 100% |
| `litex-minimal-arty-s7` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42978709291/job/130390285835) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42791804133/job/129753593749) | · | 100% |
| `litex-sata-alientek-davincipro` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42978709291/job/130390286489) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42791804133/job/129753593880) | · | 100% |
| `picosoc` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42978709291/job/130390285906) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/42791804133/job/129753594015) | · | 100% |

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
