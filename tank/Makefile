
CURRENT_DIR := $(shell pwd)
REPORTS_DIR ?= $(CURRENT_DIR)/reports
GPRBUILD := gprbuild

GPRBUILD_FLAGS := -p -v

# --------------------------------------------------------------------------- #
# All reachable targets
# --------------------------------------------------------------------------- #
.PHONY : clean reports build-tests run-tests

# --------------------------------------------------------------------------- #
# TARGET: clean
# --------------------------------------------------------------------------- #
clean:
	if test -d ./reports; then rm -rf ./reports; fi
	if test -f src/devices/tests_xreq/test_pumps/Makefile; then $(MAKE) -C src/devices/tests_xreq/test_pumps $(@F); fi
	if test -f src/devices/tests_xreq/test_blenders/Makefile; then $(MAKE) -C src/devices/tests_xreq/test_blenders $(@F); fi
	if test -f src/devices/tests_xreq/test_valves/Makefile; then $(MAKE) -C src/devices/tests_xreq/test_valves $(@F); fi
	if test -f src/app/tests_xreq/test_filling/Makefile; then $(MAKE) -C src/app/tests_xreq/test_filling $(@F); fi
	if test -f src/app/tests_xreq/test_mixing/Makefile; then $(MAKE) -C src/app/tests_xreq/test_mixing $(@F); fi
	if test -f src/app/tests_xreq/test_cycle/Makefile; then $(MAKE) -C src/app/tests_xreq/test_cycle $(@F); fi

# --------------------------------------------------------------------------- #
# TARGET: configure
# --------------------------------------------------------------------------- #
configure:
	if test -f src/devices/tests_xreq/test_pumps/Makefile; then $(MAKE) -C src/devices/tests_xreq/test_pumps configure; fi
	if test -f src/devices/tests_xreq/test_blenders/Makefile; then $(MAKE) -C src/devices/tests_xreq/test_blenders configure; fi
	if test -f src/devices/tests_xreq/test_valves/Makefile; then $(MAKE) -C src/devices/tests_xreq/test_valves configure; fi
	if test -f src/app/tests_xreq/test_filling/Makefile; then $(MAKE) -C src/app/tests_xreq/test_filling configure; fi
	if test -f src/app/tests_xreq/test_mixing/Makefile; then $(MAKE) -C src/app/tests_xreq/test_mixing configure; fi
	if test -f src/app/tests_xreq/test_cycle/Makefile; then $(MAKE) -C src/app/tests_xreq/test_cycle configure; fi


# --------------------------------------------------------------------------- #
# TARGET: build-tests
# --------------------------------------------------------------------------- #
build-tests: 
	if test -f src/devices/tests_xreq/test_pumps/Makefile; then $(MAKE) -C src/devices/tests_xreq/test_pumps build-tests; fi
	if test -f src/devices/tests_xreq/test_blenders/Makefile; then $(MAKE) -C src/devices/tests_xreq/test_blenders build-tests; fi
	if test -f src/devices/tests_xreq/test_valves/Makefile; then $(MAKE) -C src/devices/tests_xreq/test_valves build-tests; fi
	if test -f src/app/tests_xreq/test_filling/Makefile; then $(MAKE) -C src/app/tests_xreq/test_filling build-tests; fi
	if test -f src/app/tests_xreq/test_mixing/Makefile; then $(MAKE) -C src/app/tests_xreq/test_mixing build-tests; fi
	if test -f src/app/tests_xreq/test_cycle/Makefile; then $(MAKE) -C src/app/tests_xreq/test_cycle build-tests; fi



# --------------------------------------------------------------------------- #
# TARGET: run-tests
# --------------------------------------------------------------------------- #
run-tests: 
	if test -f src/devices/tests_xreq/test_pumps/Makefile; then $(MAKE) -C src/devices/tests_xreq/test_pumps run-tests; fi
	if test -f src/devices/tests_xreq/test_blenders/Makefile; then $(MAKE) -C src/devices/tests_xreq/test_blenders run-tests; fi
	if test -f src/devices/tests_xreq/test_valves/Makefile; then $(MAKE) -C src/devices/tests_xreq/test_valves run-tests; fi
	if test -f src/app/tests_xreq/test_filling/Makefile; then $(MAKE) -C src/app/tests_xreq/test_filling run-tests; fi
	if test -f src/app/tests_xreq/test_mixing/Makefile; then $(MAKE) -C src/app/tests_xreq/test_mixing run-tests; fi
	if test -f src/app/tests_xreq/test_cycle/Makefile; then $(MAKE) -C src/app/tests_xreq/test_cycle run-tests; fi

# --------------------------------------------------------------------------- #
# TARGET: reports
# --------------------------------------------------------------------------- #
reports:
	if test -f src/devices/tests_xreq/test_pumps/Makefile; then REPORTS_DIR=$(REPORTS_DIR) $(MAKE) -C src/devices/tests_xreq/test_pumps $(@F); fi
	if test -f src/devices/tests_xreq/test_blenders/Makefile; then REPORTS_DIR=$(REPORTS_DIR) $(MAKE) -C src/devices/tests_xreq/test_blenders $(@F); fi
	if test -f src/devices/tests_xreq/test_valves/Makefile; then REPORTS_DIR=$(REPORTS_DIR) $(MAKE) -C src/devices/tests_xreq/test_valves $(@F); fi
	if test -f src/app/tests_xreq/test_filling/Makefile; then REPORTS_DIR=$(REPORTS_DIR) $(MAKE) -C src/app/tests_xreq/test_filling $(@F); fi
	if test -f src/app/tests_xreq/test_mixing/Makefile; then REPORTS_DIR=$(REPORTS_DIR) $(MAKE) -C src/app/tests_xreq/test_mixing $(@F); fi
	if test -f src/app/tests_xreq/test_cycle/Makefile; then REPORTS_DIR=$(REPORTS_DIR) $(MAKE) -C src/app/tests_xreq/test_cycle $(@F); fi
	cp reports_templates/root_reports_list.html $(REPORTS_DIR)/index.html


