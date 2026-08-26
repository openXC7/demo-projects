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
| project | [smoke #49](https://github.com/openXC7/demo-projects/actions/runs/32926739857) | [heavy #22](https://github.com/openXC7/demo-projects/actions/runs/32925792236) | [smoke #48](https://github.com/openXC7/demo-projects/actions/runs/32922582203) | [smoke #47](https://github.com/openXC7/demo-projects/actions/runs/32917670664) | [smoke #46](https://github.com/openXC7/demo-projects/actions/runs/32915148368) | [smoke #45](https://github.com/openXC7/demo-projects/actions/runs/32914112571) | [smoke #44](https://github.com/openXC7/demo-projects/actions/runs/32913207665) | [smoke #43](https://github.com/openXC7/demo-projects/actions/runs/32896616279) | pass rate |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `blinky-digilent-arty` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32922582203/job/98046406139) | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454912) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32896616279/job/97974140864) | 100% |
| `blinky-digilent-basys-3` | · | · | … | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454897) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32896616279/job/97974140822) | 100% |
| `blinky-digilent-zybo` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32922582203/job/98046406219) | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454922) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32896616279/job/97974140924) | 100% |
| `blinky-genesys2` | · | · | … | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454873) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32896616279/job/97974140889) | 100% |
| `blinky-kc705` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32922582203/job/98046406132) | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454848) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32896616279/job/97974140836) | 100% |
| `blinky-qmtech` | · | · | … | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454832) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32896616279/job/97974140851) | 100% |
| `blinky-stlv7325` | · | · | … | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454895) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32896616279/job/97974140804) | 100% |
| `ddr3-test-arty-s7` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32922582203/job/98046406159) | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454898) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32896616279/job/97974140819) | 100% |
| `dsp-test-arty-s7` | · | · | · | · | · | · | · | · | — |
| `litex-ddr-arty-s7` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32922582203/job/98046406137) | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454894) | · | · | · | [✖](https://github.com/openXC7/demo-projects/actions/runs/32896616279/job/97974140837) | 67% |
| `litex-ddr-enclustra-kx2` | · | · | … | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454891) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32896616279/job/97974140800) | 100% |
| `litex-ddr-hdmi-enclustra-kx2` | · | · | … | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454814) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32896616279/job/97974140929) | 100% |
| `litex-ddr-hdmi-stlv7325` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32922582203/job/98046406135) | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454911) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32896616279/job/97974141022) | 100% |
| `litex-ddr-hpcstore-k420t` | · | · | · | · | · | · | · | · | — |
| `litex-ddr-kc705` | · | · | … | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454816) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32896616279/job/97974141067) | 100% |
| `litex-ddr-qmtech-artix7` | · | · | … | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454985) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32896616279/job/97974141005) | 100% |
| `litex-ddr-qmtech-kintex7` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32922582203/job/98046406182) | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454829) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32896616279/job/97974140835) | 100% |
| `litex-ddr-stlv7325` | · | · | … | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454880) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32896616279/job/97974140956) | 100% |
| `litex-minimal-arty-s7` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32922582203/job/98046406180) | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454968) | · | · | · | [✖](https://github.com/openXC7/demo-projects/actions/runs/32896616279/job/97974140858) | 67% |
| `litex-sata-alientek-davincipro` | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32922582203/job/98046406108) | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454994) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32896616279/job/97974141020) | 100% |
| `picosoc` | · | · | … | [✔](https://github.com/openXC7/demo-projects/actions/runs/32917670664/job/98031454901) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/32896616279/job/97974140999) | 100% |

✔ pass · ✖ fail · … running / cancelled · · not in run. Newest run left. Cells link to the workflow job.

<!-- matrix-report:end -->
