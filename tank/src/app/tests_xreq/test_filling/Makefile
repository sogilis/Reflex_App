
PROG := filling
PROG_IMPL := $(PROG)_impl
PROG_TESTS := $(PROG)_tests

TARGET ?= native
BUILD_TYPE ?= development
FILE_EXT ?= feature

CURRENT_DIR := $(shell pwd)
REPORTS_DIR ?= $(CURRENT_DIR)/reports

GENERATED_SOURCE_DIR := generated
STEP_DEFINITIONS := step_definitions

GPRCLEAN := gprclean
GPRBUILD := gprbuild

GPRBUILD_FLAGS := -p -v

XREQ := xreq
XREQ_EXEC_FLAGS := --format HTML --output xreq_report.html

$(info *******************************************************************************)
$(info MODULE: ${PROG})
$(info *******************************************************************************)
$(info $$PROG       is [${PROG}])
$(info $$PROG_IMPL  is [${PROG_IMPL}])
$(info $$PROG_TESTS is [${PROG_TESTS}])
$(info *******************************************************************************)

.PHONY: all clean configure build build-tests run-tests reports

all: clean configure build build-tests run-tests reports

clean:
	if test -d ./obj; then gprclean -P $(PROG_IMPL).gpr; fi
	if test -d ./obj; then gprclean -P $(PROG_TESTS).gpr; fi
	if test -d ./bin; then rm -rf ./bin; fi
	if test -d ./lib; then rm -rf ./lib; fi
	if test -d ./obj; then rm -rf ./obj; fi
	if test -d tests/$(GENERATED_SOURCE_DIR); then rm -rf tests/$(GENERATED_SOURCE_DIR); fi
	if test -d ./reports; then rm -rf ./reports; fi
	rm -f *.html
	rm -f *.TMP

configure:
	cd tests && $(XREQ) --fill-steps-in $(STEP_DEFINITIONS) --output ./$(GENERATED_SOURCE_DIR) ./features/*.$(FILE_EXT)
	cd tests && $(XREQ) --target $(TARGET) --quiet --progress --executable $(PROG_TESTS) --step ./features/$(STEP_DEFINITIONS) --output ./$(GENERATED_SOURCE_DIR) ./features/*.$(FILE_EXT)

build: 
	$(GPRBUILD) $(GPRBUILD_FLAGS) -P $(PROG_IMPL).gpr

build-tests: 
	$(GPRBUILD) $(GPRBUILD_FLAGS) -P $(PROG_TESTS).gpr

run-tests:
	if test -f ./xreq_report.html; then rm -f ./xreq_report.html; fi

	bin/$(PROG_TESTS) $(XREQ_EXEC_FLAGS)

reports: 
	mkdir -p $(REPORTS_DIR)/$(PROG)/xreq
	cp -f ./xreq_report.html $(REPORTS_DIR)/$(PROG)/xreq/. 
	cp ../../../../reports_templates/root_report_tests.html $(REPORTS_DIR)/$(PROG)/report.html
