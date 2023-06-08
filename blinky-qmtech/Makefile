PREFIX ?= /snap/openxc7/current/opt/nextpnr-xilinx
DB_DIR=${PREFIX}/opt/nextpnr-xilinx/external/prjxray-db
CHIPDB=../chipdb

PART = xc7k325tffg676-1
DBPART = $(shell echo ${PART} | sed -e 's/-[0-9]//g')
SPEEDGRADE = $(shell echo ${PART} | sed -e 's/.*\-\([0-9]\)/\1/g')

.PHONY: all
all: blinky.bit

.PHONY: program
program: blinky.bit
	openFPGALoader --board qmtechKintex7 --bitstream $<

blinky.json: blinky.v
	yosys -p "synth_xilinx -flatten -abc9 -nobram -arch xc7 -top blinky; write_json blinky.json" $<

# The chip database only needs to be generated once
# that is why we don't clean it with make clean
${CHIPDB}/${DBPART}.bin:
	pypy3 ${PREFIX}/python/bbaexport.py --device ${DBPART}-${SPEEDGRADE} --bba ${DBPART}.bba
	bbasm -l ${DBPART}.bba ${CHIPDB}/${DBPART}.bin
	rm -f ${DBPART}.bba

blinky.fasm: blinky.json ${CHIPDB}/${DBPART}.bin
	nextpnr-xilinx --chipdb ${CHIPDB}/${DBPART}.bin --xdc blinky.xdc --json blinky.json --fasm $@ --verbose --debug
	
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
