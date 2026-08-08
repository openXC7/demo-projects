FAMILY  = kintex7
PART    = xc7k325tffg676-1
PROJECT = picosoc
CHIPDB  = ${KINTEX7_CHIPDB}

ADDITIONAL_SOURCES = picosoc_noflash.v picorv32.v progmem.v simpleuart.v


ifeq (${BOARD}, qmtech)
PART = xc7k325tffg676-1
else ifeq (${BOARD}, genesys2)
PART = xc7k325tffg900-2
else ifeq (${BOARD}, kx2)
PART = xc7k160tffg676-2
JTAG_LINK = -c ft2232
else ifeq (${BOARD}, hpc_420t)
PART = xc7k420tffg901-1
JTAG_LINK = -c ft4232
else
.PHONY: check
check:
	@echo "BOARD environment variable not set. Available boards:"
	@echo " * qmtech"
	@echo " * genesys2"
	@echo " * kx2"
	@echo " * hpc_420t"
	@exit 1
endif

TOP=${BOARD}
TOP_MODULE=top
XDC=picosoc-${BOARD}.xdc

include ../openXC7.mk
