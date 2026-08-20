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
| project | [heavy #16](https://github.com/openXC7/demo-projects/actions/runs/32327139723) | [heavy #15](https://github.com/openXC7/demo-projects/actions/runs/32211097670) | [heavy #14](https://github.com/openXC7/demo-projects/actions/runs/32094271900) | [smoke #41](https://github.com/openXC7/demo-projects/actions/runs/32086192655) | [smoke #40](https://github.com/openXC7/demo-projects/actions/runs/32085672590) | [smoke #39](https://github.com/openXC7/demo-projects/actions/runs/32018454169) | [smoke #38](https://github.com/openXC7/demo-projects/actions/runs/31997578060) | [smoke #37](https://github.com/openXC7/demo-projects/actions/runs/31997106898) | pass rate |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `blinky-digilent-arty` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32086192655/job/95566407356) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32018454169/job/95383086072) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31997578060/job/95295754836) | · | 100% |
| `blinky-digilent-basys-3` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32086192655/job/95566407434) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32018454169/job/95383086107) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31997578060/job/95295755006) | · | 100% |
| `blinky-digilent-zybo` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32086192655/job/95566407375) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32018454169/job/95383086231) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31997578060/job/95295754962) | · | 100% |
| `blinky-genesys2` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32086192655/job/95566407380) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32018454169/job/95383086173) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31997578060/job/95295754734) | · | 100% |
| `blinky-kc705` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32086192655/job/95566407535) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32018454169/job/95383086294) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31997578060/job/95295754840) | · | 100% |
| `blinky-qmtech` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32086192655/job/95566407416) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32018454169/job/95383086218) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31997578060/job/95295754834) | · | 100% |
| `blinky-stlv7325` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32086192655/job/95566407676) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32018454169/job/95383086151) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31997578060/job/95295754842) | · | 100% |
| `ddr3-test-arty-s7` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32086192655/job/95566407371) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32018454169/job/95383086139) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31997578060/job/95295754922) | · | 100% |
| `litex-ddr-arty-s7` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32086192655/job/95566407385) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32018454169/job/95383086186) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31997578060/job/95295754892) | · | 100% |
| `litex-ddr-enclustra-kx2` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32086192655/job/95566407483) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32018454169/job/95383086244) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31997578060/job/95295754959) | · | 100% |
| `litex-ddr-hdmi-enclustra-kx2` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32086192655/job/95566407423) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32018454169/job/95383086254) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31997578060/job/95295754980) | · | 100% |
| `litex-ddr-hdmi-stlv7325` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32086192655/job/95566407444) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32018454169/job/95383086126) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31997578060/job/95295754924) | · | 100% |
| `litex-ddr-hpcstore-k420t` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32211097670/job/95951152459) | [✔](https://github.com/openXC7/demo-projects/actions/runs/32094271900/job/95589707771) | · | · | · | · | · | 100% |
| `litex-ddr-kc705` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32086192655/job/95566407392) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32018454169/job/95383086250) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31997578060/job/95295755045) | · | 100% |
| `litex-ddr-qmtech-artix7` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32086192655/job/95566407415) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32018454169/job/95383086239) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31997578060/job/95295754907) | · | 100% |
| `litex-ddr-qmtech-kintex7` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32086192655/job/95566407460) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32018454169/job/95383086219) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31997578060/job/95295754951) | · | 100% |
| `litex-ddr-stlv7325` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32086192655/job/95566407403) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32018454169/job/95383086225) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31997578060/job/95295755096) | · | 100% |
| `litex-minimal-arty-s7` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32086192655/job/95566407455) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32018454169/job/95383086269) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31997578060/job/95295754976) | · | 100% |
| `litex-sata-alientek-davincipro` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32086192655/job/95566407461) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32018454169/job/95383086209) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31997578060/job/95295754913) | · | 100% |
| `picosoc` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32086192655/job/95566407440) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32018454169/job/95383086179) | [✔](https://github.com/openXC7/demo-projects/actions/runs/31997578060/job/95295754981) | · | 100% |

✔ pass · ✖ fail · … running / cancelled · · not in run. Newest run left. Cells link to the workflow job.

<!-- matrix-report:end -->
