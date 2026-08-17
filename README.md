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
| project | [smoke #38](https://github.com/openXC7/demo-projects/actions/runs/31997578060) | [smoke #37](https://github.com/openXC7/demo-projects/actions/runs/31997106898) | [smoke #36](https://github.com/openXC7/demo-projects/actions/runs/31991807143) | [heavy #13](https://github.com/openXC7/demo-projects/actions/runs/31990267195) | [heavy #12](https://github.com/openXC7/demo-projects/actions/runs/31923609316) | [heavy #11](https://github.com/openXC7/demo-projects/actions/runs/31860748834) | [smoke #35](https://github.com/openXC7/demo-projects/actions/runs/31785720196) | [smoke #34](https://github.com/openXC7/demo-projects/actions/runs/31778234320) | pass rate |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `blinky-digilent-arty` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31991807143/job/95279910357) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31785720196/job/94730504387) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31778234320/job/94705314345) | 100% |
| `blinky-digilent-basys-3` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31991807143/job/95279910288) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31785720196/job/94730504340) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31778234320/job/94705314313) | 100% |
| `blinky-digilent-zybo` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31991807143/job/95279910287) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31785720196/job/94730504447) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31778234320/job/94705314274) | 100% |
| `blinky-genesys2` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31991807143/job/95279910274) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31785720196/job/94730504328) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31778234320/job/94705314284) | 100% |
| `blinky-kc705` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31991807143/job/95279910432) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31785720196/job/94730504332) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31778234320/job/94705314322) | 100% |
| `blinky-qmtech` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31991807143/job/95279910281) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31785720196/job/94730504448) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31778234320/job/94705314277) | 100% |
| `blinky-stlv7325` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31991807143/job/95279910306) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31785720196/job/94730504354) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31778234320/job/94705314337) | 100% |
| `ddr3-test-arty-s7` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31991807143/job/95279910350) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31785720196/job/94730504450) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31778234320/job/94705314339) | 100% |
| `litex-ddr-arty-s7` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31991807143/job/95279910334) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31785720196/job/94730504446) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31778234320/job/94705314272) | 100% |
| `litex-ddr-enclustra-kx2` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31991807143/job/95279910354) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31785720196/job/94730504550) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31778234320/job/94705314260) | 100% |
| `litex-ddr-hdmi-enclustra-kx2` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31991807143/job/95279910382) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31785720196/job/94730504602) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31778234320/job/94705314353) | 100% |
| `litex-ddr-hdmi-stlv7325` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31991807143/job/95279910301) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31785720196/job/94730504666) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31778234320/job/94705314400) | 100% |
| `litex-ddr-hpcstore-k420t` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31990267195/job/95273587744) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31923609316/job/95111393173) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31860748834/job/94958338137) | · | · | 100% |
| `litex-ddr-kc705` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31991807143/job/95279910380) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31785720196/job/94730504610) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31778234320/job/94705314332) | 100% |
| `litex-ddr-qmtech-artix7` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31991807143/job/95279910469) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31785720196/job/94730504670) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31778234320/job/94705314366) | 100% |
| `litex-ddr-qmtech-kintex7` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31991807143/job/95279910363) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31785720196/job/94730504416) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31778234320/job/94705314393) | 100% |
| `litex-ddr-stlv7325` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31991807143/job/95279910419) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31785720196/job/94730504425) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31778234320/job/94705314348) | 100% |
| `litex-minimal-arty-s7` | · | · | [✖](https://github.com/openXC7/demo-projects/actions/runs/31991807143/job/95279910290) | · | · | · | · | · | 0% |
| `litex-sata-alientek-davincipro` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31991807143/job/95279910467) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31785720196/job/94730504597) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31778234320/job/94705314431) | 100% |
| `picosoc` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31991807143/job/95279910351) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31785720196/job/94730504609) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31778234320/job/94705314357) | 100% |

✔ pass · ✖ fail · … running / cancelled · · not in run. Newest run left. Cells link to the workflow job.

<!-- matrix-report:end -->
