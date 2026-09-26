NEXTPNR_XILINX_DIR ?= /snap/openxc7/current/opt/nextpnr-xilinx
NEXTPNR_XILINX_PYTHON_DIR ?= ${NEXTPNR_XILINX_DIR}/python
PRJXRAY_DB_DIR ?= ${NEXTPNR_XILINX_DIR}/external/prjxray-db

DBPART = $(shell echo ${PART} | sed -e 's/-[0-9]//g')
SPEEDGRADE = $(shell echo ${PART} | sed -e 's/.*\-\([0-9]\)/\1/g')

CHIPDB ?= ../chipdb/
ifeq ($(CHIPDB),)
CHIPDB = ../chipdb/
endif

PYPY3 ?= pypy3

TOP ?= ${PROJECT}
TOP_MODULE ?= ${TOP}
TOP_VERILOG ?= ${TOP}.v

PNR_DEBUG ?= # --verbose --debug

BOARD ?= UNKNOWN
JTAG_LINK ?= --board ${BOARD}

XDC ?= ${PROJECT}.xdc

# fpga-as writes its target through a shell redirection, so a failure part-way
# leaves a truncated .bit that is NEWER than its prerequisite. The next make then
# skips regenerating it, and a truncated bitstream flashes, reports done 1, and
# the board does nothing -- done 1 means configuration completed, not that the
# design works. A CI matrix that checks only "was a .bit produced" reports green
# on exactly this.
#
# .DELETE_ON_ERROR makes make remove a target whose recipe failed, so the next
# run rebuilds it instead of building on top of the wreckage. It covers .fasm,
# .json and .bit as well, at no cost when nothing fails.
.DELETE_ON_ERROR:

.PHONY: all
all: ${PROJECT}.bit

.PHONY: program
program: ${PROJECT}.bit
	openFPGALoader ${JTAG_LINK} --bitstream $<

${PROJECT}.json: ${TOP_VERILOG} ${ADDITIONAL_SOURCES}
	yosys -p "synth_xilinx -flatten -abc9 ${SYNTH_OPTS} -arch xc7 -top ${TOP_MODULE}; write_json ${PROJECT}.json" $< ${ADDITIONAL_SOURCES}

# The chip database only needs to be generated once
# that is why we don't clean it with make clean.
#
# The engine generates a database per DIE, not per part, so derive the die
# from PART with the same device class the parser uses -- including its
# aliases: xc7a35t is served by the xc7a50t database and xc7z007s by
# xc7z010's.  CI pre-builds the databases and points CHIPDB at that
# directory, so this rule never fires there; in a devshell CHIPDB is unset
# and the database is built here on first use.
${CHIPDB}/${DBPART}.bin:
	mkdir -p ${CHIPDB}
	DIE=$$(echo ${PART} | sed -E 's/^(xc7z007s|xc7z012s|xc7z014s|xc7[azks][0-9]+t?|xc7vx[0-9]+t?).*/\1/'); \
	if [ "$$DIE" = xc7a35t ]; then DIE=xc7a50t; fi; \
	if [ "$$DIE" = xc7z007s ]; then DIE=xc7z010; fi; \
	echo "generating chipdb for $$DIE (${PART})"; \
	python3 ${NEXTPNR_XILINX_DIR}/share/nextpnr/himbaechel/uarch/xilinx/gen/xilinx_gen.py \
	    --xray ${PRJXRAY_DB_DIR}/${FAMILY} --device $$DIE --bba ${DBPART}.bba
	${NEXTPNR_XILINX_DIR}/bin/bbasm -l ${DBPART}.bba ${CHIPDB}/${DBPART}.bin
	rm -f ${DBPART}.bba

${PROJECT}.fasm: ${PROJECT}.json ${CHIPDB}/${DBPART}.bin ${XDC}
	nextpnr-xilinx --chipdb ${CHIPDB}/${DBPART}.bin --xdc ${XDC} --json ${PROJECT}.json --fasm $@ ${PNR_ARGS} ${PNR_DEBUG}
	
# fpga-as assembles the FASM into the bitstream in one process, where
# fasm2frames and xc7frames2bit needed two plus the .frames file between them.
# Its frames match that pair's on the designs in this repo -- artix7, kintex7,
# spartan7 and zynq7, compared frame by frame through its --dump_frames_file,
# bar two words in each of two transceiver frames of
# litex-sata-alientek-davincipro -- and it is 9x to 120x faster doing it.
${PROJECT}.bit: ${PROJECT}.fasm
	fpga-as --prjxray_db_path=${PRJXRAY_DB_DIR}/${FAMILY} --part ${PART} $< > $@

.PHONY: clean
clean:
	@rm -f *.bit
	@rm -f *.frames
	@rm -f *.fasm
	@rm -f *.json

.PHONY: pnrclean
pnrclean:
	rm *.fasm *.frames *.bit
