#!/usr/bin/env python3

#
# This file is part of LiteX-Boards.
#
# Copyright (c) 2023 Hans Baier <hansfbaier@gmail.com>
# SPDX-License-Identifier: BSD-2-Clause

# Board product page: https://www.alientek.com/productinfo/945752.html
# Taobao item: https://item.taobao.com/item.htm?id=641238123452
# The Taobao agent I used: https://www.basetao.com/?ejATJf+gGuEbpa8IBg

from migen import *

from litex.gen import *

from litex_boards.platforms import alientek_davincipro

from litex.soc.cores.clock import *
from litex.soc.integration.soc_core import *
from litex.soc.integration.builder import *
from litex.soc.cores.led import LedChaser

from litedram.modules import IS43TR16128B
from litedram.phy import s7ddrphy

# CRG ----------------------------------------------------------------------------------------------

class _CRG(LiteXModule):
    def __init__(self, platform, sys_clk_freq, with_dram=True, with_rst=True):
        self.rst    = Signal()
        self.cd_sys = ClockDomain()
        self.cd_eth = ClockDomain()
        if with_dram:
            self.cd_sys4x     = ClockDomain()
            self.cd_sys4x_dqs = ClockDomain()
            self.cd_idelay    = ClockDomain()

        # # #

        # Clk/Rst.
        clk50 = platform.request("clk50")
        rst   = ~platform.request("cpu_reset_n") if with_rst else 0

        # PLL.
        self.pll = pll = S7PLL(speedgrade=-2)
        self.comb += pll.reset.eq(rst | self.rst)
        pll.register_clkin(clk50, 50e6)
        pll.create_clkout(self.cd_sys, sys_clk_freq)
        pll.create_clkout(self.cd_eth, 25e6)
        platform.add_false_path_constraints(self.cd_sys.clk, pll.clkin) # Ignore sys_clk to pll.clkin path created by SoC's rst.
        if with_dram:
            pll.create_clkout(self.cd_sys4x,     4*sys_clk_freq)
            pll.create_clkout(self.cd_sys4x_dqs, 4*sys_clk_freq, phase=90)
            pll.create_clkout(self.cd_idelay,    200e6)

        # IdelayCtrl.
        if with_dram:
            self.idelayctrl = S7IDELAYCTRL(self.cd_idelay)

        # GTP RefClk -------------------------------------------------------------------------------
        self.cd_refclk = ClockDomain()
        refclk_pads = platform.request("gtp_refclk")
        self.specials += Instance("IBUFDS_GTE2",
            i_CEB = 0,
            i_I   = refclk_pads.p,
            i_IB  = refclk_pads.n,
            o_O   = ClockSignal("refclk"),
        )

# BaseSoC ------------------------------------------------------------------------------------------

class BaseSoC(SoCCore):
    def __init__(self, variant="a7-35", toolchain="vivado", sys_clk_freq=100e6,
        with_led_chaser = True,
        **kwargs):
        platform = alientek_davincipro.Platform(variant=variant, toolchain=toolchain)

        # CRG --------------------------------------------------------------------------------------
        with_dram = (kwargs.get("integrated_main_ram_size", 0) == 0)
        self.crg  = _CRG(platform, sys_clk_freq, with_dram, with_rst=True)

        # SoCCore ----------------------------------------------------------------------------------
        kwargs["cpu_variant"] = "minimal"
        SoCCore.__init__(self, platform, sys_clk_freq, ident=f"LiteX SoC on Alientek DaVinci Pro ({variant}t)", **kwargs)

        # DDR3 SDRAM -------------------------------------------------------------------------------
        if not self.integrated_main_ram_size:
            self.ddrphy = s7ddrphy.A7DDRPHY(platform.request("ddram"),
                memtype        = "DDR3",
                nphases        = 4,
                sys_clk_freq   = sys_clk_freq)
            self.add_sdram("sdram",
                phy           = self.ddrphy,
                module        = IS43TR16128B(sys_clk_freq, "1:4"),
                l2_cache_size = kwargs.get("l2_size", 8192)
            )

        # SATA -------------------------------------------------------------------------------------
        with_sata = True
        if with_sata:
            from litex.build.generic_platform import Subsignal, Pins
            from litesata.phy import LiteSATAPHY

            # IOs
            _sata_io = [
                 # PCIe 2 SATA Custom Adapter (With PCIe Riser / SATA cable mod).
                ("pcie2sata", 0,
                    Subsignal("tx_p",  Pins("B6")),
                    Subsignal("tx_n",  Pins("A6")),
                    Subsignal("rx_p",  Pins("B10")),
                    Subsignal("rx_n",  Pins("A10")),
                ),
            ]
            platform.add_extension(_sata_io)

            sata_refclk = ClockSignal("refclk")

            # PHY
            self.sata_phy = LiteSATAPHY(platform.device,
                refclk     = sata_refclk,
                pads       = platform.request("pcie2sata"),
                gen        = "gen1",
                clk_freq   = sys_clk_freq,
                data_width = 16)

            # Core
            self.add_sata(phy=self.sata_phy, mode="read+write")


        # Leds -------------------------------------------------------------------------------------
        if with_led_chaser:
            self.leds = LedChaser(
                pads         = platform.request_all("user_led"),
                sys_clk_freq = sys_clk_freq,
            )


# Build --------------------------------------------------------------------------------------------

def main():
    from litex.build.parser import LiteXArgumentParser
    parser = LiteXArgumentParser(platform=alientek_davincipro.Platform, description="LiteX SoC on Alientek Davinci Pro.")
    parser.add_target_argument("--variant",        default="a7-35",           help="Board variant (a7-35 or a7-100).")
    parser.add_target_argument("--sys-clk-freq",   default=100e6, type=float, help="System clock frequency.")
    args = parser.parse_args()

    soc = BaseSoC(
        variant        = args.variant,
        toolchain      = "openxc7", # "vivado"
        sys_clk_freq   = args.sys_clk_freq,
        integrated_main_ram_size = 4 * 1024,
        **parser.soc_argdict
    )

    builder = Builder(soc, **parser.builder_argdict)
    if args.build:
        builder.build(**parser.toolchain_argdict)

if __name__ == "__main__":
    main()
