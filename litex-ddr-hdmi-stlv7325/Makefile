PROJECT_NAME = sitlinv_stlv7325
# Paths come from the toolchain-nix devshell / CI environment
# (PRJXRAY_DB_DIR, NEXTPNR_XILINX_PYTHON_DIR); no snap layout.
DB_DIR ?= ${PRJXRAY_DB_DIR}/kintex7
CHIPDB  = ${KINTEX7_CHIPDB}
VEXRISCV=../vexriscv

PART = xc7k325tffg676-1

.PHONY: all
all: ${PROJECT_NAME}.bit

${PROJECT_NAME}.json: ${PROJECT_NAME}.v
	yosys -p "hierarchy; synth_xilinx -flatten -abc9 -arch xc7 -top ${PROJECT_NAME}; write_json ${PROJECT_NAME}.json;" $< ../vexriscv/VexRiscv.v

# The chip database only needs to be generated once
# that is why we don't clean it with make clean
${CHIPDB}/${PART}.bin:
	${NEXTPNR_XILINX_PYTHON_DIR}/bbaexport.py --device ${PART} --bba ${PART}.bba
	bbasm -l ${PART}.bba ${CHIPDB}/${PART}.bin
	rm -f ${PART}.bba

${PROJECT_NAME}.fasm: ${PROJECT_NAME}.json ${CHIPDB}/${PART}.bin
	nextpnr-xilinx --chipdb ${CHIPDB}/${PART}.bin --xdc ${PROJECT_NAME}.xdc  --json $< --write ${PROJECT_NAME}_routed.json --fasm $@  --freq 50 #--router router2 #--debug-router ##--verbose --debug

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

