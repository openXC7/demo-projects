PREFIX ?= /snap/openxc7/current
DB_DIR=${PREFIX}/opt/nextpnr-xilinx/external/prjxray-db
CHIPDB=../chipdb

PART = xc7k325tffg900-2

.PHONY: all
all: blinky.bit

.PHONY: program
program: all
	openFPGALoader --board genesys2 --bitstream $<

blinky.json: blinky.v
	yosys -p "synth_xilinx -flatten -abc9 -nobram -arch xc7 -top blinky; write_json blinky.json" $<

# The chip database only needs to be generated once
# that is why we don't clean it with make clean
${CHIPDB}/${PART}.bin:
	python3 ${PREFIX}/opt/nextpnr-xilinx/python/bbaexport.py --device ${PART} --bba ${PART}.bba
	bbasm -l ${PART}.bba ${CHIPDB}/${PART}.bin
	rm -f ${PART}.bba

blinky.fasm: blinky.json ${CHIPDB}/${PART}.bin
	nextpnr-xilinx --chipdb ${CHIPDB}/${PART}.bin --xdc blinky.xdc --json blinky.json --fasm $@ --verbose --debug
	
blinky.frames: blinky.fasm
	fasm2frames --part ${PART} --db-root ${DB_DIR}/kintex7 $< > $@

blinky.bit: blinky.frames
	xc7frames2bit --part_file ${DB_DIR}/kintex7/${PART}/part.yaml --part_name ${PART} --frm_file $< --output_file $@

.PHONY: clean
clean:
	@rm -f *.bit
	@rm -f *.frames
	@rm -f *.fasm
	@rm -f *.json
