SRC := ${shell find . -type f -name \*.scala}

all: VexRiscv.v VexRiscv_Debug.v VexRiscv_Lite.v VexRiscv_LiteDebug.v VexRiscv_LiteDebugHwBP.v VexRiscv_IMAC.v VexRiscv_IMACDebug.v VexRiscv_Min.v VexRiscv_MinDebug.v VexRiscv_MinDebugHwBP.v VexRiscv_Full.v VexRiscv_FullDebug.v VexRiscv_FullCfu.v VexRiscv_FullCfuDebug.v VexRiscv_Linux.v VexRiscv_LinuxDebug.v VexRiscv_LinuxNoDspFmax.v VexRiscv_Secure.v VexRiscv_SecureDebug.v

ifeq (,$(wildcard ext/VexRiscv/.github))
$(error Must init/update submodule to get VexRiscv source. Run "git submodule update --init")
endif

VexRiscv.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault"

VexRiscv_Debug.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault -d --hardwareBreakpointCount 2 --outputFile VexRiscv_Debug"

VexRiscv_Lite.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --iCacheSize 2048 --dCacheSize 0 --mulDiv true --singleCycleShift false --singleCycleMulDiv false  --outputFile VexRiscv_Lite"

VexRiscv_LiteDebug.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault -d --iCacheSize 2048 --dCacheSize 0 --mulDiv true --singleCycleShift false --singleCycleMulDiv false --outputFile VexRiscv_LiteDebug"

VexRiscv_LiteDebugHwBP.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault -d --hardwareBreakpointCount 2 --iCacheSize 2048 --dCacheSize 0 --mulDiv true --singleCycleShift false --singleCycleMulDiv false --outputFile VexRiscv_LiteDebugHwBP"

VexRiscv_IMAC.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --csrPluginConfig all --atomics true --compressedGen true --outputFile VexRiscv_IMAC"

VexRiscv_IMACDebug.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --csrPluginConfig all --atomics true --compressedGen true -d --hardwareBreakpointCount 2 --outputFile VexRiscv_IMACDebug"

VexRiscv_Min.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --iCacheSize 0 --dCacheSize 0 --mulDiv false --singleCycleShift false --singleCycleMulDiv false --bypass false --prediction none --outputFile VexRiscv_Min"

VexRiscv_MinDebug.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault -d --iCacheSize 0 --dCacheSize 0 --mulDiv false --singleCycleShift false --singleCycleMulDiv false --bypass false --prediction none --outputFile VexRiscv_MinDebug"

VexRiscv_MinDebugHwBP.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault -d --hardwareBreakpointCount 2 --iCacheSize 0 --dCacheSize 0 --mulDiv false --singleCycleShift false --singleCycleMulDiv false --bypass false --prediction none --outputFile VexRiscv_MinDebugHwBP"

VexRiscv_Full.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --csrPluginConfig all --outputFile VexRiscv_Full"

VexRiscv_FullDebug.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --csrPluginConfig all -d --hardwareBreakpointCount 2 --outputFile VexRiscv_FullDebug"

VexRiscv_FullCfu.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --csrPluginConfig all --cfu true --outputFile VexRiscv_FullCfu"

VexRiscv_FullCfuDebug.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --csrPluginConfig all --cfu true -d --hardwareBreakpointCount 2 --outputFile VexRiscv_FullCfuDebug"

VexRiscv_Linux.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --csrPluginConfig linux-minimal --outputFile VexRiscv_Linux"

VexRiscv_LinuxDebug.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --csrPluginConfig linux-minimal -d --hardwareBreakpointCount 2 --outputFile VexRiscv_LinuxDebug"

VexRiscv_LinuxNoDspFmax.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --csrPluginConfig linux-minimal --singleCycleMulDiv=false --relaxedPcCalculation=true --prediction=none --outputFile VexRiscv_LinuxNoDspFmax"

VexRiscv_Secure.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --pmpRegions 16 --pmpGranularity 256 --csrPluginConfig secure --outputFile VexRiscv_Secure"

VexRiscv_SecureDebug.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --pmpRegions 16 --pmpGranularity 256 --csrPluginConfig secure -d --hardwareBreakpointCount 2 --outputFile VexRiscv_SecureDebug"
