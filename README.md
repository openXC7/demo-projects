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
| project | [heavy #25](https://github.com/openXC7/demo-projects/actions/runs/33244398153) | [smoke #52](https://github.com/openXC7/demo-projects/actions/runs/33241913743) | [smoke #51](https://github.com/openXC7/demo-projects/actions/runs/33241804770) | [heavy #24](https://github.com/openXC7/demo-projects/actions/runs/33179461371) | [heavy #23](https://github.com/openXC7/demo-projects/actions/runs/33073321237) | [smoke #50](https://github.com/openXC7/demo-projects/actions/runs/32926852662) | [smoke #49](https://github.com/openXC7/demo-projects/actions/runs/32926739857) | [heavy #22](https://github.com/openXC7/demo-projects/actions/runs/32925792236) | pass rate |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `blinky-digilent-arty` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949917) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392397) | · | · | 100% |
| `blinky-digilent-basys-3` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949890) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392566) | · | · | 100% |
| `blinky-digilent-zybo` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949966) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392784) | · | · | 100% |
| `blinky-genesys2` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949886) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392541) | · | · | 100% |
| `blinky-kc705` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949892) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392419) | · | · | 100% |
| `blinky-qmtech` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949896) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392461) | · | · | 100% |
| `blinky-stlv7325` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949895) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392446) | · | · | 100% |
| `ddr3-test-arty-s7` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949918) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392423) | · | · | 100% |
| `dsp-test-arty-s7` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949952) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392466) | · | · | 100% |
| `litex-ddr-arty-s7` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949954) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392478) | · | · | 100% |
| `litex-ddr-enclustra-kx2` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949923) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392604) | · | · | 100% |
| `litex-ddr-hdmi-enclustra-kx2` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949906) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392490) | · | · | 100% |
| `litex-ddr-hdmi-stlv7325` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949909) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392620) | · | · | 100% |
| `litex-ddr-hpcstore-k420t` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33179461371/job/98879414172) | [✔](https://github.com/openXC7/demo-projects/actions/runs/33073321237/job/98523258033) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32925792236/job/98055487989) | 100% |
| `litex-ddr-kc705` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949915) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392589) | · | · | 100% |
| `litex-ddr-qmtech-artix7` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949941) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392547) | · | · | 100% |
| `litex-ddr-qmtech-kintex7` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949932) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392987) | · | · | 100% |
| `litex-ddr-stlv7325` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949933) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392484) | · | · | 100% |
| `litex-minimal-arty-s7` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949929) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392550) | · | · | 100% |
| `litex-sata-alientek-davincipro` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949940) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392593) | · | · | 100% |
| `picosoc` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949942) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392625) | · | · | 100% |

✔ pass · ✖ fail · … running / cancelled · · not in run. Newest run left. Cells link to the workflow job.

<!-- matrix-report:end -->
