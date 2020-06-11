##                      Copyright (C) 2020, Sogilis                          ##

PROG := xreq

TARGET ?= native
BUILD_TYPE ?= development
FILE_EXT ?= feature

GNAT_ENV ?= local
ifeq ($(GNAT_ENV),gnat_gpl)
GNAT_COMPILER_LOCATION := docker run --rm -u vscode -v /etc/localtime:/etc/localtime -v "$$PWD":/home/dev -w /home/dev dgautherot/gnat-community:x86_64-linux.2019.1
else
GNAT_COMPILER_LOCATION :=
endif

GPRINSTALL := gprinstall

GPRCLEAN := gprclean
GPRCLEAN_FLAGS := -r

GPRBUILD := gprbuild
GPRBUILD_FLAGS := -p

GNATCOV := gnatcov
GNATPROVE := gnatprove
GNATCHECK := gnatcheck
GNATMETRIC := gnatmetric

BUILD_DIR := build
DEPLOY_DIR := dist
DEPLOY_TEST_DIR := dist_dev

ARM_GCC_PATH := $(shell which arm-eabi-gcc)

PROJECT_ROOT_DIR := $(strip $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST)))))
$(info $$PROJECT_ROOT_DIR is [$(PROJECT_ROOT_DIR)])

CURRENT_DIR := $(shell pwd)
CURRENT_VERSION := dev-$(shell git rev-parse HEAD | cut -c -7)

DESTDIR=
INSTALL_PREFIX=install
exec_prefix=${INSTALL_PREFIX}
datarootdir=${INSTALL_PREFIX}/share
datadir=${DESTDIR}${datarootdir}
bindir=${DESTDIR}${exec_prefix}/bin
libdir=${DESTDIR}${exec_prefix}/lib
includedir=${DESTDIR}${INSTALL_PREFIX}/include
projectsubdir=lib/gnat
projectdir=${DESTDIR}${INSTALL_PREFIX}/${projectsubdir}

MKDIR=mkdir -p
CP=cp -p

XREQ_EXEC := xreq
XREQ_EXEC_FLAGS := -eargs --tags ~@wip --format HTML --output tests/integ/obj/xreq_html_report.log

GENERATED_SOURCE_DIR := generated
STEP_DEFINITIONS := step_definitions

