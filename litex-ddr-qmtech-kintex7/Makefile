FAMILY  = kintex7
PART    = xc7k325tffg676-1
BOARD   = qmtechKintex7
PROJECT = qmtech_xc7k325t
CHIPDB  = ${KINTEX7_CHIPDB}

VEXRISCV=../vexriscv_smp
ADDITIONAL_SOURCES = ${VEXRISCV}/Ram_1w_1rs_Generic.v ${VEXRISCV}/VexRiscvLitexSmpCluster_Cc1_Iw32Is4096Iy1_Dw32Ds4096Dy1_ITs4DTs4_Ldw128_Ood.v

.PHOHY: edif
edif: ${PROJECT}.json
	yosys -p "read_json ${PROJECT}.json; write_edif ${PROJECT}.edif;"

.PHONY: edif2json
netlist2json: verilog-netlist.v
	yosys -p "read_verilog verilog-netlist.v; hierarchy; synth_xilinx -flatten -abc9 -arch xc7  -top ${PROJECT}; write_json ${PROJECT}.json;"

include ../openXC7.mk
