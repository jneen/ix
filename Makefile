JIM_PATH = ./deps/jimtcl
JIM_NCURSES = ./deps/jim-ncurses
JIMSH = $(JIM_PATH)/jimsh

.PHONY: deps
deps:
	cd $(JIM_NCURSES) && JIM_PATH=../jimtcl make

run:
	./deps/jimtcl/jimsh ./bin/ix