# --------------------------------------------------------------------------- #
# Function to help the deployment into a configurable directory
# --------------------------------------------------------------------------- #
define func_deploy =
	if test -d ./$(1); then rm -rf ./$(1); fi
	mkdir -p ./$(1)
	mkdir -p ./$(1)/bin
	mkdir -p ./$(1)/doc
	mkdir -p ./$(1)/lib/x86_64
	mkdir -p ./$(1)/lib/arm-eabi
	mkdir -p ./$(1)/lib/gnat
	mkdir -p ./$(1)/lib/gps
	mkdir -p ./$(1)/include/x86_64
	mkdir -p ./$(1)/include/arm-eabi
	mkdir -p ./$(1)/share/examples
	mkdir -p ./$(1)/share/gprconfig
	mkdir -p ./$(1)/share/gps/plugins
	mkdir -p ./$(1)/share/gps/icons/24px
	if test -f ./$(BUILD_DIR)/bin/$(BUILD_TYPE)/native/xreq; then cp ./$(BUILD_DIR)/bin/$(BUILD_TYPE)/native/xreq ./$(1)/bin/.; fi
	if test -f ./$(BUILD_DIR)/lib/$(BUILD_TYPE)/arm-eabi/libxreq.a; then cp -rf ./$(BUILD_DIR)/lib/$(BUILD_TYPE)/arm-eabi/* ./$(1)/lib/arm-eabi/.; fi
	if test -f ./$(BUILD_DIR)/lib/$(BUILD_TYPE)/native/libxreq.a; then cp -rf ./$(BUILD_DIR)/lib/$(BUILD_TYPE)/native/* ./$(1)/lib/x86_64/.; fi
	if test -d ./$(BUILD_DIR)/obj/$(BUILD_TYPE)/arm-eabi; then cp -rf ./$(BUILD_DIR)/obj/$(BUILD_TYPE)/arm-eabi/*.ci ./$(1)/lib/arm-eabi/.; fi
	if test -d ./$(BUILD_DIR)/obj/$(BUILD_TYPE)/native; then cp -rf ./$(BUILD_DIR)/obj/$(BUILD_TYPE)/native/*.ci ./$(1)/lib/x86_64/.; fi
	cp -rf ./src/xreqlib/common/*.ad[bs] ./$(1)/include/x86_64/.
	cp -rf ./src/xreqlib/x86_64/*.ad[bs] ./$(1)/include/x86_64/.
	cp -rf ./src/xreqlib/common/*.ad[bs] ./$(1)/include/arm-eabi/.
	cp -rf ./src/xreqlib/arm-eabi/*.ad[bs] ./$(1)/include/arm-eabi/.
	cp ./scripts/doinstall.sh ./$(1)/.
	cp ./scripts/xreq-gprconfig.xml ./$(1)/share/gprconfig/xreq.xml
	cp ./scripts/xreqlib.gpr ./$(1)/lib/gnat/.
	cp ./src/gps_plugin/xreq.png ./$(1)/share/gps/icons/24px/xreq.png
	cp ./src/gps_plugin/*.xml ./$(1)/share/gps/plugins/.
	cp ./src/gps_plugin/*.py ./$(1)/share/gps/plugins/.
	cp -rf ./examples/* ./$(1)/share/examples/.
	cp ./doc/* ./$(1)/doc/.
	cp ./COPYING ./$(1)/.
endef

$(info *******************************************************************************)
$(info MODULE: ${PROG})
$(info *******************************************************************************)
$(info $$BUILD_TYPE is [${BUILD_TYPE}])
$(info $$TARGET     is [${TARGET}])
$(info $$PROG       is [${PROG}])
$(info *******************************************************************************)

# --------------------------------------------------------------------------- #
# Specific part
# --------------------------------------------------------------------------- #
.PHONY : help clean analyze dist build build-tests run-tests dev release install examples

# --------------------------------------------------------------------------- #
# TARGET: help
# --------------------------------------------------------------------------- #
help:
	@echo "make TARGET"
	@echo
	@echo "TARGETS:"
	@echo
	@echo "    clean:             Clean project"
	@echo "    build:             Build everything for installation"
	@echo "    build-tests:       Build all unit and integration tests"
	@echo "    dev:               Shortcut to do everything for a development build [build build-tests run-tests analyze dist]"
	@echo "    dist:              Prepare a dist directory for future installation"
	@echo "    help:              Distplay this help message"
	@echo "    release:           Shortcut to do everything for a production release build [build dist]"
	@echo "    run-tests:         Run all unit and integration tests"
	@echo
	@echo "VARIABLES:"
	@echo
	@echo "    BUILD_TYPE         Type of build, default is [$(BUILD_TYPE)]"
	@echo "                       Possible values are:"
	@echo "                          - development"
	@echo "                          - production"
	@echo "    TARGET             Target type for execution, default is [$(BUILD_TYPE)]"
	@echo "                       This variable is used only for examples projects demo"
	@echo "                       Possible values are:"
	@echo "                          - native"
	@echo "                          - arm-eabi"
	@echo "    GNAT_ENV           Defines which compiler type to use, default is [$(GNAT_ENV)]"
	@echo "                       Possible values are:"
	@echo "                          - local or no value"
	@echo "                          - gnat_gpl"
	@echo

# --------------------------------------------------------------------------- #
# TARGET: clean
# --------------------------------------------------------------------------- #
clean:
	if test -d ./$(BUILD_DIR); then rm -rf ./$(BUILD_DIR); fi
	if test -d ./$(DEPLOY_DIR); then rm -rf ./$(DEPLOY_DIR); fi
	if test -d ./$(DEPLOY_TEST_DIR); then rm -rf ./$(DEPLOY_TEST_DIR); fi
	if test -d ./$(INSTALL_PREFIX); then rm -rf ./$(INSTALL_PREFIX); fi
	if test -d ./reports; then rm -rf ./reports; fi
	if test -d ./tests/unit/bin; then rm -rf ./tests/unit/bin; fi
	if test -d ./tests/unit/lib; then rm -rf ./tests/unit/lib; fi
	if test -d ./tests/unit/obj; then rm -rf ./tests/unit/obj; fi
	if test -d ./tests/unit/tmp; then rm -rf ./tests/unit/tmp; fi
	if test -d ./tests/unit/data/features/tests; then rm -rf ./tests/unit/data/features/tests; fi
	if test -d ./tests/integ/src/generated; then rm -rf ./tests/integ/src/generated; fi
	if test -d ./tests/integ/bin; then rm -rf ./tests/integ/bin; fi
	if test -d ./tests/integ/lib; then rm -rf ./tests/integ/lib; fi
	if test -d ./tests/integ/obj; then rm -rf ./tests/integ/obj; fi
	if test -d ./tests/integ/tmp; then rm -rf ./tests/integ/tmp; fi

# --------------------------------------------------------------------------- #
# TARGET: analyze
# --------------------------------------------------------------------------- #
analyze:
	mkdir -p ./reports/check/xreq_lib
	-${GNAT_COMPILER_LOCATION} $(GNATCHECK) --subdirs=reports/check/xreq_lib -xml -U -XPRJ_BUILD_TYPE=analyze -P xreq_lib.gpr
	find ./$(BUILD_DIR)/obj/analyze/native/reports/check/xreq_lib/. -name "*gnatcheck*" -exec cp '{}' ./reports/check/xreq_lib/. \;
	mkdir -p ./reports/check/xreq_generator
	-${GNAT_COMPILER_LOCATION} $(GNATCHECK) --subdirs=reports/check/xreq_generator -xml -U -XPRJ_BUILD_TYPE=analyze -P xreq_generator.gpr
	find ./$(BUILD_DIR)/obj/analyze/native/reports/check/xreq_generator/. -name "*gnatcheck*" -exec cp '{}' ./reports/check/xreq_generator/. \;
	mkdir -p ./reports/metrics/xreq_lib
	-${GNAT_COMPILER_LOCATION} $(GNATMETRIC) --subdirs=reports/metrics/xreq_lib -xs -U -XPRJ_BUILD_TYPE=analyze -P xreq_lib.gpr
	find ./$(BUILD_DIR)/obj/analyze/native/reports/metrics/xreq_lib/. -name "*metrix*" -exec cp '{}' ./reports/metrics/xreq_lib/. \;
	mkdir -p ./reports/metrics/xreq_generator
	-${GNAT_COMPILER_LOCATION} $(GNATMETRIC) --subdirs=reports/metrics/xreq_generator -xs -U -XPRJ_BUILD_TYPE=analyze -P xreq_generator.gpr
	find ./$(BUILD_DIR)/obj/analyze/native/reports/metrics/xreq_generator/. -name "*metrix*" -exec cp '{}' ./reports/metrics/xreq_generator/. \;
#	mkdir -p ./reports/prove
#	-${GNAT_COMPILER_LOCATION} $(GNATPROVE) -U -XPRJ_BUILD_TYPE=analyze -P $(PROG_IMPL).gpr
#	find ./obj/. -name gnatprove.out -exec cp '{}' ./reports/prove/. \;

# --------------------------------------------------------------------------- #
# TARGET: dist
# --------------------------------------------------------------------------- #
dist:
	$(call func_deploy,$(DEPLOY_DIR)/xreq-$(CURRENT_VERSION))
	if test -f ./$(DEPLOY_DIR)/xreq-$(CURRENT_VERSION).tar.gz; then rm -rf ./$(DEPLOY_DIR)/xreq-$(CURRENT_VERSION).tar.gz; fi
	cd $(DEPLOY_DIR) && tar -zcf xreq-$(CURRENT_VERSION).tar.gz *

# --------------------------------------------------------------------------- #
# TARGET: build
# --------------------------------------------------------------------------- #
build:
	${GNAT_COMPILER_LOCATION} $(GPRBUILD) $(GPRBUILD_FLAGS) -XPRJ_TARGET=native -XPRJ_BUILD_TYPE=$(BUILD_TYPE) -P xreq_lib.gpr
ifneq ($(ARM_GCC_PATH),)
	${GNAT_COMPILER_LOCATION} $(GPRBUILD) $(GPRBUILD_FLAGS) -XPRJ_TARGET=arm-eabi -XPRJ_BUILD_TYPE=$(BUILD_TYPE) -P xreq_lib.gpr
endif
	${GNAT_COMPILER_LOCATION} $(GPRBUILD) $(GPRBUILD_FLAGS) -XPRJ_TARGET=native -XPRJ_BUILD_TYPE=$(BUILD_TYPE) -P xreq_generator.gpr

# --------------------------------------------------------------------------- #
# TARGET: deploy-tests
# --------------------------------------------------------------------------- #
deploy-tests:
	$(call func_deploy,$(DEPLOY_TEST_DIR))

# --------------------------------------------------------------------------- #
# TARGET: build-unit-tests
# --------------------------------------------------------------------------- #
build-unit-tests:
	$(info *******************************************************************************)
	$(info Unit Tests)
	$(info *******************************************************************************)
	${GNAT_COMPILER_LOCATION} $(GPRBUILD) $(GPRBUILD_FLAGS) -XPRJ_TARGET=native -XPRJ_BUILD_TYPE=$(BUILD_TYPE) -P tests/unit/unit_tests.gpr

# --------------------------------------------------------------------------- #
# TARGET: build-feature-tests
# --------------------------------------------------------------------------- #
build-feature-tests:
	$(info *******************************************************************************)
	$(info Feature Tests)
	$(info *******************************************************************************)
	rm -rf ./tests/integ/tmp
	./$(DEPLOY_TEST_DIR)/bin/$(XREQ_EXEC) --fill-steps-in step_definitions --output ./tests/integ/src/generated ./tests/integ/src/features/*.$(FILE_EXT)
	./$(DEPLOY_TEST_DIR)/bin/$(XREQ_EXEC) --target $(TARGET) --quiet --progress --executable feature_tests --step ./tests/integ/src/features/step_definitions --output ./tests/integ/src/generated ./tests/integ/src/features/*.$(FILE_EXT)
	${GNAT_COMPILER_LOCATION} $(GPRBUILD) $(GPRBUILD_FLAGS) -XPRJ_TARGET=native -XPRJ_BUILD_TYPE=$(BUILD_TYPE) -P tests/integ/feature_tests.gpr

# --------------------------------------------------------------------------- #
# TARGET: build-tests
# --------------------------------------------------------------------------- #
build-tests: deploy-tests build-unit-tests build-feature-tests

# --------------------------------------------------------------------------- #
# TARGET: run-unit-tests
# --------------------------------------------------------------------------- #
run-unit-tests:
	$(info *******************************************************************************)
	$(info Unit Tests)
	$(info *******************************************************************************)
	${GNAT_COMPILER_LOCATION} $(GNATCOV) run -XPRJ_BUILD_TYPE=$(BUILD_TYPE) -P tests/unit/unit_tests.gpr --recursive -c stmt -o tests/unit/obj/unit_tests.trace tests/unit/bin/unit_tests
	${GNAT_COMPILER_LOCATION} $(GNATCOV) coverage -XPRJ_BUILD_TYPE=$(BUILD_TYPE) -P xreq_generator.gpr --recursive -c stmt --annotate=dhtml --output-dir tests/unit/obj/ -T tests/unit/obj/unit_tests.trace
	mkdir -p ./reports/coverage/unit_tests
	find tests/unit/obj/. -name "*.html" -exec cp '{}' ./reports/coverage/unit_tests/. \;
	find tests/unit/obj/. -name "*.css" -exec cp '{}' ./reports/coverage/unit_tests/. \;
	find tests/unit/obj/. -name "*.js" -exec cp '{}' ./reports/coverage/unit_tests/. \;

# --------------------------------------------------------------------------- #
# TARGET: run-feature-tests
# --------------------------------------------------------------------------- #
run-feature-tests: export XREQ_DIR := $(shell pwd)/$(DEPLOY_TEST_DIR)
run-feature-tests: export PATH := $(XREQ_DIR)/bin:$(shell echo $$PATH)
run-feature-tests: export GPR_PROJECT_PATH := $(XREQ_DIR)/lib/gnat
run-feature-tests: export LD_LIBRARY_PATH := $(XREQ_DIR)/lib::$(shell echo $$LD_LIBRARY_PATH)
run-feature-tests: export FEATURE_TEST_DIR := $(shell pwd)/tests/integ
run-feature-tests:
	$(info *******************************************************************************)
	$(info Feature Tests)
	$(info *******************************************************************************)
	mkdir -p ./tests/integ/tmp
	cp -rf ./tests/integ/data/step_definitions ./tests/integ/tmp/.
	${GNAT_COMPILER_LOCATION} $(GNATCOV) run -XPRJ_BUILD_TYPE=$(BUILD_TYPE) -P tests/integ/feature_tests.gpr --recursive -c stmt -o tests/integ/obj/feature_tests.trace tests/integ/bin/feature_tests $(XREQ_EXEC_FLAGS)
	${GNAT_COMPILER_LOCATION} $(GNATCOV) coverage -XPRJ_BUILD_TYPE=$(BUILD_TYPE) -P xreq_generator.gpr --recursive -c stmt --annotate=dhtml --output-dir tests/integ/obj/ -T tests/integ/obj/feature_tests.trace
	mkdir -p ./reports/coverage/feature_tests
	find tests/integ/obj/. -name "*.html" -exec cp '{}' ./reports/coverage/feature_tests/. \;
	find tests/integ/obj/. -name "*.css" -exec cp '{}' ./reports/coverage/feature_tests/. \;
	find tests/integ/obj/. -name "*.js" -exec cp '{}' ./reports/coverage/feature_tests/. \;
	mkdir -p ./reports/xreq/feature_tests
	find tests/integ/obj/. -name "xreq_html_report.log" -exec cp '{}' ./reports/xreq/feature_tests/xreq_report.html \;

# --------------------------------------------------------------------------- #
# TARGET: run-tests
# --------------------------------------------------------------------------- #
run-tests: run-unit-tests run-feature-tests

# --------------------------------------------------------------------------- #
# TARGET: dev
# --------------------------------------------------------------------------- #
dev: export BUILD_TYPE := development
dev: export CURRENT_VERSION := dev-$(shell git rev-parse HEAD | cut -c -7)
dev: build build-tests run-tests analyze dist

# --------------------------------------------------------------------------- #
# TARGET: release
# --------------------------------------------------------------------------- #
release: export BUILD_TYPE := production
release: export CURRENT_VERSION := stable-$(shell cat ./VERSION)-$(shell git rev-parse HEAD | cut -c -7)
release: build dist

# --------------------------------------------------------------------------- #
# TARGET: install
# --------------------------------------------------------------------------- #
install: export BUILD_TYPE := production
install: build
	${GNAT_COMPILER_LOCATION} ${GPRINSTALL} --prefix=${INSTALL_PREFIX} -q -p -f --install-name=xreq --project-subdir=${projectsubdir} -XPRJ_TARGET=native -XPRJ_BUILD_TYPE=$(BUILD_TYPE) -P xreq_lib.gpr
	${GNAT_COMPILER_LOCATION} ${GPRINSTALL} --prefix=${INSTALL_PREFIX} -q -p -f --install-name=xreq --project-subdir=${projectsubdir} -XPRJ_TARGET=native -XPRJ_BUILD_TYPE=$(BUILD_TYPE) -P xreq_generator.gpr

# --------------------------------------------------------------------------- #
# TARGET: examples
# --------------------------------------------------------------------------- #
examples: export XREQ_DIR := $(shell pwd)/$(INSTALL_PREFIX)
examples: export PATH := $(XREQ_DIR)/bin:$(shell echo $$PATH)
examples: export GPR_PROJECT_PATH := $(XREQ_DIR)/lib/gnat
examples: export LD_LIBRARY_PATH := $(XREQ_DIR)/lib::$(shell echo $$LD_LIBRARY_PATH)
examples:
	cd examples/oranges/tests && $(XREQ_EXEC) --fill-steps-in $(STEP_DEFINITIONS) --lang Ada --output ./$(GENERATED_SOURCE_DIR) ./features/*.$(FILE_EXT)
	cd examples/oranges/tests && $(XREQ_EXEC) --target $(TARGET) --lang Ada --quiet --progress --executable oranges_tests --step ./features/$(STEP_DEFINITIONS) --output ./$(GENERATED_SOURCE_DIR) ./features/*.$(FILE_EXT)
	${GNAT_COMPILER_LOCATION} sh -c "GPR_PROJECT_PATH=$(XREQ_DIR)/lib/gnat $(GPRBUILD) $(GPRBUILD_FLAGS) -XPRJ_BUILD_TYPE=$(BUILD_TYPE) -XPRJ_TARGET=native -P examples/oranges/oranges_tests.gpr"
	./examples/oranges/bin/oranges_tests
