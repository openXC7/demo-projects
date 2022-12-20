PROJECT_NAME = qmtech_xc7k325t
PREFIX ?= /snap/nextpnr-kintex/current
DB_DIR=${PREFIX}/opt/nextpnr-xilinx/external/prjxray-db/kintex7/
#DB_DIR=../../db-workspace-for-kintex7/
CHIPDB=../chipdb
VEXRISCV=../vexriscv_smp
#VEXRISCV_SRC = ${VEXRISCV}/VexRiscv.v
VEXRISCV_SRC = ${VEXRISCV}/Ram_1w_1rs_Generic.v ${VEXRISCV}/VexRiscvLitexSmpCluster_Cc1_Iw32Is4096Iy1_Dw32Ds4096Dy1_ITs4DTs4_Ldw128_Ood.v


PART = xc7k325tffg676-1

.PHONY: all
all: ${PROJECT_NAME}.bit

${PROJECT_NAME}.json: ${PROJECT_NAME}.v
	yosys -p "hierarchy; synth_xilinx -flatten -abc9 -arch xc7 -nodsp -top ${PROJECT_NAME}; write_json ${PROJECT_NAME}.json;" $< ${VEXRISCV}/${VEXRISCV_SRC}

.PHOHY: edif
edif: ${PROJECT_NAME}.json
	yosys -p "read_json ${PROJECT_NAME}.json; write_edif ${PROJECT_NAME}.edif;"

.PHONY: edif2json
netlist2json: verilog-netlist.v
	yosys -p "read_verilog verilog-netlist.v; hierarchy; synth_xilinx -flatten -abc9 -arch xc7 -nodsp -top ${PROJECT_NAME}; write_json ${PROJECT_NAME}.json;"

# The chip database only needs to be generated once
# that is why we don't clean it with make clean
${CHIPDB}/${PART}.bin:
	python3 ${PREFIX}/opt/nextpnr-xilinx/python/bbaexport.py --device ${PART} --bba ${PART}.bba
	bbasm -l ${PART}.bba ${CHIPDB}/${PART}.bin
	rm -f ${PART}.bba

${PROJECT_NAME}.fasm: ${PROJECT_NAME}.json ${CHIPDB}/${PART}.bin
	nextpnr-xilinx --chipdb ${CHIPDB}/${PART}.bin --xdc ${PROJECT_NAME}.xdc  --json $< --write ${PROJECT_NAME}_routed.json --fasm $@  #--verbose --debug

${PROJECT_NAME}.frames: ${PROJECT_NAME}.fasm
	fasm2frames --part ${PART} --db-root ${DB_DIR} $< > $@

${PROJECT_NAME}.bit: ${PROJECT_NAME}.frames
	xc7frames2bit --part_file ${DB_DIR}/${PART}/part.yaml --part_name ${PART} --frm_file $< --output_file $@

.PHONY: clean pnrclean
clean:
	@rm -f *.bit
	@rm -f *.frames
	@rm -f *.fasm
	@rm -f *.json

pnrclean:
	rm *.fasm *.frames *.bit

