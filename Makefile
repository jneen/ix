JIM_PATH = ./deps/jimtcl
JIM_NCURSES = ./deps/jim-ncurses
JIMSH = $(JIM_PATH)/jimsh

.PHONY: deps
deps:
	cd $(JIM_NCURSES) && JIM_PATH=../jimtcl make

.PHONY: run
run:
	$(JIMSH) ./bin/ix

.PHONY: test
test:
	$(JIMSH) ./test/runner.tcl
