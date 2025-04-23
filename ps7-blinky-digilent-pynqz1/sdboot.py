#!/usr/bin/env python3
# SPDX-License-Identifier: MIT
from zynq7000 import *

# Set tab to 4 spaces to view correctly!
_=0

z7000_ps_param_pynqz1 = {
    #				L0				L1					L2_01				L2_10				L2_11			L3_000		L3_001			L3_010				L3_011			L3_100			L3_101			L3_110			L3_111
    'MIO_PIN_00': [	_*'qspi1 ss_b',	x,					_*'sram/nor cs0',	_*'nand cs0',		_*'sd0 power',	_*'gpio',	x,				x,					x,				x,				x,				x,				''],
	'MIO_PIN_01': [	_*'qspi0 ss_b',	x,					_*'sram addr25',	_*'sram/nor cs1',	_*'sd1 power',	_*'gpio',	x,				x,					x,				x,				x,				x,				x],
	'MIO_PIN_02': [	_*'qspi0 io0',	_*'trace data8',	x,					_*'nand alen',		_*'sd0 power',	_*'gpio',	x,				x,					x,				x,				x,				x,				x],
	'MIO_PIN_03': [	_*'qspi0 io1',	_*'trace data9',	_*'sram/nor data0',	_*'nand we_b',		_*'sd1 power',	_*'gpio',	x,				x,					x,				x,				x,				x,				x],
	'MIO_PIN_04': [	_*'qspi0 io2',	_*'trace data10',	_*'sram/nor data1',	_*'nand data2',		_*'sd0 power',	_*'gpio',	x,				x,					x,				x,				x,				x,				x],
	'MIO_PIN_05': [	_*'qspi0 io3',	_*'trace data11',	_*'sram/nor data2',	_*'nand data0',		_*'sd1 power',	_*'gpio',	x,				x,					x,				x,				x,				x,				x],
	'MIO_PIN_06': [	_*'qspi0 sclk',	_*'trace data12',	_*'sram/nor data3',	_*'nand data1',		_*'sd0 power',	_*'gpio',	x,				x,					x,				x,				x,				x,				x],
	'MIO_PIN_07': [	x,				_*'trace data13',	_*'sram/nor oe_b',	_*'nand cle_b',		_*'sd1 power',	_*'gpio',	x,				x,					x,				x,				x,				x,				x],
	'MIO_PIN_08': [	_*'qspi fbclk',	_*'trace data14',	x,					_*'nand rd_b',		_*'sd0 power',	_*'gpio',	_*'can1 tx',	_*'sram/nor bls_b',	x,				x,				x,				x,				_*'uart1 txd'],
	'MIO_PIN_09': [	_*'qspi1 sclk',	_*'trace data15',	_*'sram/nor data6',	_*'nand data4',		_*'sd1 power',	_*'gpio',	_*'can1 rx',	x,					x,				x,				x,				x,				_*'uart1 rxd'],
	'MIO_PIN_10': [	_*'qspi1 io0',	_*'trace data2',	_*'sram/nor data7',	_*'nand data5',		_*'sd0 power',	_*'gpio',	_*'can0 rx',	_*'i2c0 scl',		_*'pjtag tdi',	_*'sd1 data0',	_*'spi1 mosi',	x,				_*'uart0 rxd'],
	'MIO_PIN_11': [	_*'qspi1 io1',	_*'trace data3',	_*'sram/nor data4',	_*'nand data6',		_*'sd1 power',	_*'gpio',	_*'can0 tx',	_*'i2c0 sda',		_*'pjtag tdo',	_*'sd1 cmd',	_*'spi1 miso',	x,				_*'uart0 txd'],
	'MIO_PIN_12': [	_*'qspi1 io2',	_*'trace clk',		x,					_*'nand data7',		_*'sd0 power',	_*'gpio',	_*'can1 tx',	_*'i2c1 scl',		_*'pjtag tck',	_*'sd1 sck',	_*'spi1 sck',	x,				_*'uart1 txd'],
	'MIO_PIN_13': [	_*'qspi1 io3',	_*'trace ctrl',		x,					_*'nand data3',		_*'sd1 power',	_*'gpio',	_*'can1 rx',	_*'i2c1 sda',		_*'pjtag tms',	_*'sd1 data1',	_*'spi1 ss0',	x,				_*'uart1 rxd'],
	'MIO_PIN_14': [	x,				_*'trace data0',	x,					_*'nand busy',		_*'sd0 power',	_*'gpio',	_*'can0 rx',	_*'i2c0 scl',		_*'swdt clk',	_*'sd1 data2',	_*'spi1 ss1',	x,				1*'uart0 rxd'],
	'MIO_PIN_15': [	x,				_*'trace data1',	_*'sram/nor addr0',	x,					_*'sd1 power',	_*'gpio',	_*'can0 tx',	_*'i2c0 sda',		_*'swdt rst',	_*'sd1 data3',	_*'spi1 ss2',	x,				1*'uart0 txd'],
	'MIO_PIN_16': [	_*'gem0 tx_clk',_*'trace data4',	_*'sram/nor addr1',	_*'nand data8',		_*'sd0 power',	_*'gpio',	_*'can1 tx',	_*'i2c1 scl',		x,				_*'sd0 sck',	_*'spi0 sck',	_*'ttc1 wave',	_*'uart1 txd'],
	'MIO_PIN_17': [	_*'gem0 txd0',	_*'trace data5',	_*'sram/nor addr2',	_*'nand data9',		_*'sd1 power',	_*'gpio',	_*'can1 rx',	_*'i2c1 sda',		x,				_*'sd0 cmd',	_*'spi0 miso',	_*'ttc1 clk',	_*'uart1 rxd'],
	'MIO_PIN_18': [	_*'gem0 txd1',	_*'trace data6',	_*'sram/nor addr3',	_*'nand data10',	_*'sd0 power',	_*'gpio',	_*'can0 rx',	_*'i2c0 scl',		x,				_*'sd0 data0',	_*'spi0 ss0',	_*'ttc0 wave',	_*'uart0 rxd'],
	'MIO_PIN_19': [	_*'gem0 txd2',	_*'trace data7',	_*'sram/nor addr4',	_*'nand data11',	_*'sd1 power',	_*'gpio',	_*'can0 tx',	_*'i2c0 sda',		x,				_*'sd0 data1',	_*'spi0 ss1',	_*'ttc0 clk',	_*'uart0 txd'],
	'MIO_PIN_20': [	_*'gem0 txd3',	x,					_*'sram/nor addr5',	_*'nand data12',	_*'sd0 power',	_*'gpio',	_*'can1 tx',	_*'i2c1 scl',		x,				_*'sd0 data2',	_*'spi0 ss2',	x,				_*'uart1 txd'],
	'MIO_PIN_21': [	_*'gem0 tx_ctl',x,					_*'sram/nor addr6',	_*'nand data13',	_*'sd1 power',	_*'gpio',	_*'can1 rx',	_*'i2c1 sda',		x,				_*'sd0 data3',	_*'spi0 mosi',	x,				_*'uart1 rxd'],
	'MIO_PIN_22': [	_*'gem0 rx_clk',_*'trace data2',	_*'sram/nor addr7',	_*'nand data14',	_*'sd0 power',	_*'gpio',	_*'can0 rx',	_*'i2c0 scl',		_*'pjtag tdi',	_*'sd1 data0',	_*'spi1 mosi',	x,				_*'uart0 rxd'],
	'MIO_PIN_23': [	_*'gem0 rxd0',	_*'trace data3',	_*'sram/nor addr8',	_*'nand data15',	_*'sd1 power',	_*'gpio',	_*'can0 tx',	_*'i2c0 sda',		_*'pjtag tdo',	_*'sd1 cmd',	_*'spi1 miso',	x,				_*'uart0 txd'],
	'MIO_PIN_24': [	_*'gem0 rxd1',	_*'trace clk',		_*'sram/nor addr9',	x,					_*'sd0 power',	_*'gpio',	_*'can1 tx',	_*'i2c1 scl',		_*'pjtag tck',	_*'sd1 sck',	_*'spi1 sck',	x,				_*'uart1 txd'],
	'MIO_PIN_25': [	_*'gem0 rxd2',	_*'trace ctrl',		_*'sram/nor addr10',x,					_*'sd1 power',	_*'gpio',	_*'can1 rx',	_*'i2c1 sda',		_*'pjtag tms',	_*'sd1 data1',	_*'spi1 ss0',	x,				_*'uart1 rxd'],
	'MIO_PIN_26': [	_*'gem0 rxd3',	_*'trace data0',	_*'sram/nor addr11',x,					_*'sd0 power',	_*'gpio',	_*'can0 rx',	_*'i2c0 scl',		_*'swdt clk',	_*'sd1 data2',	_*'spi1 ss1',	x,				_*'uart0 rxd'],
	'MIO_PIN_27': [	_*'gem0 rx_clk',_*'trace data1',	_*'sram/nor addr12',x,					_*'sd1 power',	_*'gpio',	_*'can0 tx',	_*'i2c0 sda',		_*'swdt rst',	_*'sd1 data3',	_*'spi1 ss2',	x,				_*'uart0 txd'],
	'MIO_PIN_28': [	_*'gem1 tx_clk',_*'usb0 data4',		_*'sram/nor addr13',x,					_*'sd0 power',	_*'gpio',	_*'can1 tx',	_*'i2c1 scl',		x,				_*'sd0 sck',	_*'spi0 sck',	_*'ttc1 wave',	_*'uart1 txd'],
	'MIO_PIN_29': [	_*'gem1 txd0',	_*'usb0 dir',		_*'sram/nor addr14',x,					_*'sd1 power',	_*'gpio',	_*'can1 rx',	_*'i2c1 sda',		x,				_*'sd0 miso',	_*'spi0 miso',	_*'ttc1 clk',	_*'uart1 rxd'],
	'MIO_PIN_30': [	_*'gem1 txd1',	_*'usb0 stp',		_*'sram/nor addr15',x,					_*'sd0 power',	_*'gpio',	_*'can0 rx',	_*'i2c0 scl',		x,				_*'sd0 data0',	_*'spi0 ss0',	_*'ttc0 wave',	_*'uart0 rxd'],
	'MIO_PIN_31': [	_*'gem1 txd2',	_*'usb0 nxt',		_*'sram/nor addr16',x,					_*'sd1 power',	_*'gpio',	_*'can0 tx',	_*'i2c0 sda',		x,				_*'sd0 data1',	_*'spi0 ss1',	_*'ttc0 clk',	_*'uart0 txd'],
	'MIO_PIN_32': [	_*'gem1 txd3',	_*'usb0 data0',		_*'sram/nor addr17',x,					_*'sd0 power',	_*'gpio',	_*'can1 tx',	_*'i2c1 scl',		x,				_*'sd0 data2',	_*'spi0 ss2',	x,				_*'uart1 txd'],
	'MIO_PIN_33': [	_*'gem1 tx_ctl',_*'usb0 data1',		_*'sram/nor addr18',x,					_*'sd1 power',	_*'gpio',	_*'can1 rx',	_*'i2c1 sda',		x,				_*'sd0 data3',	_*'spi0 mosi',	x,				_*'uart1 rxd'],
	'MIO_PIN_34': [	_*'gem1 rx_clk',_*'usb0 data2',		_*'sram/nor addr19',x,					_*'sd0 power',	_*'gpio',	_*'can0 rx',	_*'i2c0 scl',		_*'pjtag tdi',	_*'sd1 data0',	_*'spi1 mosi',	x,				_*'uart0 rxd'],
	'MIO_PIN_35': [	_*'gem1 rxd0',	_*'usb0 data3',		_*'sram/nor addr20',x,					_*'sd1 power',	_*'gpio',	_*'can0 tx',	_*'i2c0 sda',		_*'pjtag tdo',	_*'sd1 cmd',	_*'spi1 miso',	x,				_*'uart0 txd'],
	'MIO_PIN_36': [	_*'gem1 rxd1',	_*'usb0 clk',		_*'sram/nor addr21',x,					_*'sd0 power',	_*'gpio',	_*'can1 tx',	_*'i2c1 scl',		_*'pjtag tck',	_*'sd1 sck',	_*'spi1 sck',	x,				_*'uart1 txd'],
	'MIO_PIN_37': [	_*'gem1 rxd2',	_*'usb0 data5',		_*'sram/nor addr22',x,					_*'sd1 power',	_*'gpio',	_*'can1 rx',	_*'i2c1 sda',		_*'pjtag tms',	_*'sd1 data1',	_*'spi1 ss0',	x,				_*'uart1 rxd'],
	'MIO_PIN_38': [	_*'gem1 rxd3',	_*'usb0 data6',		_*'sram/nor addr23',x,					_*'sd0 power',	_*'gpio',	_*'can0 rx',	_*'i2c0 scl',		_*'swdt clk',	_*'sd1 data2',	_*'spi1 ss1',	x,				_*'uart0 rxd'],
	'MIO_PIN_39': [	_*'gem1 rx_ctl',_*'usb0 data7',		_*'sram/nor addr24',x,					_*'sd1 power',	_*'gpio',	_*'can0 tx',	_*'i2c0 sda',		_*'swdt rst',	_*'sd1 data3',	_*'spi1 ss2',	x,				_*'uart0 txd'],
	'MIO_PIN_40': [	x,				_*'usb1 data4',		x,					x,					_*'sd0 power',	_*'gpio',	_*'can1 tx',	_*'i2c1 scl',		x,				1*'sd0 sck',	_*'spi0 sck',	_*'ttc1 wave',	_*'uart1 txd'],
	'MIO_PIN_41': [	x,				_*'usb1 dir',		x,					x,					_*'sd1 power',	_*'gpio',	_*'can1 rx',	_*'i2c1 sda',		x,				1*'sd0 miso',	_*'spi0 miso',	_*'ttc1 clk',	_*'uart1 rxd'],
	'MIO_PIN_42': [	x,				_*'usb1 stp',		x,					x,					_*'sd0 power',	_*'gpio',	_*'can0 rx',	_*'i2c0 scl',		x,				1*'sd0 data0',	_*'spi0 ss0',	_*'ttc0 wave',	_*'uart0 rxd'],
	'MIO_PIN_43': [	x,				_*'usb1 nxt',		x,					x,					_*'sd1 power',	_*'gpio',	_*'can0 tx',	_*'i2c0 sda',		x,				1*'sd0 data1',	_*'spi0 ss1',	_*'ttc0 clk',	_*'uart0 txd'],
	'MIO_PIN_44': [	x,				_*'usb1 data0',		x,					x,					_*'sd0 power',	_*'gpio',	_*'can1 tx',	_*'i2c1 scl',		x,				1*'sd0 data2',	_*'spi0 ss2',	x,				_*'uart1 txd'],
	'MIO_PIN_45': [	x,				_*'usb1 data1',		x,					x,					_*'sd1 power',	_*'gpio',	_*'can1 rx',	_*'i2c1 sda',		x,				1*'sd0 data3',	_*'spi0 mosi',	x,				_*'uart1 rxd'],
	'MIO_PIN_46': [	x,				_*'usb1 data2',		x,					x,					_*'sd0 power',	_*'gpio',	_*'can0 rx',	_*'i2c0 scl',		_*'pjtag tdi',	_*'sd1 data0',	_*'spi1 mosi',	x,				_*'uart0 rxd'],
	'MIO_PIN_47': [	x,				_*'usb1 data3',		x,					x,					_*'sd1 power',	_*'gpio',	_*'can0 tx',	_*'i2c0 sda',		_*'pjtag tdo',	_*'sd1 cmd',	_*'spi1 miso',	x,				_*'uart0 txd'],
	'MIO_PIN_48': [	x,				_*'usb1 clk',		x,					x,					_*'sd0 power',	_*'gpio',	_*'can1 tx',	_*'i2c1 scl',		_*'pjtag tck',	_*'sd1 sck',	_*'spi1 sck',	x,				_*'uart1 txd'],
	'MIO_PIN_49': [	x,				_*'usb1 data5',		x,					x,					_*'sd1 power',	_*'gpio',	_*'can1 rx',	_*'i2c1 sda',		_*'pjtag tms',	_*'sd1 data1',	_*'spi1 ss0',	x,				_*'uart1 rxd'],
	'MIO_PIN_50': [	x,				_*'usb1 data6',		x,					x,					_*'sd0 power',	_*'gpio',	_*'can0 rx',	_*'i2c0 scl',		_*'swdt clk',	_*'sd1 data2',	_*'spi1 ss1',	x,				_*'uart0 rxd'],
	'MIO_PIN_51': [	x,				_*'usb1 data7',		x,					x,					_*'sd1 power',	_*'gpio',	_*'can0 tx',	_*'i2c0 sda',		_*'swdt rst',	_*'sd1 data3',	_*'spi1 ss2',	x,				_*'uart0 txd'],
	'MIO_PIN_52': [	x,				x,					x,					x,					_*'sd0 power',	_*'gpio',	_*'can1 tx',	_*'i2c1 scl',		_*'swdt clk',	_*'mdio0 clk',	_*'mdio1 clk',	x,				_*'uart1 txd'],
	'MIO_PIN_53': [	x,				x,					x,					x,					_*'sd1 power',	_*'gpio',	_*'can1 rx',	_*'i2c1 sda',		_*'swdt rst',	_*'mdio0 data',	_*'mdio1 data',	x,				_*'uart1 rxd'],
    'uart0' : { 'baud': 115200 }, 
    'freq'  : { 'crystal'  : 50.0 },
    'volt' : {'bank0': lvcmos33, 
              'bank1': lvcmos18}
	}

if __name__ == '__main__':
    z7 = Zynq7000()
    z7.param_load(z7000_ps_param_pynqz1)
    z7.ps7_init_gen(zynq7_allregisters)
    z7.ps7_init_filewrite('./ps7_init_sdboot/')
