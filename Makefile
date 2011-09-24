JIM_PATH = ./deps/jimtcl
JIM_NCURSES = ./deps/jim-ncurses
JIMSH = $(JIM_PATH)/jimsh

.PHONY: deps
deps:
	cd $(JIM_NCURSES) && JIM_PATH=../jimtcl make

.PHONY: run
run: deps
	$(JIMSH) ./bin/ix

.PHONY: test
test: deps
	$(JIMSH) ./test/runner.tcl
