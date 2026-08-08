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
| project | [smoke #11](https://github.com/openXC7/demo-projects/actions/runs/31264181125) | [smoke #10](https://github.com/openXC7/demo-projects/actions/runs/31263970790) | [smoke #9](https://github.com/openXC7/demo-projects/actions/runs/31263850143) | [smoke #8](https://github.com/openXC7/demo-projects/actions/runs/31263554216) | [smoke #7](https://github.com/openXC7/demo-projects/actions/runs/31263547825) | [smoke #6](https://github.com/openXC7/demo-projects/actions/runs/31263538282) | [smoke #5](https://github.com/openXC7/demo-projects/actions/runs/31250283089) | [smoke #4](https://github.com/openXC7/demo-projects/actions/runs/31248356376) | pass rate |
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
| `litex-ddr-arty-s7` | · | · | · | · | · | · | · | · | — |
| `litex-ddr-enclustra-kx2` | · | · | · | · | · | · | · | · | — |
| `litex-ddr-hdmi-enclustra-kx2` | · | · | · | · | · | · | · | · | — |
| `litex-ddr-hdmi-stlv7325` | · | · | · | · | · | · | · | · | — |
| `litex-ddr-hpcstore-k420t` | · | · | · | · | · | · | · | · | — |
| `litex-ddr-kc705` | · | · | · | · | · | · | · | · | — |
| `litex-ddr-qmtech-artix7` | · | · | · | · | · | · | · | · | — |
| `litex-ddr-qmtech-kintex7` | · | · | · | · | · | · | · | · | — |
| `litex-ddr-stlv7325` | · | · | · | · | · | · | · | · | — |
| `matrix.project` | … | … | … | … | … | … | … | … | — |
| `picosoc` | · | · | · | · | · | · | · | · | — |
| `projects-${{ matrix.family }}` | · | · | · | · | · | · | · | · | — |
| `ps7-blinky-digilent-pynqz1` | · | · | · | · | · | · | · | · | — |
| `vexriscv` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/AhbLite3CrossbarTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/AhbLite3OnChipRamTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/Apb3SpiDdrMasterCtrlTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/Axi4CrossbarTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/Axi4CrossbarTester2` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/Axi4SharedOnChipRamTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/Axi4SharedSdramCtrlTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/Axi4SlaveFactoryTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/AxiLite4SlaveFactoryTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/BlackBoxTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/BundleTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/ClockDomainConfigTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/CommonTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/Dummy` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/FixedPointTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/FloatingTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/GrayCounterTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/I2CTester/iolayer` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/I2CTester2/Apb3I2cSlaveTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/I2CTester2/I2cSlaveTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/I2CTester2/IoMasterTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/I2CTester2/IoSlaveTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/InOutTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/InOutTester2` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/InOutTester3` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/InternalClockTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/LibTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/MandelbrotTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/MultiClockTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/OperatorTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/PDMTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/Pinsec/dhrystone` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/Pinsec/gpio` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/Pinsec/jtag` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/Pinsec/timer` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/Pinsec/uart` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/Pinsec/vga` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/PllAAssertSDeassertTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/RiscvTester/cached` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/RiscvTester/uncached` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/RiscvTester/uncachedPlay` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/RomTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/RomTester2` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/RomTester3` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/SdramCtrlTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/SdramXdr/Ddr2ModelTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/SdramXdr/Ddr3ModelTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/SdramXdr/Ddr3S7Tester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/SdramXdr/SdrModelTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/SdramXdr/SdrTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/SpiTester/Apb3SpiMasterCtrlTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/SpiTester/Apb3SpiSlaveCtrlTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/StreamTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/StreamTester2` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/TopLevel` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/UartTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/WhenTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/SpinalHDL/tester/src/test/python/spinal/ZeroWidthTester` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/VexRiscv/scripts/Murax/iCE40-hx8k_breakout_board` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/VexRiscv/scripts/Murax/iCE40-hx8k_breakout_board_xip` | · | · | · | · | · | · | · | · | — |
| `vexriscv_smp/ext/VexRiscv/scripts/Murax/iCE40HX8K-EVB` | · | · | · | · | · | · | · | · | — |

✔ pass · ✖ fail · … running / cancelled · · not in run. Newest run left. Cells link to the workflow job.

<!-- matrix-report:end -->
