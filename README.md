# OpenXC7 FPGA toolchain demo projects

This repository contains demo projects for various Xilinx Series 7
development boards. They are intended to give you a quick
and easy template to use as a basis for your own projects,
and also to demonstrate the current capabilites of the toolchain.

[![smoke](https://github.com/openXC7/demo-projects/actions/workflows/smoke.yml/badge.svg)](https://github.com/openXC7/demo-projects/actions/workflows/smoke.yml)
[![test matrix](https://img.shields.io/badge/test%20matrix-dashboard-blue)](https://openXC7.github.io/demo-projects/)

The [test matrix dashboard](https://openXC7.github.io/demo-projects/) shows
the pass/fail status of every demo project across recent CI runs; the table
below is the same matrix, embedded and updated by CI.

<!-- matrix-report:start -->
| project | [smoke #13](https://github.com/openXC7/demo-projects/actions/runs/31338526172) | [smoke #12](https://github.com/openXC7/demo-projects/actions/runs/31338056842) | [heavy #3](https://github.com/openXC7/demo-projects/actions/runs/31293353410) | [smoke #11](https://github.com/openXC7/demo-projects/actions/runs/31264181125) | [smoke #10](https://github.com/openXC7/demo-projects/actions/runs/31263970790) | [smoke #9](https://github.com/openXC7/demo-projects/actions/runs/31263850143) | [smoke #8](https://github.com/openXC7/demo-projects/actions/runs/31263554216) | [smoke #7](https://github.com/openXC7/demo-projects/actions/runs/31263547825) | pass rate |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `blinky-allaboutfpga-edgez7-20` | · | · | · | · | · | · | · | · | — |
| `blinky-digilent-arty` | · | · | · | · | · | · | · | · | — |
| `blinky-digilent-basys-3` | · | · | · | · | · | · | · | · | — |
| `blinky-digilent-zybo` | · | · | · | · | · | · | · | · | — |
| `blinky-genesys2` | · | · | · | · | · | · | · | · | — |
| `blinky-kc705` | · | · | · | · | · | · | · | · | — |
| `blinky-qmtech` | · | · | · | · | · | · | · | · | — |
| `blinky-stlv7325` | · | · | · | · | · | · | · | · | — |
| `blinky-ypcb003381p1` | · | · | · | · | · | · | · | · | — |
| `ddr3-test-arty-s7` | · | · | · | · | · | · | · | · | — |
| `hdmi-stlv7325` | · | · | · | · | · | · | · | · | — |
| `heavy-artix7` | · | · | · | · | · | · | · | · | — |
| `heavy-kintex7` | · | · | · | · | · | · | · | · | — |
| `heavy-spartan7` | · | · | · | · | · | · | · | · | — |
| `litex-ddr-arty-s7` | · | · | [✖](https://github.com/openXC7/demo-projects/actions/runs/31293353410/job/93198316560) | · | · | · | · | · | 0% |
| `litex-ddr-enclustra-kx2` | · | · | [✖](https://github.com/openXC7/demo-projects/actions/runs/31293353410/job/93198316609) | · | · | · | · | · | 0% |
| `litex-ddr-hdmi-enclustra-kx2` | · | · | [✖](https://github.com/openXC7/demo-projects/actions/runs/31293353410/job/93198316571) | · | · | · | · | · | 0% |
| `litex-ddr-hdmi-stlv7325` | · | · | [✖](https://github.com/openXC7/demo-projects/actions/runs/31293353410/job/93198316563) | · | · | · | · | · | 0% |
| `litex-ddr-hpcstore-k420t` | · | · | [✖](https://github.com/openXC7/demo-projects/actions/runs/31293353410/job/93198316559) | · | · | · | · | · | 0% |
| `litex-ddr-kc705` | · | · | [✖](https://github.com/openXC7/demo-projects/actions/runs/31293353410/job/93198316535) | · | · | · | · | · | 0% |
| `litex-ddr-qmtech-artix7` | · | · | [✖](https://github.com/openXC7/demo-projects/actions/runs/31293353410/job/93198316556) | · | · | · | · | · | 0% |
| `litex-ddr-qmtech-kintex7` | · | · | [✖](https://github.com/openXC7/demo-projects/actions/runs/31293353410/job/93198316557) | · | · | · | · | · | 0% |
| `litex-ddr-stlv7325` | · | · | [✖](https://github.com/openXC7/demo-projects/actions/runs/31293353410/job/93198316561) | · | · | · | · | · | 0% |
| `litex-sata-alientek-davincipro` | · | · | [✖](https://github.com/openXC7/demo-projects/actions/runs/31293353410/job/93198316564) | · | · | · | · | · | 0% |
| `matrix.project` | · | … | · | … | … | … | … | … | — |
| `picosoc` | · | · | [✖](https://github.com/openXC7/demo-projects/actions/runs/31293353410/job/93198316550) | · | · | · | · | · | 0% |
| `projects-${{ matrix.family }}` | · | · | · | · | · | · | · | · | — |
| `ps7-blinky-digilent-pynqz1` | · | · | · | · | · | · | · | · | — |

✔ pass · ✖ fail · … running / cancelled · · not in run. Newest run left. Cells link to the workflow job.

<!-- matrix-report:end -->
