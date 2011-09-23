source [file dirname [info script]]/../deps/jim-ncurses/lib/ncurses.tcl

proc ix.run {} {
  ncurses.do {
    stdscr puts "LOL"
    ncurses.getc
  }
}
