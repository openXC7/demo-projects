PREFIX ?= /snap/openxc7/current
DB_DIR=${PREFIX}/opt/nextpnr-xilinx/external/prjxray-db/kintex7
#DB_DIR=../../db-workspace-for-kintex7/
CHIPDB=../chipdb

PART = xc7k325tffg676-1

.PHONY: all
all: hdmi_demo.bit

hdmi_demo.json: hdmi_demo.v
	yosys -p "synth_xilinx -flatten -abc9 -nobram -arch xc7 -top hdmi_demo; write_json hdmi_demo.json" $<

# The chip database only needs to be generated once
# that is why we don't clean it with make clean
${CHIPDB}/${PART}.bin:
	python3 ${PREFIX}/opt/nextpnr-xilinx/python/bbaexport.py --device ${PART} --bba ${PART}.bba
	bbasm -l ${PART}.bba ${CHIPDB}/${PART}.bin
	rm -f ${PART}.bba

hdmi_demo.fasm: hdmi_demo.json ${CHIPDB}/${PART}.bin hdmi_demo.xdc
	nextpnr-xilinx --chipdb ${CHIPDB}/${PART}.bin --xdc hdmi_demo.xdc --json hdmi_demo.json --fasm $@ #--verbose --debug
	
hdmi_demo.frames: hdmi_demo.fasm
	fasm2frames --part ${PART} --db-root ${DB_DIR} $< > $@

hdmi_demo.bit: hdmi_demo.frames
	xc7frames2bit --part_file ${DB_DIR}/${PART}/part.yaml --part_name ${PART} --frm_file $< --output_file $@

.PHONY: clean
clean:
	@rm -f *.bit
	@rm -f *.frames
	@rm -f *.fasm
	@rm -f *.json
