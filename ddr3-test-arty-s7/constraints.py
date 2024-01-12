#!/usr/bin/env python3
def get_cells(name_part):
    return list(map(lambda c: c.second, filter(lambda c: name_part in c.first, ctx.cells)))

def get_cell(name_part):
    return get_cells(name_part)[0]

c1=get_cell('ddr3_top.ddr3_phy_inst.genblk5[0].ISERDESE2_train')
c3=get_cell('ddr3_top.ddr3_phy_inst.genblk5[0].OSERDESE2_train')

c2=get_cell('ddr3_top.ddr3_phy_inst.genblk5[1].ISERDESE2_train')
c4=get_cell('ddr3_top.ddr3_phy_inst.genblk5[1].OSERDESE2_train')

# Usually, nextpnr-xilinx would place these on X0Y149, but
# prjxray has missing PIPs on _SING tiles, so we need to
# place these on a non-SING tile to make it work
c2.setAttr('BEL', 'ILOGIC_X0Y145/ISERDESE2')
c4.setAttr('BEL', 'OLOGIC_X0Y145/OSERDESE2')

