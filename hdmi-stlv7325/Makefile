PREFIX ?= /snap/openxc7/current/opt/nextpnr-xilinx
DB_DIR=${PREFIX}/external/prjxray-db
CHIPDB=../chipdb

PART = xc7k325tffg676-1
DBPART = $(shell echo ${PART} | sed -e 's/-[0-9]//g')
SPEEDGRADE = $(shell echo ${PART} | sed -e 's/.*\-\([0-9]\)/\1/g')

.PHONY: all
all: hdmi_demo.bit

.PHONY: program
program: blinky.bit
	openFPGALoader --board stlv7325 --bitstream $<

hdmi_demo.json: hdmi_demo.v
	yosys -p "synth_xilinx -flatten -abc9 -arch xc7 -top hdmi_demo; write_json hdmi_demo.json" $<

# The chip database only needs to be generated once
# that is why we don't clean it with make clean
${CHIPDB}/${DBPART}.bin:
	pypy3 ${PREFIX}/python/bbaexport.py --device ${DBPART}-${SPEEDGRADE} --bba ${DBPART}.bba
	bbasm -l ${DBPART}.bba ${CHIPDB}/${DBPART}.bin
	rm -f ${DBPART}.bba

hdmi_demo.fasm: hdmi_demo.json ${CHIPDB}/${DBPART}.bin hdmi_demo.xdc
	nextpnr-xilinx --chipdb ${CHIPDB}/${DBPART}.bin --xdc hdmi_demo.xdc --json hdmi_demo.json --fasm $@ --router router2 #--verbose --debug
	
hdmi_demo.frames: hdmi_demo.fasm
	fasm2frames --part ${PART} --db-root ${DB_DIR}/kintex7 $< > $@

hdmi_demo.bit: hdmi_demo.frames
	xc7frames2bit --part_file ${DB_DIR}/kintex7/${PART}/part.yaml --part_name ${PART} --frm_file $< --output_file $@

.PHONY: clean
clean:
	@rm -f *.bit
	@rm -f *.frames
	@rm -f *.fasm
	@rm -f *.json
