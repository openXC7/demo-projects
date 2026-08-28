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
| project | [heavy #24](https://github.com/openXC7/demo-projects/actions/runs/33179461371) | [heavy #23](https://github.com/openXC7/demo-projects/actions/runs/33073321237) | [smoke #50](https://github.com/openXC7/demo-projects/actions/runs/32926852662) | [smoke #49](https://github.com/openXC7/demo-projects/actions/runs/32926739857) | [heavy #22](https://github.com/openXC7/demo-projects/actions/runs/32925792236) | [smoke #48](https://github.com/openXC7/demo-projects/actions/runs/32922582203) | [smoke #47](https://github.com/openXC7/demo-projects/actions/runs/32917670664) | [smoke #46](https://github.com/openXC7/demo-projects/actions/runs/32915148368) | pass rate |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `blinky-digilent-arty` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392397) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32922582203/job/98046406139) | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454912) | · | 100% |
| `blinky-digilent-basys-3` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392566) | · | · | … | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454897) | · | 100% |
| `blinky-digilent-zybo` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392784) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32922582203/job/98046406219) | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454922) | · | 100% |
| `blinky-genesys2` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392541) | · | · | … | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454873) | · | 100% |
| `blinky-kc705` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392419) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32922582203/job/98046406132) | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454848) | · | 100% |
| `blinky-qmtech` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392461) | · | · | … | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454832) | · | 100% |
| `blinky-stlv7325` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392446) | · | · | … | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454895) | · | 100% |
| `ddr3-test-arty-s7` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392423) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32922582203/job/98046406159) | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454898) | · | 100% |
| `dsp-test-arty-s7` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392466) | · | · | · | · | · | 100% |
| `litex-ddr-arty-s7` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392478) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32922582203/job/98046406137) | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454894) | · | 100% |
| `litex-ddr-enclustra-kx2` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392604) | · | · | … | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454891) | · | 100% |
| `litex-ddr-hdmi-enclustra-kx2` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392490) | · | · | … | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454814) | · | 100% |
| `litex-ddr-hdmi-stlv7325` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392620) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32922582203/job/98046406135) | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454911) | · | 100% |
| `litex-ddr-hpcstore-k420t` | [✔](https://github.com/openXC7/demo-projects/actions/runs/33179461371/job/98879414172) | [✔](https://github.com/openXC7/demo-projects/actions/runs/33073321237/job/98523258033) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32925792236/job/98055487989) | · | · | · | 100% |
| `litex-ddr-kc705` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392589) | · | · | … | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454816) | · | 100% |
| `litex-ddr-qmtech-artix7` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392547) | · | · | … | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454985) | · | 100% |
| `litex-ddr-qmtech-kintex7` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392987) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32922582203/job/98046406182) | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454829) | · | 100% |
| `litex-ddr-stlv7325` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392484) | · | · | … | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454880) | · | 100% |
| `litex-minimal-arty-s7` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392550) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32922582203/job/98046406180) | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454968) | · | 100% |
| `litex-sata-alientek-davincipro` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392593) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32922582203/job/98046406108) | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454994) | · | 100% |
| `picosoc` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32926852662/job/98058392625) | · | · | … | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454901) | · | 100% |

✔ pass · ✖ fail · … running / cancelled · · not in run. Newest run left. Cells link to the workflow job.

<!-- matrix-report:end -->
