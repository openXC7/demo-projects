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
| project | [smoke #95](https://github.com/openXC7/demo-projects/actions/runs/36644711973) | [heavy #56](https://github.com/openXC7/demo-projects/actions/runs/36542483939) | [heavy #55](https://github.com/openXC7/demo-projects/actions/runs/36398580249) | [heavy #54](https://github.com/openXC7/demo-projects/actions/runs/36305027145) | [heavy #53](https://github.com/openXC7/demo-projects/actions/runs/36227276564) | [smoke #92](https://github.com/openXC7/demo-projects/actions/runs/36226318638) | [smoke #90](https://github.com/openXC7/demo-projects/actions/runs/36128456577) | [smoke #88](https://github.com/openXC7/demo-projects/actions/runs/36121365212) | pass rate |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `blinky-digilent-arty` | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307218) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/36226318638/job/108364304921) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36128456577/job/108056942323) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36121365212/job/108031959406) | 100% |
| `blinky-digilent-basys-3` | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307257) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/36226318638/job/108364304971) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36128456577/job/108056942470) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36121365212/job/108031959421) | 100% |
| `blinky-digilent-zybo` | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307704) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/36226318638/job/108364304959) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36128456577/job/108056942377) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36121365212/job/108031959377) | 100% |
| `blinky-genesys2` | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307269) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/36226318638/job/108364304935) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36128456577/job/108056942335) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36121365212/job/108031959413) | 100% |
| `blinky-kc705` | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307281) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/36226318638/job/108364304965) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36128456577/job/108056942488) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36121365212/job/108031959374) | 100% |
| `blinky-qmtech` | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307321) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/36226318638/job/108364304926) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36128456577/job/108056942419) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36121365212/job/108031959362) | 100% |
| `blinky-stlv7325` | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307236) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/36226318638/job/108364304925) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36128456577/job/108056942425) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36121365212/job/108031959376) | 100% |
| `ddr3-test-arty-s7` | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307675) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/36226318638/job/108364304987) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36128456577/job/108056942366) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36121365212/job/108031959396) | 100% |
| `dsp-test-arty-s7` | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307548) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/36226318638/job/108364304994) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36128456577/job/108056942332) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36121365212/job/108031959460) | 100% |
| `litex-ddr-arty-s7` | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307591) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/36226318638/job/108364304953) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36128456577/job/108056942290) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36121365212/job/108031959405) | 100% |
| `litex-ddr-enclustra-kx2` | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307578) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/36226318638/job/108364305056) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36128456577/job/108056942433) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36121365212/job/108031959443) | 100% |
| `litex-ddr-hdmi-enclustra-kx2` | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307712) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/36226318638/job/108364304950) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36128456577/job/108056942406) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36121365212/job/108031959570) | 100% |
| `litex-ddr-hdmi-stlv7325` | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307648) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/36226318638/job/108364305026) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36128456577/job/108056942533) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36121365212/job/108031959727) | 100% |
| `litex-ddr-hpcstore-k420t` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/36542483939/job/109321274677) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36398580249/job/108851078744) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36305027145/job/108580016008) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36227276564/job/108366598147) | · | · | · | 100% |
| `litex-ddr-kc705` | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307691) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/36226318638/job/108364304956) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36128456577/job/108056942546) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36121365212/job/108031959395) | 100% |
| `litex-ddr-qmtech-artix7` | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307589) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/36226318638/job/108364305027) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36128456577/job/108056942500) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36121365212/job/108031959577) | 100% |
| `litex-ddr-qmtech-kintex7` | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307649) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/36226318638/job/108364304998) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36128456577/job/108056942439) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36121365212/job/108031959372) | 100% |
| `litex-ddr-stlv7325` | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307600) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/36226318638/job/108364304952) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36128456577/job/108056942364) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36121365212/job/108031959390) | 100% |
| `litex-minimal-arty-s7` | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307477) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/36226318638/job/108364304951) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36128456577/job/108056942373) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36121365212/job/108031959415) | 100% |
| `litex-sata-alientek-davincipro` | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307631) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/36226318638/job/108364304984) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36128456577/job/108056942544) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36121365212/job/108031959530) | 100% |
| `picosoc` | [✔](https://github.com/openXC7/demo-projects/actions/runs/36644711973/job/109680307516) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/36226318638/job/108364305088) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36128456577/job/108056942424) | [✔](https://github.com/openXC7/demo-projects/actions/runs/36121365212/job/108031959695) | 100% |

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
