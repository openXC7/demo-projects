PROJECT_NAME = hpcstore_xc7k420t
PREFIX ?= /snap/nextpnr-kintex/current
DB_DIR=${PREFIX}/opt/nextpnr-xilinx/external/prjxray-db

PART = xc7k420tffg901-1

.PHONY: all
all: ${PROJECT_NAME}.bit

${PROJECT_NAME}.json: ${PROJECT_NAME}.v
	yosys -p "hierarchy; synth_xilinx -flatten -abc9 -arch xc7 -nodsp -top ${PROJECT_NAME}; write_json ${PROJECT_NAME}.json;" $< vexriscv/VexRiscv.v

.PHOHY: edif
edif: ${PROJECT_NAME}.json
	yosys -p "read_json ${PROJECT_NAME}.json; write_edif ${PROJECT_NAME}.edif;"

# The chip database only needs to be generated once
# that is why we don't clean it with make clean
${PART}.bin:
	python3 ${PREFIX}/opt/nextpnr-xilinx/python/bbaexport.py --device ${PART} --bba ${PART}.bba
	bbasm -l ${PART}.bba ${PART}.bin
	rm -f ${PART}.bba

.PHONY: edif2json
netlist2json: verilog-netlist.v
	yosys -p "read_verilog verilog-netlist.v; hierarchy; synth_xilinx -flatten -abc9 -arch xc7 -nodsp -top ${PROJECT_NAME}; write_json ${PROJECT_NAME}.json;"

${PROJECT_NAME}.fasm: ${PROJECT_NAME}.json
	nextpnr-xilinx --chipdb ${PART}.bin --xdc ${PROJECT_NAME}.xdc  --json $< --write ${PROJECT_NAME}_routed.json --fasm $@  #--verbose --debug

${PROJECT_NAME}.frames: ${PROJECT_NAME}.fasm
	fasm2frames --part ${PART} --db-root ${DB_DIR}/kintex7 $< > $@

${PROJECT_NAME}.bit: ${PROJECT_NAME}.frames
	xc7frames2bit --part_file ${DB_DIR}/kintex7/${PART}/part.yaml --part_name ${PART} --frm_file $< --output_file $@

.PHONY: clean
clean:
	@rm -f *.bit
	@rm -f *.frames
	@rm -f *.fasm
	@rm -f *.json
