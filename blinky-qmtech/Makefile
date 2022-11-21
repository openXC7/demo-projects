PREFIX ?= /snap/nextpnr-kintex/current
DB_DIR=${PREFIX}/opt/nextpnr-xilinx/external/prjxray-db

PART = xc7k325tffg676-1

.PHONY: all
all: blinky.bit

.PHONY: program
program: blinky.bit
	openFPGALoader --board qmtechKintex7 --bitstream $<

blinky.json: blinky.v
	yosys -p "synth_xilinx -flatten -abc9 -nobram -arch xc7 -top blinky; write_json blinky.json" $<

# The chip database only needs to be generated once
# that is why we don't clean it with make clean
${PART}.bin:
	python3 ${PREFIX}/opt/nextpnr-xilinx/python/bbaexport.py --device ${PART} --bba ${PART}.bba
	bbasm -l ${PART}.bba ${PART}.bin
	rm -f ${PART}.bba

blinky.fasm: blinky.json ${PART}.bin
	nextpnr-xilinx --chipdb ${PART}.bin --xdc blinky.xdc --json blinky.json --fasm $@ --verbose --debug
	
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
