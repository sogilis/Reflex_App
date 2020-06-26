##                      Copyright (C) 2017, Sogilis                          ##

PROG := valves
PROG_IMPL := $(PROG)_impl
PROG_TESTS := $(PROG)_tests

TARGET ?= native
BUILD_TYPE ?= development
FILE_EXT ?= feature

GENERATED_SOURCE_DIR := generated
STEP_DEFINITIONS := step_definitions

GPRCLEAN := gprclean
GPRBUILD := gprbuild
GNATCOV := gnatcov
GNATPROVE := gnatprove
GNATCHECK := gnatcheck
GNATMETRIC := gnatmetric

GPRBUILD_FLAGS := -p -v

XREQ := xreq
XREQ_EXEC_FLAGS := -eargs --tags ~@wip

FLASH := st-flash
DBG_SERVER := st-util --semihosting -v
GDB  := arm-eabi-gdb
ARM_OBJ_COPY := arm-eabi-objcopy

$(info *******************************************************************************)
$(info MODULE: ${PROG})
$(info *******************************************************************************)
$(info $$BUILD_TYPE is [${BUILD_TYPE}])
$(info $$TARGET     is [${TARGET}])
$(info $$PROG       is [${PROG}])
$(info $$PROG_IMPL  is [${PROG_IMPL}])
$(info $$PROG_TESTS is [${PROG_TESTS}])
$(info *******************************************************************************)

.PHONY: all clean analyze configure build build-tests run-tests flash igdb gdb stutil

all: clean configure build build-tests run-tests

clean:
	if test -d ./obj; then gprclean -P $(PROG_IMPL).gpr; fi
	if test -d ./obj; then gprclean -P $(PROG_TESTS).gpr; fi
	if test -d ./bin; then rm -rf ./bin; fi
	if test -d ./lib; then rm -rf ./lib; fi
	if test -d ./obj; then rm -rf ./obj; fi
	if test -d tests/$(GENERATED_SOURCE_DIR); then rm -rf tests/$(GENERATED_SOURCE_DIR); fi
	if test -d ./reports; then rm -rf ./reports; fi
	rm -f *.log
	rm -f *.TMP

analyze:
	mkdir -p ./reports/check
	-$(GNATCHECK) --subdirs=reports/check -xml -U -XPRJ_BUILD_TYPE=analyze -P $(PROG_IMPL).gpr
	find ./obj/. -name "*gnatcheck*" -exec cp '{}' ./reports/check/. \;
	mkdir -p ./reports/metrics
	-$(GNATMETRIC) --subdirs=reports/metrics -xs -U -XPRJ_BUILD_TYPE=analyze -P $(PROG_IMPL).gpr
	find ./obj/. -name "*metrix*" -exec cp '{}' ./reports/metrics/. \;
#	mkdir -p ./reports/prove
#	-$(GNATPROVE) -U -XPRJ_BUILD_TYPE=analyze -P $(PROG_IMPL).gpr
#	find ./obj/. -name gnatprove.out -exec cp '{}' ./reports/prove/. \;

configure:
	cd tests && $(XREQ) --fill-steps-in $(STEP_DEFINITIONS) --output ./$(GENERATED_SOURCE_DIR) ./features/*.$(FILE_EXT)
	cd tests && $(XREQ) --target $(TARGET) --quiet --progress --executable $(PROG_TESTS) --step ./features/$(STEP_DEFINITIONS) --output ./$(GENERATED_SOURCE_DIR) ./features/*.$(FILE_EXT)

build: 
	$(GPRBUILD) $(GPRBUILD_FLAGS) -XPRJ_BUILD_TYPE=$(BUILD_TYPE) -XPRJ_TARGET=$(TARGET) -XPRJ_PLATFORM=$(PLATFORM) -P $(PROG_IMPL).gpr

build-tests: 
	$(GPRBUILD) $(GPRBUILD_FLAGS) -XPRJ_BUILD_TYPE=$(BUILD_TYPE) -XPRJ_TARGET=$(TARGET) -XPRJ_PLATFORM=$(PLATFORM) -P $(PROG_TESTS).gpr
ifeq ($(TARGET),arm-eabi)
	$(ARM_OBJ_COPY) -O binary bin/$(PROG_TESTS).elf bin/$(PROG_TESTS).elf.bin
endif

run-tests:
	if test -f ./$(TARGET)_$(BUILD_TYPE)_$(PLATFORM)_$(PROG).log; then rm -f ./$(TARGET)_$(BUILD_TYPE)_$(PLATFORM)_$(PROG).log; fi
ifeq ($(TARGET),arm-eabi)
	$(FLASH) --reset --format binary write bin/$(PROG_TESTS).elf.bin 0x8000000
#	$(DBG_SERVER) > $(TARGET)_$(BUILD_TYPE)_$(PLATFORM)_$(PROG).log 2>&1
	$(DBG_SERVER) & $(GDB) --batch-silent --eval-command="target extended-remote localhost:4242" bin/$(PROG_TESTS).elf --eval-command="monitor reset" --eval-command="continue"
endif
ifeq ($(TARGET),native)
	$(GNATCOV) run -P $(PROG_TESTS).gpr --recursive -c stmt -o obj/$(PROG_TESTS).trace bin/$(PROG_TESTS) $(XREQ_EXEC_FLAGS)
	$(GNATCOV) coverage -P $(PROG_TESTS).gpr --recursive -c stmt --annotate=dhtml --output-dir obj/ -T obj/$(PROG_TESTS).trace
	mkdir -p ./reports/coverage/$(PROG)
	find ./obj -name "*.html" -exec cp '{}' ./reports/coverage/$(PROG)/. \;
	find ./obj -name "*.js" -exec cp '{}' ./reports/coverage/$(PROG)/. \;
endif

flash:
	$(FLASH) --reset --format binary write bin/$(PROG_TESTS).elf.bin 0x8000000

igdb:
	$(GDB) --eval-command="target remote localhost:4242" bin/$(PROG_TESTS).elf --eval-command="monitor reset halt" --eval-command="continue"

gdb:
	$(GDB) --batch-silent --eval-command="target remote localhost:4242" bin/$(PROG_TESTS).elf --eval-command="monitor reset halt" --eval-command="continue"

stutil:
	$(DBG_SERVER)

